import 'dart:async';
import 'dart:math';

Stream<int> naturalGenerator(int n) async* {
  int k = 0;
  while (k < n) {
    yield k;
    k++;
  }
}

void main() async {
  final random = Random();
  final stream = naturalGenerator(random.nextInt(100));
  StreamSubscription<int> subscription = stream.listen(print);

  subscription.onData((event) {
    print(event);
    if(event%5!=0) {
      subscription.pause(Future.delayed(Duration(seconds: 5)));
      // subscription.resume();
    }

  });
}