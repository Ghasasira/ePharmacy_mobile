import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class UploadPrescriptionScreen extends StatelessWidget {
  const UploadPrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text('Upload Prescriptions'))),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        //height: 200.0,
                        child: SvgPicture.asset(
                          "assets/images/imageupload.svg",
                          // color: Colors.red,
                          width: 200,
                          height: 240,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        "Upload your Prescription",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Upload a scan, picture or photo of your prescription you received from the doctor to buy medicine.",
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PickFileWidget(
                            icon: Icons.camera_alt_outlined,
                            label: "Camera",
                          ),
                          PickFileWidget(
                            icon: Icons.photo_library_outlined,
                            label: "Gallery",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      SelectedImageTile(imageName: "image1.png"),
                      SelectedImageTile(imageName: "image2.png"),
                      SizedBox(
                        height: 60.0,
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Upload Prescriptions",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PickFileWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  const PickFileWidget({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.green, width: 2),
          ),
          child: Center(
            child: Icon(
              icon,
              color: Colors.green,
              size: 60.0,
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.green, fontSize: 18),
        ),
      ],
    );
  }
}

class SelectedImageTile extends StatelessWidget {
  final String imageName;
  const SelectedImageTile({
    super.key,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.check_circle_outline_outlined),
              SizedBox(width: 20.0),
              Text(imageName),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
