Future<void> main() async {
  Stream<int>.periodic(
      Duration(seconds: 1),
      (value) => value,
  ).listen((event) => print(event));
}