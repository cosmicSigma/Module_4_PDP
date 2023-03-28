import 'dart:async';

void main() async {
  print(await fakeFetchData());
}

Future<String> fakeFetchData() async {
  final completer = Completer<String>();
  bool isSuccess = false;

  if(isSuccess) {
    completer.complete(Future(() => "Result"));
  } else {
    completer.completeError("error");
  }

  return completer.future;
}