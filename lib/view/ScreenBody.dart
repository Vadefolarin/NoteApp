import 'package:flutter/material.dart';
import 'package:kings_note/db/db_provider.dart';
import 'package:kings_note/model/NoteModel.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? content;
  String? title;
  DateTime? date;
  bool loading = false;

  int? id;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<List> getNotes() async {
    final notes = await DatabaseProvider.db.getNotes();
    return notes;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: getNotes(),
        builder: (context, noteData) {
          switch (noteData.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            case ConnectionState.done:
              if (!noteData.hasData) {
                return Center(
                  child: Text("You dont have any Note yet, create one"),
                );
              } else {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: noteData.data?.length,
                      itemBuilder: (context, index) {
                        String title = noteData.data?[index]["title"];
                        String content = noteData.data?[index]["content"];
                        String? datecreated =
                            noteData.data![index]["datecreated"];
                        int id = noteData.data?[index]["id"];
                        return Dismissible(
                          key: Key(title + index.toString()),
                          onDismissed: (direction) {
                            setState(() {
                              // UserNotifier userNotifier = UserNotifier();
                              Note note = Note(
                                id,
                                content,
                                date!,
                                title,
                              );
                              DatabaseProvider.db.deleteNote(note.id);
                            });
                          },
                          child: Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(context, "/ShowNotes",
                                    arguments: Note(
                                        id,
                                        content,
                                        datecreated == null
                                            ? DateTime.now()
                                            : DateTime.parse(datecreated),
                                        title));
                              },
                              title: Text(
                                title,
                                style: TextStyle(fontSize: 18),
                              ),
                              subtitle: Text(content),
                            ),
                          ),
                        );
                      },
                    ));
              }
            default:
              return Center(child: CircularProgressIndicator());
          }
        });
  }
}
