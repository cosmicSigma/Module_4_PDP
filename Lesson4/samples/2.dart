Future<void> main() async {
  final first = Future(() => 'Row');
  final second = Future(() => 'row');
  final third = Future(() => 'row');
  final fourth = Future.delayed(
    Duration(milliseconds: 300),
      () => 'your boat',
  );
  final stream = Stream<String>.fromFutures([
    first,
    second,
    third,
    fourth
  ]);
  
  stream.listen((event) => print(event));
}
