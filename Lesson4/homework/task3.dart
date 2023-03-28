import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final File file = File('/home/linux/IdeaProjects/Module_4_PDP/Lesson4/homework/assets/text.txt');
  final IOSink sink = file.openWrite();

  sink.write('Hello, world!');
  await sink.flush();
  await sink.close();

  final Stream<List<int>> stream = file.openRead();
  final String contents = await stream.transform(utf8.decoder).join();
  print(contents);
}
