void main() async {
  Stream<int> sequenceNatural = naturalGenerator(100);
  // await for(int number in sequenceNatural) {
  //   print(number);
  // }

  sequenceNatural.listen((event) {
    print(event);
  });
}

Stream<int> naturalGenerator(int n) async* {
  int k = 0;

  while(k < n) {
    if (k%3==0) {
      await Future.delayed(Duration(microseconds: 100));
      yield ++k;
    }
  }
}