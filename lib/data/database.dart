import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {

  List tasklist = [];
  final _myBox = Hive.box("mybox");
  void createIntitiaData (){
    tasklist = [
    ];
  }
  void loadData(){
    tasklist = _myBox.get("TASKLIST");
  }
  void updateDataBase(){
    _myBox.put("TASKLIST",tasklist);
  }
}