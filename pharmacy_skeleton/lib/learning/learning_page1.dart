import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_skeleton/learning/dat_class.dart';
import 'package:pharmacy_skeleton/learning/learning_page2.dart';
import 'package:pharmacy_skeleton/learning/user_data.dart';
import 'package:provider/provider.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<UserProviderClass>(builder: (context, userData, child) {
              return Text(
                "${userData.name}",
                style: TextStyle(fontSize: 26),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 200.0,
                ),
                Consumer<DataClass>(builder: (context, dataClass, child) {
                  return Text(
                    "${dataClass.x}",
                    style: TextStyle(fontSize: 26),
                  );
                }),
                Text("Total"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Provider.of<DataClass>(context, listen: false)
                          .incrementX();
                    },
                    icon: Icon(Icons.add)),
                ElevatedButton(
                  onPressed: () {
                    Get.to(PageTwo());
                  },
                  child: Text("Next Page"),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
