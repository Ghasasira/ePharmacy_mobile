import 'package:flutter/material.dart';
import 'package:pharmacy_skeleton/controllers/product_controller.dart';
import 'package:provider/provider.dart';

class PharmacyFilterTab extends StatefulWidget {
  const PharmacyFilterTab({super.key});

  @override
  State<PharmacyFilterTab> createState() => _PharmacyFilterTabState();
}

class _PharmacyFilterTabState extends State<PharmacyFilterTab> {
  List filterTags = [
    "All",
    "Tablets",
    "Syrup",
    "Adults",
    "Children",
    "Suppliments",
  ];
  String chosenTag = "All";

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: true);
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: filterTags.map((e) {
            bool isChosen = (e == chosenTag);
            return GestureDetector(
              onTap: () {
                setState(() {
                  chosenTag = e;
                });
                productProvider.filterProduct(e);
              },
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  padding: EdgeInsets.only(
                    top: 3.0,
                    bottom: 3.0,
                    left: 12.0,
                    right: 12.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(18.0),
                    color: isChosen
                        ? Color.fromARGB(255, 134, 231, 215)
                        : Colors.white,
                  ),
                  child: Center(
                      child: Text(
                    e,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: isChosen ? Colors.white : Colors.black,
                      fontWeight:
                          isChosen ? FontWeight.bold : FontWeight.normal,
                    ),
                  )),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
