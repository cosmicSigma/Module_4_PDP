import 'dart:async';

void main() {
  final streamController = StreamController(
    onPause: () => print("Paused"),
    onResume: () => print("Resumed"),
    onCancel: () => print("Canceled"),
    onListen: () => print("Listened"),
  );

  final stream = streamController.stream;
  final sink = streamController.sink;
  late StreamSubscription subscriber;
  subscriber = stream.listen(
          (event) {
            print("Event: $event");
            if (event=="🍇") {
              subscriber.pause(Future.delayed(Duration(seconds: 2)));
            }
          },
    onDone: () => print("Done"),
    onError: (error) => print(error)
  );
  
  sink.add("🍇");
  sink.add("🍒");
  sink.addError("Error: 🔴");
  sink.close();
}