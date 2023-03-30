import 'dart:async';

void main() async {
  final controller = StreamController<int>();
  int n = 10;
  List<int> fib = [0, 1];

  controller.stream.listen((value) {
    print(value);
  });

  for (int i = 2; i < n; i++) {
    fib.add(fib[i - 1] + fib[i - 2]);
    await Future.delayed(Duration(seconds: i%2==0 ? 1:3));
    controller.sink.add(fib[i]);
  }

  await controller.close();
}