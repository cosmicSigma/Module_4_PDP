void main() async {

  Stream<int> sequenceNatural = naturalGenerator(100);

  // Stream<int> broadcast = sequenceNatural.asBroadcastStream();
  // print("This is print: ${await broadcast.first}");
  //
  // if (sequenceNatural.toString().length < 10){
  //   broadcast.listen(
  //     (event) {
  //       print(event);
  //     },
  //     onError: (e, s) {
  //       print(e);
  //     },
  //     cancelOnError: false,
  //     onDone: () {
  //       print("Completed");
  //     },
  //   );
  // }

  // Stream<int> broadcast2 = sequenceNatural.asBroadcastStream();
  // print("This is print: ${await broadcast.first}");
  //
  // if (sequenceNatural.toString().length > 10){
  //   broadcast2.listen(
  //     (event) {
  //       print(event);
  //     },
  //     onError: (e, s) {
  //       print(e);
  //     },
  //     cancelOnError: false,
  //     onDone: () {
  //       print("Completed");
  //     },
  //   );
  // }
}

Stream<int> naturalGenerator(int n) async* {
  int k = 0;

  while (k < n) {
    k++;
    await Future.delayed(Duration(seconds: 1));
    if (k%5==0){
      yield k;
    }
  }
}

// Stream<int> generateBinary() async*{
//   for(int i = 1; i <= 128; i *= 2) {
//     await Future.delayed(Duration(seconds: 1));
//     yield i;
//   }
// }