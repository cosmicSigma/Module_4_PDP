import 'dart:io';

Future<void> main() async {
  var myFile = File('/home/linux/IdeaProjects/Module_4_PDP/Lesson7/homework/MyHometask/datas/readme.md');

  await myFile.copy('/home/linux/IdeaProjects/Module_4_PDP/Lesson7/homework/MyHometask/assets/readme.md');
}