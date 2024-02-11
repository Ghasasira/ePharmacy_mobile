import 'package:flutter/material.dart';

class OrderInfoTile extends StatelessWidget {
  const OrderInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
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
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Column(
                    children: [
                      OrderDetailsTile(
                        label: "Cart(1)",
                        value: "50,000",
                      ),
                      OrderDetailsTile(
                        label: "Shipping Cost",
                        value: "2,000",
                      ),
                      OrderDetailsTile(
                        label: "Total",
                        value: "52,000",
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
              fontSize: label.toLowerCase() == "total" ? 18 : 16,
            ),
          ),
          Text(
            "UGX " + value!,
            style: TextStyle(
              fontWeight: label.toLowerCase() == "total"
                  ? FontWeight.bold
                  : FontWeight.w500,
              fontSize: label.toLowerCase() == "total" ? 18 : 16,
            ),
          ),
        ],
      ),
    );
  }
}
