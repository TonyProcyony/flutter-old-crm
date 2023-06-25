import 'package:flutter_old_crm/models/Product.dart';

class Orders {
  String? vendor;
  String? email;
  String? emailSubject;
  String? message;
  List<Product>? products;

  Orders(
      {this.email,
      this.message,
      this.products,
      this.vendor,
      this.emailSubject});
}
