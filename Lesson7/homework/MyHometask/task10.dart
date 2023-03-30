import 'dart:io';

Future<void> main() async {
  var myDir = Directory("/home/linux/IdeaProjects/Module_4_PDP/Lesson7/homework/MyHometask/datas");

  await myDir.delete(recursive: true);
}