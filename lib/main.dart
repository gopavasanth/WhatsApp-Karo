import 'package:flutter/material.dart';
import 'package:whatsapp_karo/home.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      useMaterial3: false,
    ),
  ));
}
