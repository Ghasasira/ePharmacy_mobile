import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:pharmacy_skeleton/pharmacy_components/cart_button.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int noAdded = 0;

  bool addedToCart = false;
  String selectedTab = "Description";
  List detailTabs = ["Description", "Usage", "Ingredients", "Warnings"];
  List tags = ["Pain killer", "Vitamins", "Organic", "antibiotics"];

  String description = """
Panadol, also known as paracetamol or acetaminophen, is a common over-the-counter medication used for relieving mild-to-moderate pain and reducing fever. It’s found in many cold and flu medications. The exact mechanism of action is unclear, but it’s thought to block pain signals in the brain and affect body temperature regulation. Conditions it can provide relief for include headaches, dental pain, muscular aches, arthritis, backache, period pain, colds and flu symptoms, and post-operative pain. It’s crucial to use Panadol responsibly, following product label instructions, and not exceeding the maximum daily dose. It’s available in various forms, including tablets, injections, and suppositories.
""";
  String usage =
      "Panadol, also known as paracetamol, is used to relieve mild-to-moderate pain and reduce fever12. It’s effective for conditions like headaches, osteoarthritis, and post-operative pain12. Adults and children over 12 years can take 500 to 1000mg every 4-6 hours, not exceeding 4000mg in 24 hours34. It’s crucial to only take one product containing paracetamol at a time to avoid overdose2. Always follow the product label instructions and consult a healthcare provider if unsure2.";
  String ingredients =
      """Active Ingredient: Each tablet contains Paracetamol 500 mg.
Other Ingredients: Maize starch, potassium sorbate (E 202), purified talc, stearic acid, povidone, starch pregelatinised, hypromellose, triacetin.
Please note that the ingredients can vary depending on the specific product and region. Always check the packaging for the most accurate and up-to-date information.""";
  String warnings = """
Allergy: Do not take Panadol if you are allergic to it or any of its ingredients1.
Liver or Kidney Problems: Individuals with liver or kidney disease should use caution when taking Panadol, as it is metabolized by the liver and excreted by the kidneys23.
Alcohol Consumption: People who consume three or more alcoholic drinks daily should avoid taking Panadol2.
Other Medications: Do not take Panadol if you are taking any other prescription or non-prescription medications containing paracetamol or acetaminophen1.
Pregnancy and Breastfeeding: Consult your healthcare provider before taking Panadol1.
""";

  String dataDescription = " ";
  void addItem() {
    setState(() {
      noAdded++;
    });
  }

  void removeItem() {
    setState(() {
      noAdded--;
    });
    if (noAdded == 0) {
      setState(() {
        addedToCart = false;
      });
    }
  }

  void selectData(String x) {
    switch (x) {
      case "Description":
        dataDescription = description;
        break;
      case "Usage":
        dataDescription = usage;
        break;
      case "Ingredients":
        dataDescription = ingredients;
        break;
      case "Warnings":
        dataDescription = warnings;
        break;
      default:
        throw Exception("Invalid tab name");
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    dataDescription = description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            //Padding(

            // padding: const EdgeInsets.only(right: 15.0),
            // child: Icon(Icons.shopping_cart),
            // )
          ],
          title: Center(
            child: Text(
              'Product Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
      body: SingleChildScrollView(
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    "assets/images/tablets_pic.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Panadol",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: tags.map((tag) {
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
                              fontSize: 10,
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
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "UGX ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: "2000",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "/unit",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ])),
                ],
              ),
              Text(
                "20mg",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: detailTabs.map((e) {
                  bool isSelected = (selectedTab == e);

                  return GestureDetector(
                    onTap: () {
                      var bb = e.toString().toLowerCase();
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
                            left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                        child: Text(
                          e,
                          style: TextStyle(
                            fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.w500,
                            fontSize: 16.0,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10.0,
              ),
              DetailsContainer(
                data: dataDescription,
              ),
              SizedBox(
                height: 20.0,
              ),
              addedToCart
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              removeItem();
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10.0),
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
                            noAdded.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              addItem();
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10.0),
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
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 45.0,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () {
                              addItem();
                              setState(() {
                                addedToCart = true;
                              });
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
            ],
          ),
        ),
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
          child: data.split(" ").toList().length < 40
              ? Text(
                  data,
                )
              : isExpandedView
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data,
                          //style: TextStyle(),
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
                            style: TextStyle(color: Colors.blue),
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
                          maxLines: 6,
                          overflow: TextOverflow.clip,
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
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    )),
    );
  }
}
