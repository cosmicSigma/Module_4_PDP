import 'dart:io';

import 'task1.dart';

Future<void> main() async {
  var myFile = File("$path/assets/datas/readme.md");

  var againWrite = myFile.openWrite(mode: FileMode.append);
  againWrite.write("- I changed my previous code");
  againWrite.write("\n\t- I changed my previous code again");
  await againWrite.close();
}