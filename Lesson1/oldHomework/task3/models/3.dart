import '../network.dart';

class Products {
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;
  Map rating;

  Products(this.id, this.title, this.price, this.description, this.category,
      this.image, this.rating);

  factory Products.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    String title = json['title'];
    num price = json['price'];
    String description = json['description'];
    String category = json['category'];
    String image = json['image'];
    Map rating = json['rating'];

    return Products(id, title, price, description, category, image, rating);
  }

  Map<String, dynamic> toJson() => {
    'id':id,
    'title':title,
    'price':price,
    'description':description,
    'category':category,
    'image':image,
    'rating':rating
};

  @override
  String toString() {
    return 'Products{id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating}';
  }
}

// class Rating {
//   double rate;
//   int count;
//
//   Rating(this.rate, this.count);
//
//   factory Rating.fromJson(Map<String, dynamic> ratingJson){
//     double rate = ratingJson['rate'];
//     int count = ratingJson['count'];
//
//     return Rating(rate, count);
//   }
//
//   Map<String, dynamic> toJson() => {
//     'rate':rate,
//     'count':count
//   };
//
//   @override
//   String toString() {
//     return 'Rating{rate: $rate, count: $count}';
//   }
// }

void main() async {
  Network http = Network();
  String result = await http.get("fakestoreapi.com", '/products', 1);
  Products products = http.parseOneProduct(result);
  print(products);
  http.close();
}
