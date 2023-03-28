import 'dart:async';

void main() {
  final Stream<int> stream = Stream.periodic(Duration(seconds: 1), (int i) => (i + 1) * 3).take(20);

  final StreamSubscription<int> subscription = stream.listen((int value) {
    print(value);

    if (value % 5 == 0) {
      Future.delayed(Duration(seconds: 5), () {
        print('Paused for 5 seconds');
      });
    }
  });
}