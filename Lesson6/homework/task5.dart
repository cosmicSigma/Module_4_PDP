import 'dart:async';

class MultiplesStreamController {
  final StreamController<int> _controller;
  Timer? _timer;
  int _count = 0;

  MultiplesStreamController() : _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  void start() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      _count++;
      final value = _count * 3;
      _controller.sink.add(value);

      if (_count % 5 == 0) {
        _timer?.cancel();
        Future.delayed(Duration(seconds: 5)).then((_) => start());
      }

      if (_count == 20) {
        stop();
      }
    });
  }

  void stop() {
    _timer?.cancel();
    _controller.close();
  }
}

void main() {
  final multiples = MultiplesStreamController();
  multiples.stream.listen((value) {
    print(value);
  });
  multiples.start();
}