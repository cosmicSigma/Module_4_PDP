import 'dart:async';

void main() {
  final stream = Stream<int>.fromIterable([1,2,3]);

  final streamTransformer = StreamTransformer<int, int>.fromHandlers(
    handleData: (num data, EventSink handler) {
      handler.add(data * 2);
    },
    handleError: (Object error, StackTrace stacktrace, EventSink handler) {
      handler.addError("Something happen: $error");
    },
    handleDone: (EventSink handler) {
      handler.close();
    },
  );

  var controllerStream = stream.transform(streamTransformer);
  controllerStream.listen(print);
}