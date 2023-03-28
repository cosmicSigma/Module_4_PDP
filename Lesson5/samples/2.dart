// random 20 ta son [1-100]
// 5 ga karralisini 5 ga bolib chiqarsin
// aks holda qolgan sonlar 100 ga ko'pytirilib chiqarilsin
// va yuqoridagi shartga mos transformer yozilsin

import 'dart:async';
import 'dart:math';

Stream<int> randomGenerator(int n) async* {
  for (int i = 0; i < n; i++) {
    if(i == 11) {
      yield* Stream.error("Guruch kurmasiz bo'lmas!");
    }
    await Future.delayed(Duration(milliseconds: 250));
    yield Random().nextInt(100) + 1;
  }

}

void main() {
  Stream<int> randoms = randomGenerator(20);
  final streamTransformer = StreamTransformer<int, int>((stream, cancel) {
    final modifies = stream.map((event) {
      if (event % 5 == 0) {
        return event ~/ 5;
      } else {
        return event * 100;
      }
    });
    return modifies.listen((e) => print("befoyda"), cancelOnError: cancel);
  });

  // Stream<int> transformationStream = streamTransformer.bind(randoms);
  Stream<int> transformationStream = randoms.transform(streamTransformer);
  transformationStream.listen(print, cancelOnError: false, onError: (error) => print(error));
}