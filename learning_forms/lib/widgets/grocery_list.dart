import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_forms/data/categories.dart';
import 'package:learning_forms/model/grocery_item.dart';
import 'package:learning_forms/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({Key? key}) : super(key: key);

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> grosceryList = [];
  bool _isLoading = true;
  String? _error;
  void _deleteItem(GroceryItem item) async {
    final index = grosceryList.indexOf(item);
    setState(() {
      grosceryList.remove(item);
    });
    final url = Uri.https('fir-8fcf8-default-rtdb.firebaseio.com',
        'shpping-list/${item.id}.json');
    final respone = await http.delete(url);
    if (respone.statusCode >= 400) {
      setState(() {
        grosceryList.insert(index, item);
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'An error ocurred while deleting, please try again later.')));
    }
  }

  void _loadData() async {
    final url =
        Uri.https('fir-8fcf8-default-rtdb.firebaseio.com', 'shpping-list.json');
    final respone = await http.get(url);
    if (respone.statusCode >= 400) {
      setState(() {
        _error = 'An error occurred. Please try again later.';
      });
    }
    if (respone.body == 'null') {
      setState(() {
        _isLoading = false;
      });
      return;
    }
    Map<String, dynamic> theData = json.decode(respone.body);
    final List<GroceryItem> newList = [];
    for (final element in theData.entries) {
      newList.add(GroceryItem(
          id: element.key,
          name: element.value['name'],
          quantity: element.value['quantity'],
          category: categories.entries
              .firstWhere(
                  (entry) => entry.value.title == element.value['category'])
              .value));
    }
    setState(() {
      grosceryList = newList;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    content = const Center(child: Text('No grocery found...'));
    if (_isLoading) content = const Center(child: CircularProgressIndicator());
    if (grosceryList.isNotEmpty) {
      content = ListView.builder(
        itemCount: grosceryList.length,
        itemBuilder: (context, index) => Dismissible(
          onDismissed: (direction) {
            _deleteItem(grosceryList[index]);
          },
          key: Key(grosceryList[index].id),
          child: ListTile(
            title: Text(grosceryList[index].name),
            leading: Container(
              color: grosceryList[index].category.color,
              width: 24,
              height: 24,
            ),
            trailing: Text(grosceryList[index].quantity.toString()),
          ),
        ),
      );
    }
    if (_error != null) {
      content = Center(
        child: Text(_error!),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your gorceries"),
          actions: [
            IconButton(
                onPressed: () async {
                  final newItem = await Navigator.push<GroceryItem>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewItem(),
                      ));
                  if (newItem == null) return;
                  setState(() {
                    grosceryList.add(newItem);
                  });
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: content);
  }
}
