class Pizza {
  late String name;
  late String cuisine;
  late Reviews reviews;

  Pizza(this.name, this.cuisine, this.reviews);

  factory Pizza.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    String cuisine = json['cuisine'];
    Reviews reviews = json['reviews'].map<Reviews>((e) => Reviews.fromJson(e).toJson());

    return Pizza(name, cuisine, reviews);
  }

  @override
  String toString() {
    return 'Pizza{name: $name, cuisine: $cuisine, reviews: $reviews}';
  }
}

class Reviews {
  num score;
  String review;

  Reviews(this.score, this.review);

  factory Reviews.fromJson(Map<String, dynamic> json) {
    num score = json['score'];
    String review = json['review'];
    return Reviews(score, review);
  }

  Map<String, dynamic> toJson() => {
    'score':score,
    'review':review
  };

  @override
  String toString() {
    return 'Reviews{score: $score, review: $review}';
  }
}