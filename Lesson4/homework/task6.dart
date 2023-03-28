import 'dart:async';
import 'dart:math';

Stream<int> randomNumbers() async* {
  final Random random = Random();

  while (true) {
    final int number = random.nextInt(100);

    yield number;

    if ((number % 2 == 0 && number % 3 == 0) || (number % 3 == 0 && number % 5 == 0)) {
      break;
    }
  }
}

void main() async {
  await for (final int number in randomNumbers()) {
    print(number);
  }
}