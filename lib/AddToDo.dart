import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToDo extends StatelessWidget {
  const AddToDo({
    super.key,
  });
  // TextEditingController addTaskTEController = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                'Add To-Do',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.cancel))
            ],
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            maxLines: 4,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){
            //TODO : Here the Task is being add
          },
            child: const Text("Add"),
          ),)
        ],
      ),
    );
  }
}