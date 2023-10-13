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
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
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
                  textInputAction: TextInputAction.next,
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
                            mySnackBar(context, 'Item Added');
                          }
                        },
                        child: const Text('Add'))
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
                                // return editInfo();
                                return AlertDialog(
                                  title: const Text(' Alert'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder: (context) {
                                                      return editInfo(
                                                        onTapUpgrade: (String
                                                                title,
                                                            String
                                                                description) {
                                                          updateValue(
                                                              index: index,
                                                              updatedTitle:
                                                                  title,
                                                              updatedDescription:
                                                                  description);
                                                        },
                                                        gotItem:
                                                            itemDetails[index],
                                                      );
                                                    });
                                              },
                                              style: alertButton(),
                                              child: const Text('Edit')),
                                          TextButton(
                                              onPressed: () {
                                                //Todo: Delete code
                                                String oldTitle = itemDetails[index].title;
                                                deleteValue(index);
                                                Navigator.pop(context);
                                                mySnackBar(
                                                    context, 'Item titled $oldTitle Deleted !');
                                              },
                                              style: alertButton(),
                                              child: const Text('Delete')),
                                        ],
                                      )
                                    ],
                                  ),
                                );
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
  void deleteValue(index) {
    itemDetails.removeAt(index);
    setState(() {});
  }
// function to Update Values
  void updateValue(
      {required int index,
      required String updatedTitle,
      required String updatedDescription}) {
    itemDetails[index].title = updatedTitle;
    itemDetails[index].description = updatedDescription;
    setState(() {});
  }
// function to show SnackBar
  mySnackBar(context, message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ));
  }
}
