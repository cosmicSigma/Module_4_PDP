import 'dart:async';

Stream<int> naturalGenerator(int n) async* {
  int k = 0;
  while (k < n) {
    yield k;
    k++;
  }
}

void main() {
  StreamTransformer<int, int> tripler = StreamTransformer.fromHandlers(handleData: (data, sink){
    sink.add(data * 3);
  });

  final stream = naturalGenerator(8).asBroadcastStream();
  stream.transform(tripler).listen((event) {
    print('transform data: $event');
  }, onError: (e) {
    print(e);
  });
  stream.listen((data)
  {
    print('data: $data');
  },onError:(e){
    print(e);
  });
}