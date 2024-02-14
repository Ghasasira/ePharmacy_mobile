import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pharmacy_skeleton/data/dummy_products.dart';
import 'package:pharmacy_skeleton/models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  Product? selectedProduct;

  List<Product> get allproducts => _allProducts;
  List<Product> get filteredProducts => _filteredProducts;

  Future fetchAllProducts() async {
    // simulate network latency by waiting for a second
    await Future.delayed(Duration(seconds: 1));
    _allProducts.addAll(dummyProducts);
    notifyListeners();
    // print("done fetching all products");
    // print(_allProducts);
  }

  void setProduct(Product selectedProduct) {
    selectedProduct = selectedProduct;
    notifyListeners();
  }

  Future fetchSingleProduct(int prodId) async {
    _allProducts.forEach((product) {
      if (product.id == prodId) {
        selectedProduct = product;
        return;
      }
    });
    //selectedProduct = _allProducts.where((product) => product.id == prodId);
    notifyListeners();
  }

  void filterProduct() {
    notifyListeners();
  }
}
