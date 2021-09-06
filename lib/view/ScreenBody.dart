import 'package:flutter/material.dart';
import 'package:kings_note/db/db_provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // String? _content;
  // String? _title;
  bool loading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<List> getNotes() async {
    final notes = await DatabaseProvider.db.getNotes();
    return notes;
  }

  String name() {
    return 'Velocity';
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
                      itemCount: noteData.data!.length,
                      itemBuilder: (context, index) {
                        String title = noteData.data?[index]["title"];
                        String content = noteData.data?[index]["content"];
                        // String datecreated =
                        //     noteData.data?[index]["datecreated"];
                        // int id = noteData.data?[index]["id"];
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, "/", (route) => false);
                            },
                            title: Text(
                              title,
                              style: TextStyle(fontSize: 18),
                            ),
                            subtitle: Text(content),
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
