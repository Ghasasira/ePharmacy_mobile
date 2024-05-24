import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_skeleton/models/order.dart';
import 'package:pharmacy_skeleton/pharmacy_components/order_info.dart';
import 'package:pharmacy_skeleton/pharmacy_screens/product_details.dart';

class OrderCard extends StatefulWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    Order order = widget.order;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 5,
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "6th Feb, 2024",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text("Order ID : ${order.orderId}",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                order.status!.toLowerCase() == "delivered"
                                    ? Icons.check_circle
                                    : Icons.info,
                                color:
                                    order.status!.toLowerCase() == "delivered"
                                        ? Colors.green
                                        : Colors.orange,
                                size: 18,
                              ),
                              Text(
                                order.status!,
                                style: TextStyle(
                                  color:
                                      order.status!.toLowerCase() == "delivered"
                                          ? Colors.green
                                          : Colors.orange,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                        height: 5,
                      ),

                      isExpanded || order.productList.length < 2
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: order.productList.map((orderItem) {
                                  return OrderDetailsTile(
                                    label:
                                        "${orderItem.quantity}x ${orderItem.productName}",
                                    value: "${orderItem.productTotalPrice}",
                                  );
                                }).toList(),
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    OrderDetailsTile(
                                      label:
                                          "${order.productList[0].quantity}x ${order.productList[0].productName}",
                                      value:
                                          "${order.productList[0].productTotalPrice}",
                                    ),
                                    Text(
                                      "... \+${order.productList.length - 1}",
                                      style: TextStyle(color: Colors.blue),
                                    )
                                  ]),
                            ),
                      Visibility(
                        visible: isExpanded,
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                          height: 5,
                        ),
                      ),
                      Visibility(
                        visible: isExpanded,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OrderDetailsTile(
                                label: "Subtotal",
                                value: "${order.subTotal}",
                              ),
                              OrderDetailsTile(
                                label: "Shipping Cost",
                                value: "${order.shippingCost}",
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: OrderDetailsTile(
                          label: "Total",
                          value: "${order.totalCost}",
                        ),
                      ),
                      // SizedBox(
                      //   height: 20.0,
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  height: 25.0,
                  width: 25.0,
                  child: Center(
                    child: Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
              // IconButton(
              //     onPressed:
              //     icon: Icon(
              //         isExpanded ? Icons.expand_less : Icons.expand_circle_down)),
              )
        ],
      ),
    );
  }
}
