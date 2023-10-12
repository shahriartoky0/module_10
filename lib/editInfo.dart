import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_10/style.dart';

class editInfo extends StatelessWidget {
  const editInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: const Text(' Alert'),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(padding: EdgeInsets.all(8),
                            child: Column(children: [
                              SizedBox(height: 8,),
                              TextFormField(decoration: appTextInput(''),),
                              SizedBox(height: 5,),
                              TextFormField(decoration: appTextInput(''),),
                              SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(onPressed: (){}, child: const Text('Edit Done'))
                                ],
                              )
                            ],),);
                        });
                  },
                  child: const Text('Edit')),
              TextButton(
                  onPressed: () {
                    //Todo: Delete code
                  },
                  child: const Text('Delete')),
            ],
          )
        ],
      ),
    );
  }
}
