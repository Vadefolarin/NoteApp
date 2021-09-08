import 'package:kings_note/model/NoteModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), "note_app.db"),
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE  notes (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          content TEXT,
          date_created DATE 
        )
        ''');
      },
      version: 1,
    );
  }

// Add Fuunction
  addNewNote(Note note) async {
    final db = await database;
    db?.insert("notes", note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

//Delete Function
  Future<int> deleteNote(int id) async {
    final db = await database;
    int count = await db!.rawDelete("DELETE FROM notes WHERE id = ? ", [id]);
    return count;
  }

  Future<dynamic> getNotes() async {
    final db = await database;
    var res = await db?.query("notes");
    if (res!.length == 0) {
      return null;
    } else {
      var resultMap = res.toList();

      print(resultMap);
      return resultMap.isNotEmpty ? resultMap : null;
    }
  }
}
