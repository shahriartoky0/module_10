import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddToDo.dart';

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
        title: Text('TO DO APP'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text('Hello'),
                      subtitle: Text('this is subtitle'),
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Actions'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: Icon(Icons.edit),
                                      title: Text('Edit'),
                                      onTap: (){
                                        //ToDO: here to Edit Task
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.delete),
                                      title: Text('Delete'),
                                      onTap: (){
                                        //ToDO: here to delete Task
                                      },
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 5,
                    );
                  },
                  itemCount: 5)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddToDo();
              });
        },
      ),
    );
  }
}
