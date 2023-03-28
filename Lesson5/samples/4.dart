import 'dart:async';

void main() {
  Stream<String> convert(Stream<int> beforeStream) {
    return beforeStream.map((event) => "md: $event");
  }

  Stream<int> stream = Stream<int>.fromFutures([
    Future<int>(() => 10),
    Future<int>(() => 20),
    Future<int>(() => 30),
  ]);

  var code = StreamTransformer.fromBind(convert);
  Stream<String> outStream = stream.transform(code);
  outStream.listen(print);
}