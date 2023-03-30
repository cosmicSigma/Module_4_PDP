import "dart:convert";

void main() async {

  createFileJsonToClass(
      json: {
        "userId": 1,
        "id": 1,
        "title":"Isunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body":"quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      },
      fileName: 'dart11.dart'
  );
  print(json);
}

void createFileJsonToClass({ required Map<String, Object> json, required String fileName}) async {
  StringBuffer jsonToClass = StringBuffer();
  String className = fileName[0].toUpperCase()+ fileName.substring(1);
  jsonToClass.write("class $className");
  jsonToClass.write("{\n");
// fields
  json.forEach((key, value) {
    jsonToClass.writeln("");
  });
}