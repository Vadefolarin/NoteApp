import 'package:flutter/material.dart';
import 'package:kings_note/db/db_provider.dart';
import 'package:kings_note/model/NoteModel.dart';

class ShowNotes extends StatelessWidget {
  const ShowNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Note note = ModalRoute.of(context)?.settings.arguments as Note;
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Notes"),
        actions: [
          IconButton(onPressed: () {
            DatabaseProvider.db.deleteNote(note.id);
            Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
          },
           icon: Icon(Icons.delete)),
        ],
      ),
      
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              note.title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 18.0,
            ),
            Text(
              note.content,
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
