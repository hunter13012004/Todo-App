import 'package:flutter/material.dart';
import 'package:todoapp/utils/mybutton.dart';

class MyAlertBox extends StatelessWidget {
  VoidCallback onsave;
  VoidCallback oncancel;
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  
   MyAlertBox({super.key, required this.onsave, required this.oncancel,required this.controller});

  @override
  Widget build(BuildContext context) {

   
  
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
     content: Container(
      width: 300,
      height: 200,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            style: TextStyle(color: Colors.white),
            controller: controller,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white30)) ,

              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white30)),
              enabled: true,
              focusColor: Colors.white,
              hintText: 'Add New Task Here',
              hintStyle: TextStyle(color: Colors.white30),


            ),

          ),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(onPressed: onsave, buttontext: 'Save'),
              const SizedBox(width: 10,),
              MyButton(onPressed: (){Navigator.of(context).pop();}, buttontext: 'Cancel')
            ],
          )
        ],
      ),
     ),
    );
  }
}
