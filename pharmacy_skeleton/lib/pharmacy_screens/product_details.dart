import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy_skeleton/controllers/cart_controller.dart';
import 'package:pharmacy_skeleton/controllers/product_controller.dart';
import 'package:pharmacy_skeleton/models/cart.dart';
import 'package:pharmacy_skeleton/models/product.dart';
import 'package:pharmacy_skeleton/pharmacy_components/cart_button.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Product? prod;
  String? dataDescription;

  String selectedTab = "Description";
  List detailTabs = ["Description", "Usage", "Ingredients", "Warnings"];

  void initState() {
    // TODO: implement initState
    prod = Provider.of<ProductProvider>(context, listen: false).selectedProduct;
    dataDescription = prod!.productDescription;

    super.initState();
  }

  void selectData(String data) {
    switch (data) {
      case "Description":
        dataDescription = prod!.productDescription;
        break;
      case "Usage":
        dataDescription = prod!.productUsage;
        break;
      case "Ingredients":
        dataDescription = prod!.productIngredients.join('\n');
        break;
      case "Warnings":
        dataDescription = prod!.productWarnings.join('\n');
        break;
      default:
        throw Exception("Invalid tab name");
    }
    setState(() {});
  }

  @override
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context, listen: true);
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          actions: [
            CartButton(),
          ],
          title: Center(
            child: Text(
              'Product Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
      body: Stack(
        children: [
          Container(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 200, width: MediaQuery.of(context).size.width,
                          //borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            prod!.productImage,
                            //fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      prod!.productName,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: prod!.productTags.map((tag) {
                        // tags.map((tag) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(40, 3, 127, 243),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                tag,
                                style: TextStyle(
                                    fontSize: 8.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: "UGX ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: prod!.productPrice.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "/unit",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                ])),
                              ],
                            ),
                            Text(
                              prod!.quantityPerUnit,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: cartProvider.isInCart(prod!.id),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        cartProvider
                                            .reduceItemQuantity(prod!.id);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      cartProvider
                                          .getSingleProductQuantity(prod!.id)
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        cartProvider
                                            .increaseItemQuantity(prod!.id);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: detailTabs.map((e) {
                          bool isSelected = (selectedTab == e);

                          return GestureDetector(
                            onTap: () {
                              //var bb = e.toString().toLowerCase();
                              setState(() {
                                selectedTab = e;
                                selectData(e);
                              });
                            },
                            child: Container(
                              constraints: BoxConstraints(minWidth: 60.0),
                              decoration: isSelected
                                  ? BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(20.0),
                                    )
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                        color: Colors.green,
                                      )),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                    top: 4.0,
                                    bottom: 4.0),
                                child: Text(
                                  e,
                                  style: TextStyle(
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                    fontSize: 13.0,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DetailsContainer(
                      data: dataDescription!,
                    ),
                    // SizedBox(
                    //   height: 20.0,
                    // ),
                    // //addedToCart
                    // Visibility(
                    //   visible: cartProvider.isInCart(prod!.id),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       SizedBox(
                    //         width: MediaQuery.of(context).size.width * 0.5,
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             GestureDetector(
                    //               onTap: () {
                    //                 cartProvider.reduceItemQuantity(prod!.id);
                    //               },
                    //               child: Container(
                    //                 height: 45,
                    //                 width: 45,
                    //                 decoration: BoxDecoration(
                    //                   color: Colors.green,
                    //                   borderRadius: BorderRadius.circular(10.0),
                    //                 ),
                    //                 child: Center(
                    //                   child: Icon(
                    //                     Icons.remove,
                    //                     color: Colors.white,
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             Text(
                    //               cartProvider
                    //                   .getSingleProductQuantity(prod!.id)
                    //                   .toString(),
                    //               style: TextStyle(
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 20,
                    //               ),
                    //             ),
                    //             GestureDetector(
                    //               onTap: () {
                    //                 cartProvider.increaseItemQuantity(prod!.id);
                    //               },
                    //               child: Container(
                    //                 height: 45,
                    //                 width: 45,
                    //                 decoration: BoxDecoration(
                    //                   color: Colors.green,
                    //                   borderRadius: BorderRadius.circular(10.0),
                    //                 ),
                    //                 child: Center(
                    //                   child: Icon(
                    //                     Icons.add,
                    //                     color: Colors.white,
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(
                      height: 60.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            // right: 0,
            // left: 0,
            // child: SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.85,
            //height: 45.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: !cartProvider.isInCart(prod!.id)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () {
                              cartProvider
                                  .addItem(CartItem.fromProduct(prod!, 1));
                            },
                            icon: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.white,
                            ),
                            label: Text("Add To Cart",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () {},
                            child: Text(
                                "Add for UGX " +
                                    cartProvider
                                        .getSingleProductSubtotalPrice(prod!.id)
                                        .toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          // )
        ],
      ),
    );
  }
}

class DetailsContainer extends StatefulWidget {
  final String data;
  const DetailsContainer({super.key, required this.data});

  @override
  State<DetailsContainer> createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
  bool isExpandedView = false;
  @override
  Widget build(BuildContext context) {
    String data = widget.data;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints(minHeight: 150.0),
          child: data.split(" ").toList().length < 60
              ? Text(
                  data,
                  style: TextStyle(fontSize: 13.0),
                )
              : isExpandedView
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data,
                          style: TextStyle(fontSize: 13.0),
                          // maxLines: 10,
                          // overflow: TextOverflow.clip,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpandedView = !isExpandedView;
                            });
                          },
                          child: Text(
                            "Hide details",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12.0,
                            ),
                          ),
                          // : Text("Show more..."),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data,
                          maxLines: 8,
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontSize: 13.0),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpandedView = !isExpandedView;
                            });
                          },
                          child:
                              //? Text("Hide details")
                              Text(
                            "Show more...",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    )),
    );
  }
}
