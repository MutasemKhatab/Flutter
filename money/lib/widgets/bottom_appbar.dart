import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money/provider/page_provider.dart';

class BottomAppbar extends ConsumerStatefulWidget {
  const BottomAppbar({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _BottomAppbarState();
}

class _BottomAppbarState extends ConsumerState<BottomAppbar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(pageProvider);
          return BottomNavigationBar(
            currentIndex: provider.page,
            onTap: (int index) {
              setState(() {
                provider.page = index;
              });
              ref.watch(pageProvider.notifier).changePage(index);
            },
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                ),
                label: 'Api',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.electric_bolt_sharp),
                label: 'Spots',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_collection_outlined),
                label: 'Youtube',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
            ],
          );
        },
      ),
    );
  }
}
