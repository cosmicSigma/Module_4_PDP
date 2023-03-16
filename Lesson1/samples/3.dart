// main
import 'dart:convert';
import 'dart:io';
class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User(this.id, this.name, this.username, this.email, this.address, this.phone,
      this.website, this.company);

  factory User.fromJson(Map<String, dynamic> json){
    int id = json["id"];
    String name = json["name"];
    String username = json["username"];
    String email = json["email"];
    Address address = Address.fromJson(json["address"]);
    String phone = json["phone"];
    String website = json["website"];
    Company company = Company.fromJson(json["company"]);
    return User(
        id,
        name,
        username,
        email,
        address,
        phone,
        website,
        company);
  }

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "company": company.toJson(),
      };

  @override
  String toString() {
    return 'User{id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company,}';
  }
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company(this.name, this.catchPhrase, this.bs);

  factory Company.fromJson(Map<String, dynamic> json) {
    String name = json["name"];
    String catchPhrase = json["catchPhrase"];
    String bs = json["bs"];
    return Company(name, catchPhrase, bs);
  }

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };

  @override
  String toString() {
    return 'Company{name: $name, catchPhrase: $catchPhrase, bs: $bs}';
  }
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address(this.street, this.suite, this.city, this.zipcode, this.geo);

  factory Address.fromJson(Map<String, dynamic> json) {
    String street = json["street"];
    String suite = json["suite"];
    String city = json["city"];
    String zipcode = json["zipcode"];
    Geo geo = Geo.fromJson(json['geo']);

    return Address(street, suite, city, zipcode, geo);
  }

  Map<String, dynamic> toJson() =>
      {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
      };

  @override
  String toString() {
    return 'Address{street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo}';
  }
}

class Geo {
  String lat;
  String lng;

  Geo(this.lat, this.lng);

  factory Geo.fromJson(Map<String, dynamic> json) {
    String lat = json["lat"];
    String lng = json["lng"];
    return Geo(lat, lng);
  }

  Map<String, dynamic> toJson() =>
      {
        "lat": lat,
        "lng": lng,
      };

  @override
  String toString() {
    return 'Geo{lat: $lat, lng: $lng}';
  }
}

void main() async {
  Network http = Network();
  String result = await http.get(Api.baseUrl, Api.user.path);
  List list = jsonDecode(result);

  List<User> users = list.map<User>((map) => User.fromJson(map)).toList();
  for(final user in users) {
    print(user);
  }

  http.close();
}

// network

class Network {
  // class setting: singleton
  Network._();
  static final _instance = Network._();
  factory Network() => _instance;

  // object for connection network
  final _network = HttpClient();
  void close() => _network.close();

  // Methods
  Future<String> get(String baseUrl, String path, [int? id]) async {
    final url = Uri.https(baseUrl, "$path${id != null ? "/$id": ""}");
    final request = await _network.getUrl(url);
    request.headers.contentType = ContentType("application", "json", charset: "utf-8");
    final response = await request.close();
    String result = await response.transform(utf8.decoder).join();
    return result;
  }

  Future<String> post(String baseUrl, String path, Map<String, dynamic> body) async {
    final url = Uri.https(baseUrl, path);
    final request = await _network.postUrl(url);
    request.headers.contentType = ContentType("application", "json", charset: "utf-8");

    String data = jsonEncode(body);
    List<int> dataByte = utf8.encode(data);
    request.add(dataByte);

    final response = await request.close();
    String result = await response.transform(utf8.decoder).join();
    return result;
  }

  Future<String> put(String baseUrl, String path, int id, Map<String, dynamic> body) async {
    final url = Uri.https(baseUrl, "$path/$id");
    final request = await _network.putUrl(url);
    request.headers.contentType = ContentType("application", "json", charset: "utf-8");

    String data = jsonEncode(body);
    List<int> dataByte = utf8.encode(data);
    request.add(dataByte);

    final response = await request.close();
    String result = await response.transform(utf8.decoder).join();
    return result;
  }

  Future<String> patch(String baseUrl, String path, int id, Map<String, dynamic> body) async {
    final url = Uri.https(baseUrl, "$path/$id");
    final request = await _network.patchUrl(url);
    request.headers.contentType = ContentType("application", "json", charset: "utf-8");

    String data = jsonEncode(body);
    List<int> dataByte = utf8.encode(data);
    request.add(dataByte);

    final response = await request.close();
    String result = await response.transform(utf8.decoder).join();
    return result;
  }

  Future<String> delete(String baseUrl, String path, int id) async {
    final url = Uri.https(baseUrl, "$path/$id");
    final request = await _network.deleteUrl(url);
    request.headers.contentType = ContentType("application", "json", charset: "utf-8");
    final response = await request.close();
    String result = await response.transform(utf8.decoder).join();
    return result;
  }
}

// api
enum Api {
  album("/albums"),
  post("/posts"),
  comment("/comments"),
  todo("/todos"),
  user("/users"),
  photo("/photos");

  const Api(this.path);
  final String path;

  static final baseUrl = "jsonplaceholder.typicode.com";
}