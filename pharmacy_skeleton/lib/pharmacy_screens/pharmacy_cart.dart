import 'package:flutter/material.dart';
import 'package:pharmacy_skeleton/pharmacy_components/cart_productTile.dart';
import 'package:pharmacy_skeleton/pharmacy_components/location_tile.dart';
import 'package:pharmacy_skeleton/pharmacy_components/order_info.dart';

class PharmacyCart extends StatelessWidget {
  const PharmacyCart({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              CartProductTile(),
              CartProductTile(),
              CartProductTile(),
              LocationTile(),
              OrderInfoTile(),
              SizedBox(
                height: 60.0,
              )
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {},
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
    );
  }
}
