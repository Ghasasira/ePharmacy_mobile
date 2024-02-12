import 'package:flutter/material.dart';
import 'package:pharmacy_skeleton/pharmacy_components/cart_button.dart';
import 'package:pharmacy_skeleton/pharmacy_components/pharmacy_filter_tab.dart';
import 'package:pharmacy_skeleton/pharmacy_components/productTile.dart';
import 'package:pharmacy_skeleton/pharmacy_components/search_bar.dart';

class AllPharmarcyProducts extends StatelessWidget {
  const AllPharmarcyProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Hello!",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 46, 45, 45)),
                              ),
                              CartButton(),
                            ],
                          ),
                        ),
                        Text(
                          "Let's get you your Meds",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: SearchTabWidgetInactive(),
                    height: 60.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 180.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(88, 5, 245, 225),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Have a Prescription?",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    //color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Upload Prescription and tell us what you need. We'll do the rest",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  //textAlign: TextAlign.center,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 122, 216, 125),
                                    ),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Order Now",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Image.asset("assets/images/telemeds.png")),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  PharmacyFilterTab(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Wrap(
                    children: [
                      ProductTile(),
                      ProductTile(),
                      ProductTile(),
                      ProductTile(),
                      ProductTile(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
