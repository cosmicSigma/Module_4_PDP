import 'dart:async';

Stream<int> naturalGenerator(int n) async* {
  int k = 0;

  while (k < n) {
    k++;
    await Future.delayed(Duration(seconds: 1));
    if (k == 4) {

    } else {
      yield k;
    }
  }
}

void main() async {

  Stream<int> sequenceNatural = naturalGenerator(8);
  // await for(int number in sequenceNatural) {
  //   print(number);
  // }

  final stream = naturalGenerator(8);
  StreamSubscription<int>? subscription;
  subscription = stream.listen(
        (data) {
      print(data);
      subscription?.cancel();
    },
    onError: (e, s) {
      print(e);
    },
    cancelOnError: false,
    onDone: () {
      print("Completed");
    },
  );
}