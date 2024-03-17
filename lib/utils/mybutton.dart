import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {

  final String buttontext;
 VoidCallback onPressed;
   MyButton({super.key,required this.onPressed, required this.buttontext});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24)
      ),
      child: MaterialButton(onPressed: onPressed, child: Text(buttontext,style: const TextStyle(fontSize: 18,color: Colors.white60),)),
    );
  }
}