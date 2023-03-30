import 'dart:io';

import 'task1.dart';

void main() {
  var myFile1 = File("$path/assets/datas/readme.md");
  myFile1.writeAsStringSync("""
  # Hello World
  
  [![build status]]
  
  - This is my programm
      """);
}