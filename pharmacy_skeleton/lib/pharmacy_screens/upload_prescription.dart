import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy_skeleton/pharmacy_components/cart_button.dart';

class UploadPrescriptionScreen extends StatefulWidget {
  const UploadPrescriptionScreen({super.key});

  @override
  State<UploadPrescriptionScreen> createState() =>
      _UploadPrescriptionScreenState();
}

class _UploadPrescriptionScreenState extends State<UploadPrescriptionScreen> {
  List uploadedImages = [];

  Future pickImageFromGallery() async {
    try {
      final images = await ImagePicker().pickMultiImage();
      setState(() {
        uploadedImages.addAll(images);
      }); //imageQuality: );  //ImageSource.gallery
      print(uploadedImages);
    } on PlatformException catch (e) {
      print("Failed to Pick Image from Gallary $e");
    }
  }

  Future takePickImageUsingCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final tempImage = File(image.path);
      setState(() {
        uploadedImages.add(image);
      });
      print(uploadedImages); //imageQuality: );  //ImageSource.gallery
    } on PlatformException catch (e) {
      print("Failed to Pick Image from Gallary $e");
    }
  }

  void deleteItem(String imageName) {
    int index = uploadedImages.indexWhere((image) => image.name == imageName);
    if (index != -1) {
      setState(() {
        uploadedImages = uploadedImages.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            CartButton(),
          ],
          title: Center(
            child: Text('Upload Prescriptions'),
          ),
        ),
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
                            fontSize: 16,
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
                            pickImages: takePickImageUsingCamera,
                            icon: Icons.camera_alt_outlined,
                            label: "Camera",
                          ),
                          PickFileWidget(
                            pickImages: pickImageFromGallery,
                            icon: Icons.photo_library_outlined,
                            label: "Gallery",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      //SelectedImageTile(imageName: "image1.png"),
                      //SelectedImageTile(imageName: "image2.png"),
                      Column(
                        children: uploadedImages.map((image) {
                          String imageName = image.name;
                          final newName = imageName.substring(
                              0, min(20, image.name.length));
                          return SelectedImageTile(
                            imageName: newName,
                            removeItem: () => deleteItem(imageName),
                          );
                        }).toList(),
                      ),
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
  final VoidCallback pickImages;
  final String label;
  final IconData icon;
  const PickFileWidget(
      {super.key,
      required this.icon,
      required this.label,
      required this.pickImages});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: pickImages,
          child: Container(
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
        ),
        Text(
          label,
          style: TextStyle(color: Colors.green, fontSize: 13),
        ),
      ],
    );
  }
}

class SelectedImageTile extends StatelessWidget {
  final String imageName;
  final VoidCallback removeItem;
  const SelectedImageTile({
    super.key,
    required this.imageName,
    required this.removeItem,
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
            onTap: removeItem,
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
