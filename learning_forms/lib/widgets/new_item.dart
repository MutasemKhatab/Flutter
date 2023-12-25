import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning_forms/data/categories.dart';
import 'package:learning_forms/model/category.dart';
import 'package:learning_forms/model/grocery_item.dart';
import 'package:http/http.dart' as http;

class NewItem extends StatefulWidget {
  const NewItem({Key? key}) : super(key: key);

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredQuantity = 1;
  var _enteredName = '';
  var _enteredCategory = categories[Categories.vegetables];
  bool _isSending = false;
  void _saveItem() async {
    final success = _formKey.currentState!.validate();
    if (success) {
      _formKey.currentState!.save();
      setState(() {
        _isSending = true;
      });
      final url = Uri.https(
          'fir-8fcf8-default-rtdb.firebaseio.com', 'shpping-list.json');
      final respone = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'category': _enteredCategory!.title,
            'name': _enteredName,
            'quantity': _enteredQuantity,
          }));
      if (!context.mounted) {
        return;
      }
      final Map<String, dynamic> resID = json.decode(respone.body);
      Navigator.of(context).pop(GroceryItem(
          id: resID['name'],
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _enteredCategory!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1) {
                      return "Please enter a vaild value";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Name"),
                  ),
                  onSaved: (newValue) {
                    _enteredName = newValue!;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: _enteredQuantity.toString(),
                        decoration: const InputDecoration(
                          label: Text("Quantity"),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! <= 0) {
                            return "Please enter a vaild value";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _enteredQuantity = int.parse(newValue!);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField(
                        value: _enteredCategory,
                        items: [
                          for (final category in categories.entries)
                            DropdownMenuItem(
                                value: category.value,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 16,
                                      height: 16,
                                      color: category.value.color,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(category.value.title)
                                  ],
                                ))
                        ],
                        onChanged: (value) {
                          _enteredCategory = value!;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: _isSending
                            ? null
                            : () {
                                _formKey.currentState!.reset();
                              },
                        child: const Text("Reset")),
                    ElevatedButton(
                        onPressed: _isSending ? null : _saveItem,
                        child: _isSending
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(),
                              )
                            : const Text("Add Item"))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
