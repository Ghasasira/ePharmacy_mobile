import 'package:flutter/material.dart';
import 'package:pharmacy_skeleton/controllers/cart_controller.dart';
import 'package:pharmacy_skeleton/models/cart.dart';
import 'package:provider/provider.dart';

class CartProductTile extends StatelessWidget {
  final CartItem cartItem;
  const CartProductTile({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    //CartItem cartItem = cartItem;
    var cartProvider = Provider.of<CartProvider>(context, listen: true);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.98,
      height: 110.0,
      child: Card(
        color: Colors.white,
        elevation: 5.0,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                10.0,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      "assets/images/tablets_pic.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.6,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                    bottom: 5.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: ProductCartDetails(
                    cartItem: cartItem,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  cartProvider.removeItem(cartItem.id);
                },
                child: Container(
                  width: 25.0,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 15.0,
                    ),
                    child: Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: 30.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCartDetails extends StatelessWidget {
  CartItem cartItem;

  ProductCartDetails({
    super.key,
    required this.cartItem,
  });

  // void reduceQuantity() {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context, listen: true);

    return SizedBox(
      height: 100.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            cartItem.productName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "UGX " + cartItem.productPrice.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
              Container(
                  //decoration: BoxDecoration(),
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width * 0.25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          cartProvider.reduceItemQuantity(cartItem.id);
                        },
                        child: Container(
                          height: 25.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.remove,
                            size: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        cartItem.quantity.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          cartProvider.increaseItemQuantity(cartItem.id);
                        },
                        child: Container(
                          height: 25.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class AddRemoveButtons extends StatelessWidget {
  final void Function() func;
  final String icon;
  const AddRemoveButtons({super.key, required this.func, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: func,
        child: Container(
          height: 25.0,
          width: 25.0,
          // decoration: BoxDecoration(
          //   shape: BoxShape.circle,
          //   color: Colors.green,
          // ),
          child: Image.asset(
            icon,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
