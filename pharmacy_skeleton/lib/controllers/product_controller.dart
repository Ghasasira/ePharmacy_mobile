import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pharmacy_skeleton/data/dummy_products.dart';
import 'package:pharmacy_skeleton/models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _allProducts = [];
  List<Product> _searchedProducts = [];
  List<Product> _filteredProducts = [];
  Product? selectedProduct;

  List<Product> get allproducts => _allProducts;
  List<Product> get filteredProducts => _filteredProducts;
  List<Product> get searchedProducts => _searchedProducts;

  Future fetchAllProducts() async {
    // simulate network latency by waiting for a second
    await Future.delayed(Duration(seconds: 1));
    _allProducts.addAll(dummyProducts);

    // print("done fetching all products");
    // print(_allProducts);
    filterProduct("all");
    notifyListeners();
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

  void searchProducts(String searchTerm) {
    if (searchTerm.isEmpty) {
      _searchedProducts = [];
    } else {
      _searchedProducts = _allProducts.where((product) {
        return product.productName
            .toLowerCase()
            .contains(searchTerm.toLowerCase());
      }).toList();
    }
    print(searchedProducts.length);
    notifyListeners();
  }

  void filterProduct(String filter) {
    if (filter.toLowerCase() == "all") {
      _filteredProducts = allproducts;
    } else {
      _filteredProducts = _allProducts.where((product) {
        return product.productTags.contains(filter.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
