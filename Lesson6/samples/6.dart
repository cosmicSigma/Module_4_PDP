import 'dart:async';

Stream<int> timedCounter(Duration interval, [int maxCount = 0]) {
  late StreamController<int> controller;
  Timer? timer;
  int counter = 0;
  void tick(_) {
    counter++;
    controller.add(counter);
    if (counter > maxCount) {
      timer?.cancel();
      controller.close();
    }
  }

  void startTimer() => timer = Timer.periodic(interval, tick);
  void stopTimer() {
    if (timer != null) {
      timer?.cancel();
      timer = null;
    }
  }

  controller = StreamController<int>(
      onListen: startTimer,
      onPause: stopTimer,
      onResume: startTimer,
      onCancel: stopTimer);
  return controller.stream;
}

void main() => timedCounter(Duration(seconds: 1), 10).listen(print);