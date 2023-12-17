import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled3/Home_Page.dart';

void main() async {

  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _ToDoState();
}

class _ToDoState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}