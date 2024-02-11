import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_skeleton/pharmacy_screens/product_details.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({super.key});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  String description =
      "This is the description of the product x but then we can always try harder to find it if we looked closely.";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          Get.to(ProductDetails());
        },
        child: SizedBox(
            height: 270, //MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.43,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150, //MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.43,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(66, 156, 231, 213),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      "assets/images/tablets_pic.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 120.0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Panadol",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          description,
                          maxLines: 2,
                          style: TextStyle(
                            //fontSize: 11.0,
                            overflow: TextOverflow.ellipsis,
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
                                      fontSize: 8.0,
                                      color: Colors.blueGrey,
                                      textBaseline: TextBaseline.alphabetic,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "2000",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  )
                                ]),
                              ),
                              Container(
                                height: 30.0,
                                width: 80.0,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 212, 211, 211),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AddorRemoveButton(
                                      func: () {},
                                      icon: Icon(
                                        Icons.remove,
                                        size: 20.0,
                                        color: Colors.black,
                                      ),
                                      bgcolor: Colors.white,
                                    ),
                                    Text(
                                      "121",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    AddorRemoveButton(
                                      func: () {},
                                      icon: Icon(
                                        Icons.add,
                                        size: 20.0,
                                        color: Colors.white,
                                      ),
                                      bgcolor: Colors.green,
                                    ),
                                  ],
                                ),
                              )
                            ])
                      ]),
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
