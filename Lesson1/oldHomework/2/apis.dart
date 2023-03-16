enum Api {
  products("/products");

  const Api(this.path);
  final String path;

  static final baseUrl = "dummyjson.com";
}