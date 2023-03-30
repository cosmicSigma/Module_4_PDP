import 'dart:async';

StreamSubscription<String> onListen(Stream<int> input, bool cancelOnError) {
  late StreamSubscription<int> subscription;
  var controller = StreamController<String>(onPause: () => subscription.pause(),
    onResume: () => subscription.resume(),
    onCancel: () => subscription.cancel(),
    sync: true,
  );
  subscription = input.listen(
        (data) => controller.add("$data-$data"),
    onError: controller.addError,
    onDone: controller.close, cancelOnError: cancelOnError,
  );
  return controller.stream.listen(null);
}

void main() {
  var duplicator = StreamTransformer(onListen);
  var controller = StreamController<int>(); Stream<String> controllerStream = controller.stream.transform(duplicator); controllerStream.listen(print);
  controller.add(1);
  controller.add(2);
  controller.add(3);
}