import 'apis.dart';
import 'class.dart';
import 'network.dart';

Map<String, dynamic> map = {
    "id": 1,
    "title": "iPhone 9",
    "description": "An apple mobile which is nothing like apple",
    "price": 549,
    "discountPercentage": 12.96,
    "rating": 4.69,
    "stock": 94,
    "brand": "Apple",
    "category": "smartphones",
    "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
    "images": [
      "https://i.dummyjson.com/data/products/1/1.jpg",
      "https://i.dummyjson.com/data/products/1/2.jpg",
      "https://i.dummyjson.com/data/products/1/3.jpg",
      "https://i.dummyjson.com/data/products/1/4.jpg",
      "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
    ]
};

void main() async{
  Network http = Network();
  String result = await http.get(Api.baseUrl, Api.products.path,1);
  Products products = http.parseOneProduct(result);
  print(products);
  parseJson();
  http.close();
}

void parseJson() {
  Products products = Products.fromJson(map);
  print(products.id);
  print(products.title);
  print(products.description);
  print(products.price);
  print(products.discountPercentage);
  print(products.rating);
  print(products.stock);
  print(products.brand);
  print(products.category);
  print(products.thumbnail);
  print(products.images);
}