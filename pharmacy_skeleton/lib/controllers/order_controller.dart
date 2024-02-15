import 'package:flutter/material.dart';
import 'package:pharmacy_skeleton/models/order.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders => _orders;

  void makeAnOrder(OrderItem item) {
    _orders.add(item);
    notifyListeners();
  }

  void cancelAnOrder(String orderId) {
    _orders.removeWhere((item) => item.orderId == orderId);
    notifyListeners();
  }

  int getOrderTotalFee(String orderId) {
    int total = 0;
    for (OrderItem item in _orders) {
      if (item.orderId == orderId) {
        total += item.totalCost;
      }
    }
    return total;
  }
}
