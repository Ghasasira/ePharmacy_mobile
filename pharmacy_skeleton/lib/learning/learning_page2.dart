import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pharmacy_skeleton/learning/dat_class.dart';
import 'package:pharmacy_skeleton/learning/learning_page1.dart';
import 'package:pharmacy_skeleton/learning/user_data.dart';
import 'package:provider/provider.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataClass>(context, listen: false);
    var userProvider = Provider.of<UserProviderClass>(context, listen: false);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<UserProviderClass>(builder: (context, userClass, child) {
              return Text(
                "${userClass.name}",
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
                  return Text('${dataClass.x}', style: TextStyle(fontSize: 26));
                }),
                Text("Total"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      dataProvider.x > 0
                          ? dataProvider.decrementX()
                          : Get.snackbar(
                              "Warning", "can't decrease more than this");
                    },
                    icon: Icon(Icons.remove)),
                ElevatedButton(
                  onPressed: () {
                    Get.to(PageOne());
                  },
                  child: Text("Prev Page"),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  userProvider.name == "Joshua"
                      ? userProvider.changeTolastName()
                      : userProvider.changeTofirstName();
                },
                child: Text("Change Name"),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
