import 'dart:async';

Future<void> sendNumbers(int n) async {
  for (int i = 1; i <= n; i++) {
    await Future.delayed(Duration(seconds: 1));
    print(List.filled(i, i).join(" "));
  }
}

void main() {
  sendNumbers(10);
}