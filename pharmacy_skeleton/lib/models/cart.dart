import 'package:pharmacy_skeleton/models/product.dart';

class CartItem {
  final int id;
  final String productName;
  int quantity;
  final int productPrice;
  int productTotalPrice;

  CartItem({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.productPrice,
  }) : productTotalPrice = quantity * productPrice;

  factory CartItem.fromProduct(Product product, int quantity) {
    return CartItem(
      id: product.id,
      productName: product.productName,
      productPrice: product.productPrice, // Assuming productPrice is double
      quantity: quantity,
      //productTotalPrice: (quantity * product.productPrice),
    );
  }
}
