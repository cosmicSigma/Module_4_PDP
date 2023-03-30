import 'dart:async';

Stream<int> numGenerator(int n) async* {
  for (int i = 1; i <= n; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() {
  int n = 20;
  StreamController controller = StreamController<int>();
  Stream stream = controller.stream.asBroadcastStream();
  StreamSink sink = controller.sink;
  sink.addStream(numGenerator(n));

  StreamSubscription subscriber1 = stream.listen(print);
  StreamSubscription subscriber2 = stream.listen(print);

  StreamSubscription subscriber3 = stream.listen(print);
  StreamSubscription subscriber4 = stream.listen(print);
  subscriber4.pause(Future.delayed(Duration(seconds: n ~/ 2)));

  StreamSubscription subscriber5 = stream.listen(print);
  subscriber5.onData((data) {
    print(data);
    if (data % 7 == 0) {
      subscriber5.cancel();
    }
  });

  StreamSubscription subscriber6 = stream.listen(print);
  subscriber6.pause(Future.delayed(Duration(seconds: 10)));

  StreamSubscription subscriber7 = stream.listen(print);
  subscriber7.onData((data) {
    print(data);
    if (data == (n ~/ 3)) {
      subscriber7.cancel();
    }
  });
  StreamSubscription subscriber8 = stream.listen(print);
  subscriber8.onData((data) {
    print(data);
    if (data == (n ~/ 2)) {
      subscriber8.cancel();
    }
  });
  StreamSubscription subscriber9 = stream.listen(print);

  StreamSubscription subscriber10 = stream.listen(print);
  subscriber10.onData((data) {
    print("Qisim 1: $data");
    if (data == (n ~/ 3)) {
      subscriber10.cancel();
    }
  });

  StreamSubscription subscriber11 = stream.listen(print);
  subscriber11.onData((data) {
    if (data > (n ~/ 3) && data < ((n / 3) * 2).round()) {
      print("Qisim 2: $data");
    }
  });

  StreamSubscription subscriber12 = stream.listen(print);
  subscriber12.onData((data) {
    if (data > ((n / 3) * 2).round()) {
      print("Qisim 3: $data");
    }
  });
}
