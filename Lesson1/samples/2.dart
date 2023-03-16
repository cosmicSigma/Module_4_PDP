Map<String, dynamic> map = {
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
  "address": [
    {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
    },
    {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
    },
  ],
};

class Address {
  String street;
  String suite;
  String city;
  String zipcode;

  Address(this.street, this.suite, this.city, this.zipcode);

  factory Address.fromJson(Map<String, dynamic> json) {
    String street = json['street'];
    String suite = json['suite'];
    String city = json['city'];
    String zipcode = json['zipcode'];

    return Address(street, suite, city, zipcode);
  }

  Map<String, dynamic> toJson() => {
    'street' : street,
    'suite' : suite,
    'city' : city,
    'zipcode' : zipcode
  };

  @override
  String toString() {
    return 'Address{street: $street, suite: $suite, city: $city, zipcode: $zipcode}';
  }
}

class User {
  int id;
  String name;
  String username;
  String email;
  List<Address> address;

  User(this.id, this.name, this.username, this.email, this.address);

  factory User.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    String name = json['name'];
    String username = json['username'];
    String email = json['email'];

    List<Address> address = json["address"].map<Address>((map) => Address.fromJson(map)).toList();
    return User(id, name, username, email, address);
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, username: $username, email: $email, address: $address}';
  }
}

void main() {
  User user = User.fromJson(map);
  print(user);
}