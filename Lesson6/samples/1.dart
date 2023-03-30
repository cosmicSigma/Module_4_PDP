import "dart:async";

Future<void> main() async {
  // 1
  final controller = StreamController<String>();
  final stream = controller.stream;
  final sink = controller.sink;
  // 2
  stream.listen(
          (value) => print(value),
    onError: (Object error) => print(error),
          onDone: () => print("Sink closed"),
  );
  // 3
  sink.add('grape');
  sink.add('grape');
  sink.addError(Exception('cherry'));
  sink.add('grape');
  sink.close();
}