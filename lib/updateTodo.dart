import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_10/todo.dart';
import 'package:module_10/homeScreen.dart';

class updateTodo extends StatefulWidget {
  const updateTodo({
    super.key, required this.onTodoUpdate, required this.obj,
  });

  final todo obj ;
  final Function (String) onTodoUpdate; // here the class name is added as a parameter

  @override
  State<updateTodo> createState() => _updateTodoState();
}


class _updateTodoState extends State<updateTodo> {
  // final TextEditingController addTaskTEController = TextEditingController(text: '${widget.obj.details}'); //initialized later
  late final TextEditingController addTaskTEController = TextEditingController(text: widget.obj.details);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mySnackBar(context, message){
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
    return Padding(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Edit To-Do',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel_outlined))
              ],
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: addTaskTEController,
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return 'Please Enter a value';
                }
                return null;
              },
              maxLines: 4,
              decoration: InputDecoration(enabledBorder: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    String text = addTaskTEController.text.trim() ;
                    widget.onTodoUpdate(text);
                    mySnackBar (context , 'To Do Updated');
                    Navigator.pop(context);
                    print(text);

                  }
                },
                child: const Text("Update"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
