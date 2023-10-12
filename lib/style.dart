import 'package:flutter/material.dart';

InputDecoration appTextInput (hint){
  return InputDecoration(
    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.grey)),
    hintText: hint,
    enabled: true,
    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.cyan))


  ) ;
}