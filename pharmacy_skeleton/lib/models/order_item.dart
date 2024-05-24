import 'package:pharmacy_skeleton/models/product.dart';

class OrderItem {
  final int id;
  final String productName;
  int quantity;
  final int productPrice;
  int productTotalPrice;

  OrderItem({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.productPrice,
  }) : productTotalPrice = quantity * productPrice;

  // factory OrderItem.fromProduct(Product product, int quantity) {
  //   return OrderItem(
  //     id: product.id,
  //     productName: product.productName,
  //     productPrice: product.productPrice, // Assuming productPrice is double
  //     quantity: quantity,
  //     //productTotalPrice: (quantity * product.productPrice),
  //   );
  // }
}
