import 'dart:async';
import 'dart:math';

class SinusoidStreamController {
  final int n;
  final StreamController<double> _controller;
  Timer? _timer;
  double _angle = 0;

  SinusoidStreamController(this.n)
      : _controller = StreamController<double>.broadcast();

  Stream<double> get stream => _controller.stream;

  void start() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      _angle += pi / 12;
      final value = n * sin(_angle);
      _controller.sink.add(value);
    });
  }

  void stop() {
    _timer?.cancel();
    _controller.close();
  }
}

void main() {
  final controller = SinusoidStreamController(5);
  controller.stream.listen((value) {
    print(value);
  });
  controller.start();
}
