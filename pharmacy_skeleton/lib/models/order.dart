import 'package:pharmacy_skeleton/models/cart.dart';
import 'package:pharmacy_skeleton/models/product.dart';

class Order {
  final String? status;
  final int subTotal;
  final int shippingCost;
  final String shippingAddress;
  final String orderId;
  final int totalCost;
  final List<CartItem> productList;

  Order({
    required this.orderId,
    this.status = "Pending",
    required this.subTotal,
    required this.shippingAddress,
    required this.shippingCost,
    required this.productList,
  }) : totalCost = subTotal + shippingCost;
}
