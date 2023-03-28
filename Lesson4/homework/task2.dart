Stream<int> fibonacci(int n) async* {
  int a = 0, b = 1;
  for (int i = 0; i < n; i++) {
    await Future.delayed(Duration(seconds: b.isEven ? 3 : 1));
    yield b;
    final int c = a + b;
    a = b;
    b = c;
  }
}

Future<void> main() async {
  await for (final int number in fibonacci(10)) {
    print(number);
  }
}