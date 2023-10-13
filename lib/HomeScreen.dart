import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_10/style.dart';

import 'ItemDetails.dart';
import 'editInfo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenUI();
  }
}

class _HomeScreenUI extends State<HomeScreen> {
  List<ItemDetails> itemDetails = [];

  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Please Enter a Value !!';
                    }
                    return null;
                  },
                  controller: _titleTEController,
                  decoration: appTextInput("Add Title"),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Please Enter a Value !!';
                    }
                    return null;
                  },
                  controller: _descriptionTEController,
                  decoration: appTextInput('Add Description'),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String inputTitleText =
                                _titleTEController.text.trim();
                            String inputDescriptionText =
                                _descriptionTEController.text.trim();
                            ItemDetails obj = ItemDetails(
                                title: inputTitleText,
                                description: inputDescriptionText);
                            addValue(obj);
                            _titleTEController.text = '';
                            _descriptionTEController.text = '';
                          }
                        },
                        child: Text('Add'))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          child: Text(''),
                        ),
                        title: Text(itemDetails[index].title),
                        subtitle: Text(itemDetails[index].description),
                        trailing: const Icon(Icons.arrow_forward),
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
                    itemCount: itemDetails.length)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // function to Add values
  void addValue(ItemDetails obj) {
    itemDetails.add(obj);
    setState(() {});
  }
// function to Delete Values
void deleteValue (index)
{
  itemDetails.removeAt(index);
  setState(() {});
}

}
