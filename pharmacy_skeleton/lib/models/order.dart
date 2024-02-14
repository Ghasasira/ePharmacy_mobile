import 'package:pharmacy_skeleton/models/product.dart';

class Order {
  final String status;
  final int subTotal;
  final int shipping;
  final String orderId;
  final int total;
  final int productList;
  final String location;

  Order({
    required this.orderId,
    required this.status,
    required this.subTotal,
    required this.shipping,
    required this.productList,
    required this.total,
    required this.location,
  });
}
