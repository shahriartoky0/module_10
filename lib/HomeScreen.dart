import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_10/style.dart';

import 'editInfo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenUI();
  }
}

class _HomeScreenUI extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.blue,
              ))
        ],
        backgroundColor: Colors.white70,
        elevation: 8,
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: appTextInput("Add Title"),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: appTextInput('Add Description'),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Add'))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(''),
                      ),
                      title: Text('Title here'),
                      subtitle: Text('Subtitle'),
                      trailing: Icon(Icons.arrow_forward),
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return editInfo();
                            });
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 3,
                    );
                  },
                  itemCount: 2)
            ],
          ),
        ),
      ),
    );
  }
}

