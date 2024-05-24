import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_skeleton/controllers/cart_controller.dart';
import 'package:pharmacy_skeleton/controllers/order_controller.dart';
import 'package:pharmacy_skeleton/controllers/shipping_controller.dart';
import 'package:provider/provider.dart';

class OrderInfoTile extends StatefulWidget {
  const OrderInfoTile({super.key});

  @override
  State<OrderInfoTile> createState() => _OrderInfoTileState();
}

class _OrderInfoTileState extends State<OrderInfoTile> {
  int shipping = 0;
  setShipping() {
    setState(() {
      shipping = 2000;
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: true);
    // OrderProvider orderProvider =
    //     Provider.of<OrderProvider>(context, listen: true);
    ShippingProvider shippingProvider =
        Provider.of<ShippingProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Card(
          color: Colors.white,
          elevation: 5.0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      "Order info",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Column(
                    children: [
                      OrderDetailsTile(
                        label: "Cart(${cartProvider.items.length.toString()})",
                        value: cartProvider
                            .getAllProductSubtotalPrice()
                            .toString(),
                      ),
                      OrderDetailsTile(
                          label: "Shipping Cost",
                          value: shippingProvider.shippingFee < 1
                              ? "___"
                              : shippingProvider.shippingFee.toString()
                          //shipping.toString(),
                          ),
                      OrderDetailsTile(
                        label: "Total",
                        value: (cartProvider.getAllProductSubtotalPrice() +
                                shippingProvider.shippingFee)
                            .toString(),
                      ),
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

class OrderDetailsTile extends StatelessWidget {
  final String label;
  final String? value;
  const OrderDetailsTile({
    super.key,
    required this.label,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: label.toLowerCase() == "total"
                  ? FontWeight.bold
                  : FontWeight.w500,
              fontSize: label.toLowerCase() == "total" ? 15 : 13,
            ),
          ),
          Text(
            "UGX " + value!,
            style: TextStyle(
              fontWeight: label.toLowerCase() == "total"
                  ? FontWeight.bold
                  : FontWeight.w500,
              fontSize: label.toLowerCase() == "total" ? 15 : 13,
            ),
          ),
        ],
      ),
    );
  }
}
