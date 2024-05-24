import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_skeleton/controllers/product_controller.dart';
import 'package:pharmacy_skeleton/models/product.dart';
import 'package:pharmacy_skeleton/pharmacy_components/cart_button.dart';
import 'package:pharmacy_skeleton/pharmacy_components/pharmacy_filter_tab.dart';
import 'package:pharmacy_skeleton/pharmacy_components/productTile.dart';
import 'package:pharmacy_skeleton/pharmacy_components/search_bar.dart';
import 'package:pharmacy_skeleton/pharmacy_screens/search_screen.dart';
import 'package:provider/provider.dart';

class AllPharmacyProducts extends StatelessWidget {
  const AllPharmacyProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            CartButton(),
          ],
          title: SearchTabWidgetInactive(
            goTo: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            },
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello!",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 46, 45, 45)),
                            ),
                            Text(
                              "Let's get you your Meds",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Have a Prescription?",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Upload Prescription and let us do the rest for you.",
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 122, 216, 125),
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, "/addPrescription");
                                        },
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
                                child:
                                    Image.asset("assets/images/telemeds.png")),
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
                    ],
                  ),
                ),
              ),
            ];
          },
          body: _productDisplay(productProvider.filteredProducts),
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
