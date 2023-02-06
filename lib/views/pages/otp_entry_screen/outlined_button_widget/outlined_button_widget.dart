import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.height})
      : super(key: key);
  final String text;
  final Function() onPressed;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height*height,
        width: MediaQuery.of(context).size.width,
        child: OutlinedButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}
