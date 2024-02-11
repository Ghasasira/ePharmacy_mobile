import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_skeleton/pharmacy_components/order_info.dart';
import 'package:pharmacy_skeleton/pharmacy_screens/product_details.dart';

class OrderCard extends StatefulWidget {
  final String status;
  final int orderId;
  const OrderCard({super.key, required this.status, required this.orderId});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(ProductDetails());
            },
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
                                      fontSize: 13,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text("Order ID : ${widget.orderId}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                widget.status.toLowerCase() == "delivered"
                                    ? Icons.check_circle
                                    : Icons.info,
                                color:
                                    widget.status.toLowerCase() == "delivered"
                                        ? Colors.green
                                        : Colors.orange,
                                size: 18,
                              ),
                              Text(
                                widget.status,
                                style: TextStyle(
                                  color:
                                      widget.status.toLowerCase() == "delivered"
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
                      isExpanded
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OrderDetailsTile(
                                    label: "1x Panadol",
                                    value: "5,000",
                                  ),
                                  OrderDetailsTile(
                                    label: "1x syrup",
                                    value: "2,000",
                                  ),
                                  OrderDetailsTile(
                                    label: "1x Charcoal Tablets",
                                    value: "60,000",
                                  ),
                                  OrderDetailsTile(
                                    label: "3x Dewormers",
                                    value: "2,000",
                                  ),
                                  OrderDetailsTile(
                                    label: "2x Mabendazole",
                                    value: "10,000",
                                  ),
                                  OrderDetailsTile(
                                    label: "1x Cough Syrup",
                                    value: "5,000",
                                  ),
                                  OrderDetailsTile(
                                    label: "10x face scrub",
                                    value: "30,000",
                                  ),
                                  OrderDetailsTile(
                                    label: "1x ORS",
                                    value: "2,000",
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    OrderDetailsTile(
                                      label: "1x Panadol",
                                      value: "5,000",
                                    ),
                                    Text("... +5")
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
                                value: "50,000",
                              ),
                              OrderDetailsTile(
                                label: "Shipping Cost",
                                value: "2,000",
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
                          value: "52,000",
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
