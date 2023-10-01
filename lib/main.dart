import 'package:flutter/material.dart';
import 'package:whatsapp_karo/consts.dart';
import 'package:whatsapp_karo/home.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Constants.primaryColor,
        brightness: Brightness.light,
      ),
      primaryColor: Constants.primaryColor,
      useMaterial3: false,
    ),
  ));
}
