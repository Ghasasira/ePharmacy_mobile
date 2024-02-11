import 'package:flutter/material.dart';

class PharmacyFilterTab extends StatefulWidget {
  const PharmacyFilterTab({super.key});

  @override
  State<PharmacyFilterTab> createState() => _PharmacyFilterTabState();
}

class _PharmacyFilterTabState extends State<PharmacyFilterTab> {
  List filterTags = [
    "All",
    "Tablet",
    "Syrup",
    "Adults",
    "Children",
    "Suppliments",
    "Adults",
    "Children",
    "Suppliments"
  ];
  String chosenTag = "All";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 45.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: filterTags.map((e) {
            bool isChosen = (e == chosenTag);
            return GestureDetector(
              onTap: () {
                setState(() {
                  chosenTag = e;
                });
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
