import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_skeleton/learning/dat_class.dart';
import 'package:pharmacy_skeleton/learning/learning_page1.dart';
import 'package:pharmacy_skeleton/learning/user_data.dart';
import 'package:pharmacy_skeleton/pharmacy_screens/all_pharmacy_products.dart';
import 'package:pharmacy_skeleton/pharmacy_screens/order_screen.dart';
import 'package:pharmacy_skeleton/pharmacy_screens/pharmacy_cart.dart';
import 'package:pharmacy_skeleton/pharmacy_screens/prescription_screen.dart';
import 'package:pharmacy_skeleton/pharmacy_screens/product_details.dart';
import 'package:pharmacy_skeleton/pharmacy_screens/upload_prescription.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProviderClass(),
        ),
        ChangeNotifierProvider(
          create: (_) => DataClass(),
        ),
      ],
      child: GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: HomePage()
          //UploadPrescriptionScreen(),
          //PrescriptionScreen(),
          // PageOne(),
          // ProductDetails()
          //OrdersScreen(),
          //PharmacyCart(),
          //const AllPharmarcyProducts(), //MyHomePage(title: 'Flutter Demo Home Page'),
          ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notes),
      label: 'Prescription',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.gif_box),
      label: 'Orders',
    ),
  ];

  List pages = [
    AllPharmarcyProducts(),
    UploadPrescriptionScreen(),
    OrdersScreen(),
  ];
  int selectedPage = 0;

  void selectPage(int page) {
    setState(() {
      selectedPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: selectedPage,
        onTap: selectPage,
      ),
    );
  }
}
