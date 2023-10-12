import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';

void main ()
{
  runApp(Myapp());
}
class Myapp extends StatelessWidget{
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(),debugShowCheckedModeBanner: false,theme: ThemeData(primarySwatch: Colors.red),);
  }

}