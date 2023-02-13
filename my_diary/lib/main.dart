import 'package:flutter/material.dart';
import 'package:my_diary/diary.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: const Diary(),
    ));
    