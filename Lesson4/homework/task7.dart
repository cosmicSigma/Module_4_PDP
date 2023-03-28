Stream<int> countStream(int n) async* {
  for (int i = 1; i <= n; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() {
  final stream = countStream(1);
  stream.listen((value) => print('Subscriber 1: $value'));
  stream.listen((value) => print('Subscriber 2: $value'));
}