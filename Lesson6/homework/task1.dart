import 'dart:async';

void main() async {
  final controller = StreamController<int>();
  final stream = controller.stream;
  final sink = controller.sink;

  int n = 3;

  stream.listen((value) {
    print('${value.toString() + ' '}' * value);
  });

  for (int i = 1; i <= n; i++) {
    await Future.delayed(Duration(seconds: i));
    sink.add(i);
  }

  await controller.close();
}