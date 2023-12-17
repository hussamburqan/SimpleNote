import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled3/My_List_App.dart';
import 'package:untitled3/Dialog_box.dart';
import 'data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box("mybox");

  late final TextEditingController _controller;
  late final ToDoDataBase db;

  @override
  void initState() {
    _controller = TextEditingController();
    db = ToDoDataBase();

    if (_mybox.get("TASKLIST") == null) {
      db.createIntitiaData();
    } else {
      db.loadData();
    }
    super.initState();
  }
  void checkbox(bool? value,int index){
    setState(() {
      db.tasklist[index][1]= !db.tasklist[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask(){
    setState(() {
      db.tasklist.add([_controller.text,false]);
      _controller.clear();

    });
    db.updateDataBase();
    Navigator.of(context).pop();

  }
  
  void deleteTask(int index){
    setState(() {
      db.tasklist.removeAt(index);

    });
    db.updateDataBase();
  }
  
  void createNewTask(){
    showDialog(
        context: context,
        builder: (contest) {
          return Dialogbox(
            controller: _controller,
            onsave: saveNewTask,
            oncancel: ()=> Navigator.of(context).pop(),
          );
        },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xBF706E6E),
        title: const Text("Simple Notes",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 1,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: const Color(0xFF706E6E),
        child: const Icon(Icons.add),
      ),
      body: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('Images/12.jpg'),
          fit: BoxFit.cover,
        )
        ),
        child: ListView.builder(
          itemCount: db.tasklist.length,
          itemBuilder: (BuildContext context, int index) {
            return MyListApp(task: db.tasklist[index][0], taskComplete: db.tasklist[index][1],onChanged: (value)=>checkbox(value,index),deleteTask: (context) => deleteTask(index));
          },
        ),
      ),
    );
  }
}
