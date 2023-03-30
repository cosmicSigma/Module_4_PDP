import 'dart:io';

import 'task1.dart';

void main() {
  Directory newDir1 = Directory("$path/assets/datas");
  newDir1.create().then((value) {
    if (value.existsSync()) print("Directory succesfully created");
  });
}