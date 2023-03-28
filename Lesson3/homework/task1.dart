// todo: D diskda UserDB nomli directory yaratilsin va uning ichiga db.txt nomli file
// todo: ochilsin. Bu amallarni dart projeckdan turib amalga oshirilsin va uning ichida int turidagi
// todo: o`zgaruvlar yozilib, o`qib olinsin!

import 'dart:io';

void main() async {
  Directory directory = Directory("/home/linux/Documents/UserDb");
  File db = File(directory.path + '/db');
  await db.create();

  db.writeAsStringSync('9');

  print(int.tryParse(db.readAsStringSync()));
}