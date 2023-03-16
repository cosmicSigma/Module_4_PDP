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
    return User(id, name, username, email, address, phone, website, company);
  }
  Map<String, dynamic> toJson() =>{
    "id":id,
    "name":name,
    "username":username,
    "email":email,
    "address":address.toJson(),
    "phone":phone,
    "website":website,
    "company":company.toJson(),
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

  Map<String, dynamic> toJson() => {
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

  Map<String, dynamic> toJson() => {
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

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };

  @override
  String toString() {
    return 'Geo{lat: $lat, lng: $lng}';
  }
}
final mainJson = {
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
  "address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
    "geo": {
      "lat": "-37.3159",
      "lng": "81.1496",
    }
  },
  "phone": "1-770-736-8031 x56442",
  "website": "hildegard.org",
  "company": {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
  }
};

void main(){
  final user = User.fromJson(mainJson);
  print(user);
}
final subLittleJson = {"lat": "-37.3159", "lng": "81.1496"};

final subJson = {
  "street": "Kulas Light",
  "suite": "Apt. 556",
  "city": "Gwenborough",
  "zipcode": "92998-3874",
};
final parentJson = {
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
};