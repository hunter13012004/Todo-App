import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyTile extends StatelessWidget {
  final String text;
  final bool taskcomleted;
  final Function(bool?)? onChanged;
  Function(BuildContext)? onPressed;
  MyTile(
      {super.key,
      required this.text,
      required this.taskcomleted,
      required this.onChanged,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: onPressed,
            backgroundColor: Colors.red,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.deepPurple),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Checkbox(
                  value: taskcomleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        decoration: taskcomleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
