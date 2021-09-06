import 'package:flutter/material.dart';

class NoteButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const NoteButton({Key? key, 
   required this.text,
   required this.onPressed, 
   required this.color}
   ) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(16),
        elevation: 8.0,
        backgroundColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      ),
      
      onPressed: onPressed, 
    child: Text(text,style: TextStyle(
      fontSize: 16,
      color: Colors.white
    ),)
    );
  }
}
