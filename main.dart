//main.dart
import 'package:flutter/material.dart';
import 'package:todo_list/home.dart';
import 'package:todo_list/splash.dart';

import 'Splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash_screen(),
    )
  );
}
