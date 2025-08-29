import 'package:flutter/material.dart';

class CutomButton extends StatelessWidget {
  CutomButton({super.key, required this.text});
  String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),

        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: Text(text!)),
    );
  }
}
