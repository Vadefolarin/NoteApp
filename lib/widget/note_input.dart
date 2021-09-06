import 'package:flutter/material.dart';

class NOteInput extends StatelessWidget {
  final String labelText;
  final Function onsaved;

  const NOteInput({Key? key, required this.labelText, required this.onsaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      initialValue: " ",
      validator: (String? value) {
        if (value!.isEmpty) {
          return "$labelText is required";
        }
      },
    );
  }
}
