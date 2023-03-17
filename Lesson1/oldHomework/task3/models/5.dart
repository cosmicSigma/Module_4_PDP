import '../network.dart';

class Brewery {
  String id;
  String name;
  String brewery_type;
  String street;
  String? address_2;
  String? address_3;
  String city;
  String state;
  String? county_province;
  String postal_code;
  String country;
  String longitude;
  String latitude;
  String phone;
  String? website_url;
  String updated_at;
  String created_at;

  Brewery(
      this.id,
      this.name,
      this.brewery_type,
      this.street,
      this.address_2,
      this.address_3,
      this.city,
      this.state,
      this.county_province,
      this.postal_code,
      this.country,
      this.longitude,
      this.latitude,
      this.phone,
      this.website_url,
      this.updated_at,
      this.created_at);

  factory Brewery.fromJson(Map<String, dynamic> json) {
    String id = json['id'];
    String name = json['name'];
    String brewery_type = json['brewery_type'];
    String street = json['street'];
    String? address_2 = json['address_2'];
    String? address_3 = json['address_3'];
    String city = json['city'];
    String state = json['state'];
    String? county_province = json['county_province'];
    String postal_code = json['postal_code'];
    String country = json['country'];
    String longitude = json['longitude'];
    String latitude = json['latitude'];
    String phone = json['phone'];
    String? website_url = json['website_url'];
    String updated_at = json['updated_at'];
    String created_at = json['created_at'];

    return Brewery(id, name, brewery_type, street, address_2, address_3, city, state, county_province, postal_code, country, longitude, latitude, phone, website_url, updated_at, created_at);
  }

  @override
  String toString() {
    return 'Brewery{id: $id, name: $name, brewery_type: $brewery_type, street: $street, address_2: $address_2, address_3: $address_3, city: $city, state: $state, county_province: $county_province, postal_code: $postal_code, country: $country, longitude: $longitude, latitude: $latitude, phone: $phone, website_url: $website_url, updated_at: $updated_at, created_at: $created_at}';
  }
}

void main() async {
  Network http = Network();
  String result = await http.get('api.openbrewerydb.org', '/breweries/10-56-brewing-company-knox');
  Brewery brewery = http.parseOneBrewery(result);
  print(brewery);
  http.close();
}

