import 'dart:async';
import 'dart:convert';

class User {
  final int id;
  final String title;
  final bool completed;

  User({required this.id, required this.title, required this.completed});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

void main() {
  final jsonString = '''
  [
    {
      "userId": 1,
      "id": 1,
      "title": "delectus aut autem",
      "completed": false
    },
    {
      "userId": 1,
      "id": 2,
      "title": "quis ut nam facilis et officia qui",
      "completed": false
    },
    {
      "userId": 1,
      "id": 3,
      "title": "fugiat veniam minus",
      "completed": true
    }
  ]
''';

  final List<User> users = (jsonDecode(jsonString) as List)
      .map((e) => User.fromJson(e))
      .toList();

  print(users);
}

final transformer = StreamTransformer.fromHandlers(
  handleData: (data, sink) {
    sink.add("$data");
  },
  handleError: (error, stackTrace, sink) {
    sink.addError(error);
  },
  handleDone: (sink) {
    sink.close();
  },
);