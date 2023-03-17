import '../network.dart';

class IP {
  String ip;

  IP(this.ip);

  factory IP.fromJson(Map<String, dynamic> json) {
    String ip = json['ip'];

    return IP(ip);
  }
}

void main() async {
  Network http = Network();
  String result = await http.get('api.ipify.org', '/?format=json');
  if (result.isEmpty) {
    print('Error: API call returned empty response');
    return;
  }
  try {
    IP ip = http.parseOneIP(result);
    print(ip);
  } catch (e) {
    print('Error parsing JSON: $e');
  }
  http.close();
}
