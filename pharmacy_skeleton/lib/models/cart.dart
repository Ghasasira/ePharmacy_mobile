import 'package:pharmacy_skeleton/models/product.dart';

class Cart {
  final List product;
  final int subTotal;
  final int? shippingFee;
  final int total;
  final String? location;

  Cart({
    this.shippingFee,
    this.location,
    required this.product,
    required this.subTotal,
    required this.total,
  });
}
