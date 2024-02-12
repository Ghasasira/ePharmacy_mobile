import 'package:flutter/material.dart';
import 'package:pharmacy_skeleton/pharmacy_components/cart_button.dart';
import 'package:pharmacy_skeleton/pharmacy_components/order_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            CartButton(),
          ],
          title: Center(
              child: Text(
            'Orders',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                OrderCard(
                  orderId: 1234,
                  status: "Delivered",
                ),
                OrderCard(
                  orderId: 1234,
                  status: "Pending",
                ),
                OrderCard(
                  orderId: 1234,
                  status: "Pending",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
