import 'dart:io';

void main() {
  final file = File('/home/linux/Downloads/Telegram Desktop/Untitled 2.pdf');
  final bytes = file.readAsBytesSync();
  final contents = String.fromCharCodes(bytes, 0, bytes.length);
  print(contents);
}