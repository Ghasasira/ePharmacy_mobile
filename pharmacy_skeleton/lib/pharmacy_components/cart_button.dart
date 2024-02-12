import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_skeleton/pharmacy_screens/pharmacy_cart.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PharmacyCart());
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Row(
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                color: Colors.green,
                size: 30,
              ),
              SizedBox(
                width: 10.0,
              ),
            ],
          ),
          Positioned(
            right: 3,
            top: 0,
            child: Container(
                constraints: BoxConstraints(
                  minWidth: 15.0,
                  minHeight: 15.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Center(
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
