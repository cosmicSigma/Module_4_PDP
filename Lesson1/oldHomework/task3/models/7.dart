import '../network.dart';

class Activity {
  String activity;
  String type;
  num participants;
  num price;
  String link;
  String key;
  num accessibility;

  Activity(this.activity, this.type, this.participants, this.price, this.link,
      this.key, this.accessibility);

  factory Activity.fromJson(Map<String, dynamic> json) {
    String activity = json['activity'];
    String type = json['type'];
    num participants = json['participants'];
    num price = json['price'];
    String link = json['link'];
    String key = json['key'];
    num accessibility = json['accessibility'];
    
    return Activity(activity, type, participants, price, link, key, accessibility);
  }

  @override
  String toString() {
    return 'Activity{activity: $activity, type: $type, participants: $participants, price: $price, link: $link, key: $key, accessibility: $accessibility}';
  }
}

void main() async {
  Network http = Network();
  String result = await http.get('www.boredapi.com', '/api/activity');
  Activity activity = http.parseOneActivity(result);
  print(activity);
  http.close();
}