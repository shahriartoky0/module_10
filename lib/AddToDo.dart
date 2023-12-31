import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_10/todo.dart';
import 'package:module_10/homeScreen.dart';

class AddToDo extends StatefulWidget {
  AddToDo({
    super.key, required this.onAddTap,
  });
  final Function (todo) onAddTap; // here the class name is added as a parameter

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  final TextEditingController addTaskTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                  'Add To-Do',
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
                if (value?.trim().isEmpty ?? true) {
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
                    String text = addTaskTEController.text ;
                  todo obj =  todo(details: text, currentTime: DateTime.now(), updatedTime: DateTime.now());
                    print(obj.currentTime);
                    print(obj.details);
                    widget.onAddTap(obj);
                    addTaskTEController.text = ' ';
                    mySnackBar (context , 'To Do Added');


                  }
                },
                child: const Text("Add"),
              ),
            )
          ],
        ),
      ),
    );
  }
  mySnackBar(context, message){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
