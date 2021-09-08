import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kings_note/model/NoteModel.dart';

class UserNotifier extends ChangeNotifier {
  List<Note> _usernote = [];

  UnmodifiableListView<Note> get userNote => UnmodifiableListView(_usernote);

  addUserNote(Note note) {
    _usernote.add(note);
    notifyListeners();
  }

  deleteUserNote(index, String content) {
    _usernote.removeWhere((_user) => _user.title == userNote[index].title);
    notifyListeners();
  }
}
