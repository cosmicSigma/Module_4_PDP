import 'dart:io';

Directory newDir = Directory("$path/assets");
String path = '/home/linux/IdeaProjects/Module_4_PDP/Lesson7/homework/MyHometask';
void main() {
  newDir.create().then((value) {
    if (value.existsSync()) print("Directory successfully created");
  });
}