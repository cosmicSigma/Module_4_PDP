import 'dart:async';

void main() {
  final streamController = StreamController<int>();
  int number = 1;


  addData() {
    Timer.periodic(Duration(seconds: 1), (_) {
      if (number == 5) {
        streamController.close();
        return;
      }
      streamController.sink.add(number);
      number++;
    });
  }

  addData();
  Stream<int> myStream = streamController.stream;
  final subscription = myStream.listen((data) => print(data),
  onDone: () => print("All data received!"));
}