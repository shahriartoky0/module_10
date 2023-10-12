import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:module_10/todo.dart';
import 'package:module_10/updateTodo.dart';
import 'AddToDo.dart';
import 'updateTodo.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenUI();
  }
}

class _HomeScreenUI extends State<HomeScreen> {
  List<todo> toDoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do App'),
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
                      tileColor:
                          toDoList[index].status == 'DONE' ? Colors.grey : null,
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text('${toDoList[index].details}'),
                      // subtitle:Text('${toDoList[index].currentTime}'),
                      subtitle: Text(DateFormat('hh:mm a dd-MM-yy')
                          .format(toDoList[index].currentTime)),
                      trailing: Text(
                        '${toDoList[index].status.toUpperCase()}',
                        style: TextStyle(color: Colors.red),
                      ),
                      //changing status
                      onLongPress: () {
                        String currentStatus =
                            toDoList[index].status == 'pending'
                                ? 'DONE'
                                : 'pending';
                        updateTodoStatus(index, currentStatus);
                      },
                      onTap: () {
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

                                      onTap: () {
                                        Navigator.pop(context); // It took 5 hours to figure that because of this line the showModal was not working
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              print('checking  update modal');
                                              return updateTodo(
                                                obj: toDoList[index],
                                                onTodoUpdate:
                                                    (String updateDetails) {
                                                  todoUpdate(
                                                      updateDetails, index);
                                                },
                                              );
                                            });
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.delete),
                                      title: const Text('Delete'),
                                      onTap: () {
                                        deleteTodo(index);
                                        Navigator.pop(context);
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
                  itemCount: toDoList.length)
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
                print('checking the add');
                return AddToDo(
                  onAddTap: (todo) {
                    addTodo(todo);
                  },
                );
              });
        },
      ),
    );
  }

  // the functions are added here

  void addTodo(todo todo) // add function
  {
    toDoList.add(todo);
    setState(() {});
  }

  void deleteTodo(index) // delete function
  {
    toDoList.removeAt(index);
    setState(() {});
  }

  void todoUpdate(String todoDetails, int index) {
    toDoList[index].details = todoDetails;
    setState(() {});
  }

  void updateTodoStatus(int index, String status) {
    toDoList[index].status = status;
    setState(() {});

  }

}
