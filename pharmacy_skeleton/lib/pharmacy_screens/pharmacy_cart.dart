import 'package:flutter/material.dart';
import 'package:pharmacy_skeleton/controllers/cart_controller.dart';
import 'package:pharmacy_skeleton/controllers/order_controller.dart';
import 'package:pharmacy_skeleton/models/order.dart';
import 'package:pharmacy_skeleton/pharmacy_components/cart_productTile.dart';
import 'package:pharmacy_skeleton/pharmacy_components/location_tile.dart';
import 'package:pharmacy_skeleton/pharmacy_components/order_info.dart';
import 'package:provider/provider.dart';

class PharmacyCart extends StatelessWidget {
  const PharmacyCart({super.key});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Cart',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          actions: [
            TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.horizontal_rule_sharp,
                  color: Colors.white,
                )),
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          backgroundColor: Colors.white,
        ),
        body: Provider.of<CartProvider>(context, listen: false).items.length > 0
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Column(
                            children: cartProvider.items
                                .map((item) => CartProductTile(
                                      cartItem: item,
                                    ))
                                .toList(),
                          ),
                          LocationTile(),
                          OrderInfoTile(),
                          SizedBox(
                            height: 60.0,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                onPressed: () {
                                  Provider.of<OrderProvider>(context,
                                          listen: true)
                                      .makeAnOrder(OrderItem(
                                    orderId: "A1233",
                                    subTotal: cartProvider
                                        .getAllProductSubtotalPrice(),
                                    shipping: 1000,
                                    productList: cartProvider.items,
                                    location: "Wandegeya",
                                  ));
                                },
                                child: Text(
                                  "Check Out(UGX 52,000)",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                child: Center(
                  child: Text("Nothing to show here"),
                ),
              ),
      ),
      //   floatingActionButton: SizedBox(
      //     width: MediaQuery.of(context).size.width,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         SizedBox(
      //           width: MediaQuery.of(context).size.width * 0.8,
      //           child: ElevatedButton(
      //             style:
      //                 ElevatedButton.styleFrom(backgroundColor: Colors.green),
      //             onPressed: () {},
      //             child: Text(
      //               "Check Out(UGX 52,000)",
      //               style: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 color: Colors.white,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
