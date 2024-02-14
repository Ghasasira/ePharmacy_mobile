import 'package:flutter/material.dart';

class CartProductTile extends StatefulWidget {
  const CartProductTile({super.key});

  @override
  State<CartProductTile> createState() => _CartProductTileState();
}

class _CartProductTileState extends State<CartProductTile> {
  @override
  Widget build(BuildContext context) {
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
            //crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: const ProductCartDetails(),
                ),
              ),
              Container(
                width: 25.0,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Icon(
                  Icons.cancel_outlined,
                  size: 20.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCartDetails extends StatefulWidget {
  const ProductCartDetails({super.key});

  @override
  State<ProductCartDetails> createState() => _ProductCartDetailsState();
}

class _ProductCartDetailsState extends State<ProductCartDetails> {
  int quantity = 1;

  void reduceQuantity() {
    setState(() {
      quantity--;
    });
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Product Name This coud be a little long",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          // Text(
          //   "UGX 2000",
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "UGX 2000",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
              Container(
                  //decoration: BoxDecoration(),
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width * 0.15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          reduceQuantity();
                        },
                        child: Icon(
                          Icons.remove,
                          size: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                      Text(quantity.toString()),
                      GestureDetector(
                        onTap: () {
                          increaseQuantity();
                        },
                        child: Icon(
                          Icons.add,
                          size: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     IconButton(
              //         onPressed: () {},
              //         icon: Icon(
              //           Icons.delete,
              //           color: Colors.red,
              //           size: 25,
              //         )),
              //     Container(
              //       //decoration: BoxDecoration(),
              //       constraints: BoxConstraints(
              //           minWidth: MediaQuery.of(context).size.width * 0.2),
              //       //width: ,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         children: [
              //           AddRemoveButtons(
              //               func: () {
              //                 reduceQuantity();
              //               },
              //               icon: "assets/images/minus.png"),
              //           SizedBox(width: 2.0),
              //           Text(
              //             quantity.toString(),
              //             style: TextStyle(
              //                 fontSize: 20.0, fontWeight: FontWeight.bold),
              //           ),
              //           SizedBox(width: 2.0),
              //           AddRemoveButtons(
              //               func: () {
              //                 increaseQuantity();
              //               },
              //               icon: "assets/images/add.png"),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
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
