import 'dart:io';

void main() async {
  final filename = '/home/linux/IdeaProjects/Module_4_PDP/Lesson5/homework/assets/text.txt';
  final file = File(filename);
  if (await file.exists()) {
    print('Fayl oldin yaratilgan');
    print(await file.readAsString());
  } else {
    await file.create();
    print('File created');
  }

  final sink = file.openWrite(mode: FileMode.append);
  sink.write('Hello World!\n');
  await sink.flush();
  await sink.close();

  final contents = await file.readAsString();
  print(contents);
}