import 'package:flutter/material.dart';

class CartProductTile extends StatelessWidget {
  const CartProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.98,
      height: 150.0,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Container(
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: MediaQuery.of(context).size.width * 0.3,
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
                width: MediaQuery.of(context).size.width * 0.65,
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
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCartDetails extends StatelessWidget {
  const ProductCartDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Product Name This coud be a little long",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "UGX 2000",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 25,
                    )),
                Container(
                  //decoration: BoxDecoration(),
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width * 0.2),
                  //width: ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AddRemoveButtons(
                          func: () {}, icon: "assets/images/add.png"),
                      SizedBox(width: 2.0),
                      Text(
                        "3",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 2.0),
                      AddRemoveButtons(
                          func: () {}, icon: "assets/images/minus.png"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.only(
        //     left: 8.0,
        //     right: 8.0,
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Container(
        //         //decoration: BoxDecoration(),
        //         constraints: BoxConstraints(
        //             minWidth: MediaQuery.of(context).size.width * 0.25),
        //         //width: ,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: [
        //             AddRemoveButtons(func: () {}, icon: const Icon(Icons.add)),
        //             SizedBox(width: 2.0),
        //             Text(
        //               "3",
        //               style: TextStyle(
        //                   fontSize: 20.0, fontWeight: FontWeight.bold),
        //             ),
        //             SizedBox(width: 2.0),
        //             AddRemoveButtons(
        //                 func: () {}, icon: const Icon(Icons.remove)),
        //           ],
        //         ),
        //       ),
        //       IconButton(
        //           onPressed: () {},
        //           icon: Icon(
        //             Icons.delete,
        //             color: Colors.red,
        //             size: 30,
        //           ))
        //     ],
        //   ),
        // )
      ],
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
