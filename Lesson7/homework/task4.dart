import 'dart:io';
import 'task1.dart';
void main() {
  var myFile = File("$path/assets/datas/readme.md");
  myFile.create().then((value) {
    if (value.existsSync()) print("File created successfully");
  });
}