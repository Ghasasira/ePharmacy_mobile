import 'package:pharmacy_skeleton/models/cart.dart';
import 'package:pharmacy_skeleton/models/product.dart';

class OrderItem {
  final String? status;
  final int subTotal;
  final int shipping;
  final String orderId;
  final int totalCost;
  final List<CartItem> productList;
  final String location;

  OrderItem({
    required this.orderId,
    this.status,
    required this.subTotal,
    required this.shipping,
    required this.productList,
    required this.location,
  }) : totalCost = subTotal + shipping;
}
