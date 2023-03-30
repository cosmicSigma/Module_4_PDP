import 'dart:async';

void main() {
  // Streams Setup:
  final priceInputController = StreamController<double>();
  final priceOutputController = StreamController<String>();

  priceInputController.stream.listen((price){
    final priceAsString = '\$${price.toStringAsFixed(2)} USD';
    priceOutputController.sink.add(priceAsString);
  });

  priceOutputController.stream.listen((price) {
    print(price);
  });

  priceInputController.add(30);
}