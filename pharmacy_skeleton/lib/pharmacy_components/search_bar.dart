import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_skeleton/pharmacy_screens/search_screen.dart';

class SearchTabWidgetInactive extends StatelessWidget {
  const SearchTabWidgetInactive({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(SearchScreen());
      },
      child: TextField(
        enabled: false,
        //controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.green),
            ),
            hintText: "Search Medicines"),
        onChanged: searchPharmacy,
      ),
    );
  }
}

class SearchTabWidgetActive extends StatelessWidget {
  const SearchTabWidgetActive({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        autofocus: true,
        //controller: controller,
        decoration: InputDecoration(hintText: "Search Medicines"),
        onChanged: searchPharmacy,
      ),
    );
  }
}

void searchPharmacy(String value) {}
