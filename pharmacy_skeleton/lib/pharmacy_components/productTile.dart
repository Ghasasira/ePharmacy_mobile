import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_skeleton/controllers/cart_controller.dart';
import 'package:pharmacy_skeleton/controllers/product_provider.dart';
import 'package:pharmacy_skeleton/models/cart.dart';
import 'package:pharmacy_skeleton/models/product.dart';
import 'package:pharmacy_skeleton/pharmacy_screens/product_details.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            '/productDetailsPage',
          );
          Provider.of<ProductProvider>(context, listen: false)
              .fetchSingleProduct(product.id);
        },
        child: Container(
            constraints: BoxConstraints(minHeight: 220.0),
            width: MediaQuery.of(context).size.width * 0.43,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height:
                          //imageHeight,
                          150,
                      width: MediaQuery.of(context).size.width * 0.43,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(66, 156, 231, 213),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          product.productImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Visibility(
                        visible: !cartProvider.isInCart(product.id),
                        child: Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              cartProvider
                                  .addItem(CartItem.fromProduct(product, 1));
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 5.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "ADD",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.add_circle_outline,
                                          color: Colors.green,
                                          size: 20.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ))
                  ],
                ),
                Container(
                  constraints: BoxConstraints(
                    minHeight: 50.0,
                    maxHeight: 80.0,
                  ),
                  //height: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 5.0,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            product.productName,
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.0,
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "UGX:\n",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.0,
                                        color: Colors.blueGrey,
                                        textBaseline: TextBaseline.alphabetic,
                                      ),
                                    ),
                                    TextSpan(
                                      text: product.productPrice.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                    )
                                  ]),
                                ),
                                Visibility(
                                  visible: cartProvider.isInCart(product.id),
                                  child: Container(
                                    height: 30.0,
                                    width: 80.0,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 212, 211, 211),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        AddorRemoveButton(
                                          func: () {
                                            cartProvider
                                                .reduceItemQuantity(product.id);
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                            size: 20.0,
                                            color: Colors.black,
                                          ),
                                          bgcolor: Colors.white,
                                        ),
                                        Text(
                                          //cartProvider.
                                          cartProvider
                                              .getSingleProductQuantity(
                                                  product.id)
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        AddorRemoveButton(
                                          func: () {
                                            cartProvider.increaseItemQuantity(
                                                product.id);
                                            //addItem();
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            size: 20.0,
                                            color: Colors.white,
                                          ),
                                          bgcolor: Colors.green,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ])
                        ]),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class AddorRemoveButton extends StatelessWidget {
  final Icon icon;
  final void Function() func;
  final Color bgcolor;
  const AddorRemoveButton({
    required this.icon,
    required this.bgcolor,
    required this.func,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        height: 26.0,
        width: 26.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgcolor,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
