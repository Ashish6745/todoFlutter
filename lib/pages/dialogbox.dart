import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  // const DialogBox({super.key});
final controller;
 VoidCallback onSave;
VoidCallback onCancel;
   DialogBox({super.key, required this.controller,required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
       child: Column(
         children: [
           // get user Input
           TextField(
             controller: controller,
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               hintText: 'Add a new task'
             ),
           ),
           // save and delete buttons
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 OutlinedButton(onPressed: onSave, child: Text('Add',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold))),
               SizedBox(height: 8,),
                 OutlinedButton(onPressed: onCancel, child: Text('Cancel',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
               ],
             )
         ],
       ),
      ),
    );
  }
}

