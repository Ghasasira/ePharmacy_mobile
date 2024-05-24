import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_skeleton/controllers/product_controller.dart';
import 'package:pharmacy_skeleton/pharmacy_screens/product_details.dart';
import 'package:pharmacy_skeleton/pharmacy_screens/search_screen.dart';
import 'package:provider/provider.dart';

class SearchTabWidgetInactive extends StatelessWidget {
  final VoidCallback goTo;
  const SearchTabWidgetInactive({super.key, required this.goTo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: goTo,
      //Navigator.push(context,

      child: Container(
        height: 35.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: 20,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "Search Medicines",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      // TextField(
      //   enabled: false,
      //   //controller: controller,
      //   decoration: InputDecoration(
      //       prefixIcon: Icon(Icons.search),
      //       border: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(20.0),
      //         borderSide: BorderSide(color: Colors.green),
      //       ),
      //       hintText: "Search Medicines"),
      //   //onChanged: searchPharmacy,
      // ),
    );
  }
}

class SearchTabWidgetActive extends StatelessWidget {
  // VoidCallback(String) searchItems;
  const SearchTabWidgetActive({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: true);

    void searchPharmacy(String value) {
      productProvider.searchProducts(value);
    }

    return Container(
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(hintText: "Search Medicines"),
        onChanged: searchPharmacy,
        onSubmitted: searchPharmacy,
      ),
    );
  }
}
