import 'dart:async';
import 'dart:math';

void main() {
  final random = Random();
  final streamController = StreamController<num>();

  streamController.stream
      .transform(StreamTransformer.fromHandlers(handleData: (data, sink) {
    if (data is! num) return;
    if (data is Complex) return;
    sink.add(data);
  }))
      .listen((data) {
    print('Data: $data');
  });

  for (var i = 0; i < 10; i++) {
    final value = random.nextDouble();
    streamController.add(value);
    print('Added value: $value');
  }

  streamController.close();
}

class Complex {
  final double real;
  final double imaginary;

  const Complex(this.real, this.imaginary);

  @override
  String toString() {
    return '$real + ${imaginary}i';
  }
}
