final json = {
  "name": "Pizza da Mario",
  "cuisine": "Italian",
  "reviews": [
    {
      "score": 4.5,
      "review": "The pizza was amazing!",
    },
    {
      "score": 5.0,
      "review": "Very friendly staff, excellent service!",
    }
  ]
};

final subJson = [
  {
    "score": 4.5,
    "review": "The pizza was amazing!",
  },
  {
    "score": 5.0,
    "review": "Very friendly staff, excellent service!",
  }
];

class Review {
  double score;
  String review;

  Review(this.score, this.review);

  factory Review.fromJson(Map<String, dynamic> json) {
    double score = json["score"];
    String review = json["review"];
    return Review(score, review);
  }

  Map<String, dynamic> toJson() => {
    "score": score,
    "review": review,
  };

  @override
  String toString() {
    return 'Review{score: $score, review: $review}';
  }
}

class Restaurant {
  String name;
  String cuisine;
  List<Review> reviews;

  Restaurant(this.name, this.cuisine, this.reviews);

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    String name = json["name"];
    String cuisine = json["cuisine"];
    // List<Review> reviews = json["reviews"] /*json["reviews"] = subJson*/;
    // method one
    List<Review> reviews = json["reviews"].map<Review>((map) => Review.fromJson(map)).toList();

    // method two
    List<Review> listTwo = [];
    for(Map<String, dynamic> map in json["reviews"]) {
      listTwo.add(Review.fromJson(map));
    }

    return Restaurant(name, cuisine, listTwo);
  }

  @override
  String toString() {
    return 'Restaurant{name: $name, cuisine: $cuisine, reviews: $reviews}';
  }
}

void main() {
  /*// method one
  List<Review> list = subJson.map((map) => Review.fromJson(map)).toList();

  // method two
  List<Review> listTwo = [];
  for(Map<String, dynamic> map in subJson) {
    listTwo.add(Review.fromJson(map));
  }*/

  Restaurant restaurant = Restaurant.fromJson(json);
  print(restaurant);
}