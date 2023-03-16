// {"products":[{"id":1,"title":"iPhone 9","description":"An apple mobile which is nothing like apple","price":549,"discountPercentage":12.96,"rating":4.69,"stock":94,"brand":"Apple","category":"smartphones","thumbnail":"https://i.dummyjson.com/data/products/1/thumbnail.jpg","images":["https://i.dummyjson.com/data/products/1/1.jpg","https://i.dummyjson.com/data/products/1/2.jpg","https://i.dummyjson.com/data/products/1/3.jpg","https://i.dummyjson.com/data/products/1/4.jpg","https://i.dummyjson.com/data/products/1/thumbnail.jpg"]}

class Products {
  late int id;
  late String title;
  late String description;
  late num price;
  late num discountPercentage;
  late num rating;
  late num stock;
  late String brand;
  late String category;
  late String thumbnail;
  late List images;

  Products(
      this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images);

    Products.fromJson(Map<String,dynamic> hello) {
      id = hello['id'];
      title = hello['title'];
      description = hello['description'];
      price = hello['price'];
      discountPercentage = hello['discountPercentage'];
      rating = hello['rating'];
      stock = hello['stock'];
      brand = hello['brand'];
      category = hello['category'];
      thumbnail = hello['thumbnail'];
      images = hello['images'];
    }

  @override
  String toString() {
    return 'Products{id: $id, title: $title, description: $description, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, brand: $brand, category: $category, thumbnail: $thumbnail, images: $images}';
  }
}