import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../constant/constant.dart';
import '../../../Widget/profileimagepicker.dart';

class AddImages extends StatefulWidget {
  const AddImages({Key? key}) : super(key: key);

  static const String routeName = '/add-image';

  @override
  State<AddImages> createState() => _AddImagesState();
}

class _AddImagesState extends State<AddImages> {
  var _imageSelected = false;
  File? image;
  List<File> imageList = [];
  void _deleteSelectedImage() {
    if (_imageSelected) {
      setState(() {
        _imageSelected = false;
        image!.delete();
      });
    }
    Navigator.pop(context);
  }

  void getAndSetImage(ImageSource src) async {
    Navigator.pop(context);
    var image = await pickImage(src);
    if (image != null) {
      setState(() {
        _imageSelected = true;
        this.image = File(image.path);
      });
    }
  }

  Future<XFile?> pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: source);
      if (image == null) {
        //for retreiving image, lost when phone closes app due to memory issues
        final response = await picker.retrieveLostData();
        imageList.add(File(response.file!.path));
        return response.file;
        //return null;
      }
      imageList.add(File(image.path));
      return image;
    } on PlatformException catch (e) {
      print("image pick exception: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      appBar: AppBar(
          backgroundColor: const Color(0xFFf5f5f5),
          foregroundColor: const Color(0xFF7A112F),
          elevation: 0,
          title: GradientText(
            'Wesley Langworth’s Album',
            style: const TextStyle(
                fontSize: 18.0,
                fontFamily: merriweather,
                fontWeight: FontWeight.w400),
            colors: const [Color(0xFF7A112F), Color(0xFFC92564)],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(size.height(context) * 0.03),
            child: Container(),
          )),
      body: Column(
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: size.width(context) * .05),
            height: size.height(context) * .77,
            width: size.width(context),
            child: imageList.isNotEmpty
                ? GridView.builder(
                    primary: false,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 150,
                            crossAxisSpacing: 10),
                    itemCount: imageList.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                insetPadding: const EdgeInsets.all(120),
                                clipBehavior: Clip.antiAlias,
                                title: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          imageList.removeAt(index);
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Delete"),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              // color: const Color(0xFFD3DBEE),
                              borderRadius: BorderRadius.circular(6)),
                          height: size.height(context) * .16,
                          width: size.height(context) * .13,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              imageList[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
                  )
                : Text(
                    "You don't have any photos added yet!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 15,
                    ),
                  ),
          ),
          SizedBox(
            height: size.height(context) * .02,
          ),
          InkWell(
            onTap: () {
              openModalBottomSheet(
                  context, _deleteSelectedImage, getAndSetImage);
            },
            child: Container(
              height: size.height(context) * .055,
              width: size.width(context) * .91,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFFE36B99),
                      Color(0xFFA02145),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(7)),
              child: const Center(
                  child: Text(
                "Add Media",
                style: TextStyle(
                  fontFamily: inter,
                  color: Color(0xFFF5F5F5),
                  fontSize: 16,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
