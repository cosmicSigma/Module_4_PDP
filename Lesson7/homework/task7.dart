import 'dart:io';

import 'task1.dart';

void main() async {
  var sourceDir = Directory('$path/assets/datas');
  var destinationDir = Directory('$path/datas');
  await sourceDir.rename(destinationDir.path);
}