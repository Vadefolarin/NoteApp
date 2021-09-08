import 'package:flutter/material.dart';
import 'package:kings_note/controller/userNotifier.dart';
import 'package:kings_note/view/ScreenBody.dart';
import 'package:kings_note/view/addNote.dart';
import 'package:provider/provider.dart';

import 'view/show_note.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserNotifier>(
          create: (context) => UserNotifier(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        //   "/": (context) => NoteHome(),
         "/AddNote": (context) => AddNote(),
        "/ShowNotes": (context) => ShowNotes(),
      },
      home: NoteHome(),
    );
  }
}

class NoteHome extends StatefulWidget {
  const NoteHome({Key? key}) : super(key: key);

  @override
  _NoteHomeState createState() => _NoteHomeState();
}

class _NoteHomeState extends State<NoteHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: true,
        elevation: 0.00,
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.note_add),
        onPressed: () {
          Navigator.pushNamed(context, "/AddNote");
        },
      ),
    );
  }
}
