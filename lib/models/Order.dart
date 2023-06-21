class Order {
  String? vendor;
  String? email;
  String? message;
  List<Map<String, dynamic>>? products;

  Order({this.email, this.message, this.products, this.vendor});
  // Object? order = {
  //   'vendor': vendor,
  // };
}
