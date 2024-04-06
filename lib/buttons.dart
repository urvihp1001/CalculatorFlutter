// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
class MyButton extends StatelessWidget{
  final color;
  final textColor;
  final String buttonText;//required coz String cant be null
  final buttontapped;
  // ignore: prefer_const_constructors_in_immutables
  MyButton({this.color,this.textColor,this.buttonText='',this.buttontapped});
  @override
//what this button does- redefining
Widget build(BuildContext context)
{
  return GestureDetector(
onTap: buttontapped,
child:Padding(padding: const EdgeInsets.all(0.2),
child:ClipRRect(borderRadius: BorderRadius.circular(25),
child:Container(
  color: color, //constructing MyButton content
  child:Center(
    child: Text(buttonText,
    style: TextStyle(color: textColor,
    fontSize: 25,
    fontWeight: FontWeight.bold,
    ),
    ),
  )
)
) //Rounded rectangle buttons
),
  );
} 
}