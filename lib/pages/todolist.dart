import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
 
class TodoList extends StatelessWidget {
  // const TodoList({super.key});
  final String taskName;
  final bool taskComplete;
  Function(bool?)?onChanged;
  Function(BuildContext)? deleteFunction;
   TodoList({super.key, required this.taskName, required this.taskComplete, required  this.onChanged, required this.deleteFunction});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(left: 25,right: 25,top: 25),
      child:  Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,

            ),

          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          child:    Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              // checkbox
              Checkbox(value: taskComplete, onChanged:onChanged,activeColor: Colors.white,checkColor: Colors.black,),
              // task-Name
              Text(taskName,
                style: TextStyle(
                  color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,
                  // it will create a line when the task is checked means completed
                  decoration: taskComplete ? TextDecoration.lineThrough : TextDecoration.none

              ),

              ),

            ],
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12)
        ),
        ),
      ),
    );
  }
}
