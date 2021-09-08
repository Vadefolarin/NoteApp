import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kings_note/db/db_provider.dart';
import 'package:kings_note/model/NoteModel.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

String? title;
String? content;
DateTime? date;
int? id;

TextEditingController titleController = TextEditingController();

TextEditingController contentController = TextEditingController();

class _AddNoteState extends State<AddNote> {
  addUserNote(Note note) {
    DatabaseProvider.db.addNewNote(note);
  }

  @override
  void dispose() {
    contentController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Note"),
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "  Note Title",
            ),
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: TextField(
            controller: contentController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "  Your Note",
            ),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (titleController.text.isEmpty || contentController.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Add Note ")));
          } else {
            setState(() {
              title = titleController.text;
              content = contentController.text;
              date = DateTime.now();
            });
            Note note = Note(
            Random().nextInt(10000000000000),
            
              content!,
              date!,
              title!,
            );
            addUserNote(note);

            Navigator.pushNamedAndRemoveUntil(
              context,
              "/",
              (route) => false,
            );
          }
        },
        label: Text("Save Note"),
        icon: Icon(Icons.save),
      ),
    );
  }
}
