import 'package:flutter/material.dart';
import 'package:pharmacy_skeleton/controllers/product_controller.dart';
import 'package:pharmacy_skeleton/pharmacy_components/productTile.dart';
import 'package:pharmacy_skeleton/pharmacy_components/search_bar.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SearchTabWidgetActive(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: _productDisplay(productProvider.searchedProducts),
          ),
        ),
      ),
    );
  }

  Widget _productDisplay(List<Product> products) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 150),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductTile(product: products[index]);
      },
    );
  }
}
