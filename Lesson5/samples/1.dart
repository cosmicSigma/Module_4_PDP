import 'dart:async';

StreamSubscription<String> onListen(
  Stream<int> input,
  bool cancelOnError,
) =>
    input
        .map((number) => "$number - second")
        .listen(null, cancelOnError: cancelOnError);

void main() {
  var modify = StreamTransformer(onListen);

  Stream<int> stream = Stream<int>.periodic(
    Duration(seconds: 1),
    (i) => i + 1,
  ).take(10);

  Stream<String> newStream = stream.transform(modify);
  newStream.listen(print);
}
