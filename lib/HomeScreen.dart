import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenUI();
  }
}

class _HomeScreenUI extends State<HomeScreen> {
  List<Item> items = [
    Item(name: 'Item 1', isSelected: false),
    Item(name: 'Item 2', isSelected: false),
    Item(name: 'Item 3', isSelected: false),
    Item(name: 'Item 4', isSelected: false),
    Item(name: 'Item 5', isSelected: false),
    Item(name: 'Item 6', isSelected: false),
    Item(name: 'Item 7', isSelected: false),
    Item(name: 'Item 8', isSelected: false),
  ];
  int selectedCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selection Screen"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 2,
                    ),
                    ListTile(
                      title: Text('${items[index].name}'),
                      onTap: () {
                        items[index].isSelected = !items[index].isSelected;
                        if (items[index].isSelected) {
                          selectedCounter++;
                        } else {
                          selectedCounter--;
                        }

                        setState(() {});
                      },
                      tileColor: items[index].isSelected ? Colors.blue : null,
                      hoverColor: Colors.grey,
                    ),
                  ],
                );
              },
              itemCount: items.length,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //modal here
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Selected Items'),
                  content: Text('Number of selected items: $selectedCounter'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'))
                  ],
                );
              });
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
