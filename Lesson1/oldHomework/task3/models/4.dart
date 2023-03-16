import '../network.dart';
class Woof {
  int fileSizeBytes;
  String url;

  Woof(this.fileSizeBytes, this.url);

  factory Woof.fromJson(Map<String, dynamic> json) {
    int fileSizeBytes = json['fileSizeBytes'];
    String url = json['url'];

    return Woof(fileSizeBytes, url);
  }

  @override
  String toString() {
    return 'Woof{fileSizeBytes: $fileSizeBytes, url: $url}';
  }
}

void main() async {
  Network http = Network();
  String result = await http.get('random.dog', '/woof.json');
  Woof woof = http.parseOneWoof(result);
  print(woof);
  http.close();
}