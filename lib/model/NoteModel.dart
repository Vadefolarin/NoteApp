class Note {
  // int id;
  String title;
  String content;
  DateTime _datecreated;

  DateTime get datecreated => _datecreated;

  // DateTime datelastcreated;
  // Color notecolor;
  int isarchived = 0;

  Note(
//this.id,
    this.content,
    this._datecreated,
    // this.datelastcreated,
    this.title,
    // this.notecolor
  );

  //convert our items to map

  Map<String, dynamic> toMap() {
    return ({
      //  "id": id,
      "title": title,
      "content": content,
      "date_created": datecreated.toString(),
      // "note_color": notecolor,
    });
  }
}
