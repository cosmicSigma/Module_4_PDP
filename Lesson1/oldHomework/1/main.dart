import 'class.dart';

Map<String, dynamic> map = {
  "name":"Pizza da Mario",
  "cuisine": "Italian",
  "reviews": [
    {
      "score":4.5,
      "review":"The pizza is amazing"
    },
    {
      "score":5,
      "review":"very friendly staff"
    }
  ]
};

void main() {
  parseFromJsonPizza();
}

void parseFromJsonPizza() {
  Pizza pizza = Pizza.fromJson(map);
  print(pizza.name);
  print(pizza.cuisine);
  print(pizza.reviews);
}