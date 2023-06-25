// OOP cart structure
// Divided in Product, Order and Cart
// Product is added to Order. Exactly to List<Product> products
// Order is added to Cart

class Product {
  String? name;
  double? price;
  String? vendor;
  String? type;
  int? quantity;

  Product({
    this.name,
    this.price,
    this.vendor,
    this.type,
    this.quantity,
  });
}

class Order {
  String? vendor;
  String? email;
  String? message;
  List<Product>? products;

  // {
  // 'Vendor': 'RovenCarta',
  // 'email': 'RovenCartaEmail',
  // 'message': '',
  // 'products': [],
  //   },

  Order({this.email, this.message, this.products, this.vendor});
  // Object? order = {
  //   'vendor': vendor,
  // };
}
