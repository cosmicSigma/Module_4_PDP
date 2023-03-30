import 'dart:async';

final json = [
  {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false,
  },
  {
    "userId": 1,
    "id": 2,
    "title": "quis ut nam facilis et officia qui",
    "completed": false,
  },
  {
    "userId": 1,
    "id": 3,
    "title": "fugiat veniam minus",
    "completed": false,
  },
];

final stream = Stream.fromIterable(json);

class Json {
  int userId;
  int id;
  String title;
  bool completed;

  Json(this.userId, this.id, this.title, this.completed);

  factory Json.fromJson(Map<String, Object?> json) {
    int userId = json["userId"] as int;
    int id = json["id"] as int;
    String title = json["title"] as String;
    bool completed = json["completed"] as bool;
    return Json(userId, id, title, completed);
  }

  @override
  String toString() {
    return 'UserId: $userId, id: $id, title: $title, completed: $completed';
  }
}

void main() {
  // Easy :
  final transformer = StreamTransformer<Map<String, Object?>, Json>(
      (stream, cancelOnError) =>
          stream.map((event) => Json.fromJson(event)).listen(print));

  // From Handler
  final streamTransformer =
      StreamTransformer<Map<String, Object?>, Json>.fromHandlers(
    handleData: (var data, EventSink handler) {
      handler.add(Json.fromJson(data));
    },
    handleError: (Object error, StackTrace stacktrace, EventSink handler) {
      handler.addError("Jsonda malumot hatolik bervoti $error");
    },
    handleDone: (EventSink handler) {
      handler.close();
    },
  );

  // FromBind
  final streamBind = StreamTransformer<Map<String, Object?>, Json>.fromBind(
          (json) => json.map((event) => Json.fromJson(event)));


  StreamController streamController = StreamController<Map<String, Object?>>();
  final stream = streamController.stream;
  final sink = streamController.sink;
  for (var item in json) {
    sink.add(item);
  }
  var controllerStream = stream.transform(transformer);
  controllerStream.listen((event) => print(event));

}
