import 'package:flutter/material.dart';

class custom_Text_Field extends StatelessWidget {
  custom_Text_Field({super.key, this.hinttext, required this.onChanged});
  String? hinttext;
  Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return "field is required";
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
