import 'package:flutter/material.dart';
import 'package:whatsapp_karo/consts.dart';
import 'package:whatsapp_karo/src/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Constants.primaryColor,
        brightness: Brightness.light,
      ),
      primaryColor: Constants.primaryColor,
      useMaterial3: false,
    ),
    home: const Home(),
  ));
}
