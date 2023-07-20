import 'package:flutter/material.dart';
import 'package:todo/pages/dialogbox.dart';
import 'package:todo/pages/todolist.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ['TO DO APP',false],
    ['GO TO GYM',false],
  ];
  // it will add item to the list
   void saveTask(){
     setState(() {
       toDoList.add([_controller.text,false]);
       // whatever text is written in the text field will be add and since it is new task so it be false/uncompleted
       _controller.clear();
     });
     Navigator.of(context).pop();
   }
  // checkbox tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
  final _controller = TextEditingController();
  // create a new task
  void createTask(){
   showDialog(context: context,
       builder: (context){
     return  DialogBox(controller: _controller,onSave: saveTask,onCancel: ()=> Navigator.of(context).pop(),);
       }

   );
  }
  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
   title: Text('To Do App'),
        elevation: 0,
      ),
      // floating action button will add a new task when it is clicked
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,

      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context,index){
          return TodoList(taskName: toDoList[index][0], taskComplete: toDoList[index][1],onChanged:(value)=> checkBoxChanged(value,index),

          deleteFunction: (context) => deleteTask(index),);
        },

      ),
    );
  }
}
