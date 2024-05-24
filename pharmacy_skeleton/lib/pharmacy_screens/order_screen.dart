import 'package:flutter/material.dart';
import 'package:pharmacy_skeleton/controllers/order_controller.dart';
import 'package:pharmacy_skeleton/pharmacy_components/cart_button.dart';
import 'package:pharmacy_skeleton/pharmacy_components/order_card.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderProvider orderProvider =
        Provider.of<OrderProvider>(context, listen: true);
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
              fontWeight: FontWeight.w600,
            ),
          )),
          backgroundColor: Colors.white,
        ),
        body: orderProvider.orders.length > 0
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: orderProvider.orders.map((order) {
                      return OrderCard(
                        order: order,
                      );
                    }).toList(),
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: Text("No Orders made yet"),
                ),
              ),
      ),
    );
  }
}
