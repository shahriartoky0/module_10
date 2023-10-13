import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_10/ItemDetails.dart';
import 'package:module_10/style.dart';

class editInfo extends StatefulWidget {
  editInfo({
    super.key,
    required this.gotItem,
    required this.onTapUpgrade,
  });

  final ItemDetails gotItem;
  final Function(String, String) onTapUpgrade;

  @override
  State<editInfo> createState() => _editInfoState();
}

class _editInfoState extends State<editInfo> {
  late final TextEditingController _textEditingControllerTitle =
      TextEditingController(text: widget.gotItem.title);
  late final TextEditingController _textEditingControllerDescription =
      TextEditingController(text: widget.gotItem.description);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            decoration: appTextInput(''),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Please Enter a Value !";
              }
              return null;
            },
            controller: _textEditingControllerTitle,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            decoration: appTextInput(''),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Please Enter a Value !";
              }
              return null;
            },
            controller: _textEditingControllerDescription,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    String oldTitle = widget.gotItem.title ;
                    String updatedTitle =
                        _textEditingControllerTitle.text.trim();
                    String updatedDescription =
                        _textEditingControllerDescription.text.trim();
                    widget.onTapUpgrade(updatedTitle, updatedDescription);
                    Navigator.pop(context);
                    mySnackBar(context, 'Information of $oldTitle Updated Successfully');
                  },
                  child: const Text('Edit Done'))
            ],
          )
        ],
      ),
    );
  }

// function to show SnackBar
  mySnackBar(context, message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1, milliseconds: 50),
    ));
  }
}
