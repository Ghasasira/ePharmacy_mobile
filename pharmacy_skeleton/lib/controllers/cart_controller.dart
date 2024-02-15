import 'package:flutter/material.dart';
import 'package:pharmacy_skeleton/models/cart.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int itemId) {
    _items.removeWhere((item) => item.id == itemId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  void increaseItemQuantity(int itemId) {
    for (var item in _items) {
      if (item.id == itemId) {
        item.quantity++;
        notifyListeners();
        return;
      }
    }
  }

  int getSingleProductQuantity(int itemId) {
    int quantity = 0;
    for (var item in _items) {
      if (item.id == itemId) {
        quantity = item.quantity;
      }
    }
    return quantity;
  }

  int getSingleProductSubtotalPrice(int itemId) {
    int quantity = 0;
    int price = 0;
    for (var item in _items) {
      if (item.id == itemId) {
        quantity = item.quantity;
        price = item.productPrice;
      }
    }
    return quantity * price;
  }

  int getAllProductSubtotalPrice() {
    int total = 0;
    for (var item in _items) {
      total += item.quantity * item.productPrice;
    }
    return total;
  }

  void reduceItemQuantity(int itemId) {
    for (var item in _items) {
      if (item.id == itemId) {
        item.quantity--;
        if (item.quantity == 0) {
          removeItem(item.id);
        }
        notifyListeners();
        return;
      }
    }
  }

//check if item is in cart
  bool isInCart(int itemId) {
    bool isInCart = false;
    for (var item in _items) {
      if (item.id == itemId) {
        isInCart = true;
      }
    }
    return isInCart;
  }
}
