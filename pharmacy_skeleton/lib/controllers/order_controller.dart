import 'package:flutter/material.dart';
import 'package:pharmacy_skeleton/controllers/cart_controller.dart';
import 'package:pharmacy_skeleton/models/cart.dart';
import 'package:pharmacy_skeleton/models/order.dart';
import 'package:provider/provider.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => _orders;

  void makeAnOrder(Order item, List<CartItem> cartItems) {
    _orders.add(item);
    // item.productList.addAll(cartItems);
    // for (CartItem cartItem in cartItems) {
    //   item.productList.addAll(cartItems);
    // }
    notifyListeners();
  }

  void cancelAnOrder(String orderId) {
    _orders.removeWhere((item) => item.orderId == orderId);

    notifyListeners();
  }

  int getOrderTotalFee(String orderId) {
    int total = 0;
    for (Order item in _orders) {
      if (item.orderId == orderId) {
        total += item.totalCost;
      }
    }
    return total;
  }
}
