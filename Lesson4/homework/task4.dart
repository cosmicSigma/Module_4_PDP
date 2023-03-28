import 'dart:async';
import 'dart:math';

void main() {
  final int n = 10;
  final double angleChangePerSecond = pi / 12;

  Timer.periodic(Duration(seconds: 1), (timer) {
    final double angle = angleChangePerSecond * timer.tick;
    final double value = sin(angle) * n;

    print(value);
  });
}
