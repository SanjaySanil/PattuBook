import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  ElevatedButtonWidget(
      {Key? key, required this.text, required this.color, required this.height,required this.onPressed})
      : super(key: key);
  final String text;
  final Color color;
  final double height;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:color),
        onPressed: onPressed,
        child: Text(text),),
    );
  }
}
