import 'dart:io';

import 'package:dating/app_ui/screen/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:dating/constant/constant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailedExplanation extends StatefulWidget {
  const DetailedExplanation({Key? key}) : super(key: key);

  static const String routeName = '/detailed-explanation';

  @override
  State<DetailedExplanation> createState() => _DetailedExplanationState();
}

class _DetailedExplanationState extends State<DetailedExplanation> {
  bool? pickUploaded = false;
  bool? pickUploaded1 = false;
  bool? pickUploaded2 = false;
  bool? pickUploaded3 = false;
  bool? pickUploaded4 = false;
  bool? pickUploaded5 = false;
  bool? pickUploaded6 = false;
  bool? pickUploaded7 = false;
  File? _image;
  File? _images1;
  File? _images2;
  File? _images3;
  File? _images4;
  File? _images5;
  File? _images6;
  upload(val) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File? file = File(result.files.single.path!);
        if (val == "image") {
          setState(() {
            pickUploaded = true;
            _image = file;
          });
        } else if (val == "image1") {
          setState(() {
            pickUploaded1 = true;
            _images1 = file;
          });
        } else if (val == "image2") {
          setState(() {
            pickUploaded2 = true;
            _images2 = file;
          });
        } else if (val == "image3") {
          setState(() {
            pickUploaded3 = true;
            _images3 = file;
          });
        } else if (val == "image4") {
          setState(() {
            pickUploaded4 = true;
            _images4 = file;
          });
        } else if (val == "image5") {
          setState(() {
            pickUploaded5 = true;
            _images5 = file;
          });
        } else if (val == "image6") {
          setState(() {
            pickUploaded6 = true;
            _images6 = file;
          });
        }
      } else {
        // User canceled the picker
      }
    } on PlatformException catch (err) {
      print("err: $err");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      appBar: AppBar(
        foregroundColor: const Color(0xFF7A112F),
        backgroundColor: const Color(0xFFf5f5f5),
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, Bottom_NavigationBar.routeName, (route) => false);
              },
              child: const Text('Skip',
                  style: TextStyle(
                      color: Color(0xFF818181),
                      fontFamily: inter,
                      fontSize: 16,
                      fontWeight: FontWeight.w600))),
        ],
      ),
      body: SizedBox(
        height: size.height(context),
        width: size.width(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      // begin: Alignment.topRight,
                      // end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF7A112F),
                        Color(0xFFC92564),
                      ],
                    ),
                    image: DecorationImage(
                        image: AssetImage('assets/MaleUser.png'),
                        fit: BoxFit.fill),
                    shape: BoxShape.circle),
                height: size.height(context) * .12,
                width: size.height(context) * .12,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(size.height(context)),
                    child: pickUploaded!
                        ? Image.file(
                            _image!,
                            fit: BoxFit.fill,
                          )
                        : Container()),
              ),
              SizedBox(
                height: size.height(context) * .02,
              ),
              GestureDetector(
                onTap: () {
                  upload("image");
                },
                child: Container(
                  height: size.height(context) * .04,
                  width: size.width(context) * .3,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        // begin: Alignment.topRight,
                        // end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFF7A112F),
                          Color(0xFFC92564),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFFF5F5F5)),
                  child: const Center(
                      child: Text(
                    'Add Profile',
                    style: TextStyle(
                        fontFamily: inter,
                        color: Color(0xFFF5F5F5),
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  )),
                ),
              ),
              SizedBox(
                height: size.height(context) * .04,
              ),
              Container(
                padding: EdgeInsets.only(left: size.width(context) * .05),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Type about yourself',
                  style: TextStyle(
                      fontFamily: inter,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF7A112F)),
                ),
              ),
              SizedBox(
                height: size.height(context) * .02,
              ),
              Container(
                height: size.height(context) * .17,
                padding: EdgeInsets.only(
                    left: size.width(context) * .05,
                    right: size.width(context) * .05),
                child: TextFormField(
                  maxLines: 30,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    fillColor: Color(0xFFf5f5f5),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                    hintText: 'Type here.....',
                    hintStyle: TextStyle(
                        color: Color(0xFFB7798B),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF7A112F),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF7A112F)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height(context) * .01,
              ),
              Container(
                padding: EdgeInsets.only(left: size.width(context) * .05),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Maximum word limit 100-200*',
                  style: TextStyle(
                      fontFamily: inter,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF7A112F)),
                ),
              ),
              SizedBox(
                height: size.height(context) * .025,
              ),
              Container(
                padding: EdgeInsets.only(left: size.width(context) * .05),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Add Photos',
                  style: TextStyle(
                      fontFamily: inter,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7A112F)),
                ),
              ),
              SizedBox(
                height: size.height(context) * .01,
              ),
              Container(
                padding: EdgeInsets.only(left: size.width(context) * .05),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Add atleast 2 photos to continue',
                  style: TextStyle(
                      fontFamily: inter,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF7A112F)),
                ),
              ),
              SizedBox(
                height: size.height(context) * .02,
              ),
              Container(
                padding: EdgeInsets.only(left: size.width(context) * .06),
                height: size.height(context) * .36,
                width: size.width(context),
                child: Stack(
                  children: [
                    Positioned(
                      top: size.height(context) * .0,
                      left: size.width(context) * .0,
                      child: GestureDetector(
                        onTap: () {
                          upload("image1");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFD3DBEE),
                              borderRadius: BorderRadius.circular(6)),
                          height: size.height(context) * .16,
                          width: size.height(context) * .12,
                          child: pickUploaded1!
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    _images1!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFD3DBEE),
                                      borderRadius: BorderRadius.circular(6)),
                                  height: size.height(context) * .16,
                                  width: size.height(context) * .12,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height(context) * .139,
                      left: size.width(context) * .095,
                      child: GestureDetector(
                        onTap: () {
                          upload("image1");
                        },
                        child: Image.asset(
                          "assets/smallbtn.png",
                          height: size.height(context) * .03,
                          width: size.width(context) * .3,
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height(context) * .0,
                      left: size.width(context) * .3,
                      child: GestureDetector(
                        onTap: () {
                          upload("image1");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFD3DBEE),
                              borderRadius: BorderRadius.circular(6)),
                          height: size.height(context) * .16,
                          width: size.height(context) * .12,
                          child: pickUploaded1!
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    _images1!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFD3DBEE),
                                      borderRadius: BorderRadius.circular(6)),
                                  height: size.height(context) * .16,
                                  width: size.height(context) * .12,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height(context) * .139,
                      left: size.width(context) * .395,
                      child: GestureDetector(
                        onTap: () {
                          upload("image1");
                        },
                        child: Image.asset(
                          "assets/smallbtn.png",
                          height: size.height(context) * .03,
                          width: size.width(context) * .3,
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height(context) * .0,
                      left: size.width(context) * .3,
                      child: GestureDetector(
                        onTap: () {
                          upload("image2");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFD3DBEE),
                              borderRadius: BorderRadius.circular(6)),
                          height: size.height(context) * .16,
                          width: size.height(context) * .12,
                          child: pickUploaded2!
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    _images2!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFD3DBEE),
                                      borderRadius: BorderRadius.circular(6)),
                                  height: size.height(context) * .16,
                                  width: size.height(context) * .12,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height(context) * .139,
                      left: size.width(context) * .395,
                      child: GestureDetector(
                        onTap: () {
                          upload("image2");
                        },
                        child: Image.asset(
                          "assets/smallbtn.png",
                          height: size.height(context) * .03,
                          width: size.width(context) * .3,
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height(context) * .0,
                      left: size.width(context) * .6,
                      child: GestureDetector(
                        onTap: () {
                          upload("image3");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFD3DBEE),
                              borderRadius: BorderRadius.circular(6)),
                          height: size.height(context) * .16,
                          width: size.height(context) * .12,
                          child: pickUploaded3!
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    _images3!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFD3DBEE),
                                      borderRadius: BorderRadius.circular(6)),
                                  height: size.height(context) * .16,
                                  width: size.height(context) * .12,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height(context) * .139,
                      left: size.width(context) * .695,
                      child: GestureDetector(
                        onTap: () {
                          upload("image3");
                        },
                        child: Image.asset(
                          "assets/smallbtn.png",
                          height: size.height(context) * .03,
                          width: size.width(context) * .3,
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height(context) * .19,
                      left: size.width(context) * .0,
                      child: GestureDetector(
                        onTap: () {
                          upload("image4");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFD3DBEE),
                              borderRadius: BorderRadius.circular(6)),
                          height: size.height(context) * .16,
                          width: size.height(context) * .12,
                          child: pickUploaded4!
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    _images4!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFD3DBEE),
                                      borderRadius: BorderRadius.circular(6)),
                                  height: size.height(context) * .16,
                                  width: size.height(context) * .12,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height(context) * .33,
                      left: size.width(context) * .095,
                      child: GestureDetector(
                        onTap: () {
                          upload("image4");
                        },
                        child: Image.asset(
                          "assets/smallbtn.png",
                          height: size.height(context) * .03,
                          width: size.width(context) * .3,
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height(context) * .19,
                      left: size.width(context) * .3,
                      child: GestureDetector(
                        onTap: () {
                          upload("image5");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFD3DBEE),
                              borderRadius: BorderRadius.circular(6)),
                          height: size.height(context) * .16,
                          width: size.height(context) * .12,
                          child: pickUploaded5!
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    _images5!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFD3DBEE),
                                      borderRadius: BorderRadius.circular(6)),
                                  height: size.height(context) * .16,
                                  width: size.height(context) * .12,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height(context) * .33,
                      left: size.width(context) * .395,
                      child: GestureDetector(
                        onTap: () {
                          upload("image5");
                        },
                        child: Image.asset(
                          "assets/smallbtn.png",
                          height: size.height(context) * .03,
                          width: size.width(context) * .3,
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height(context) * .19,
                      left: size.width(context) * .6,
                      child: GestureDetector(
                        onTap: () {
                          upload("image6");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFD3DBEE),
                              borderRadius: BorderRadius.circular(6)),
                          height: size.height(context) * .16,
                          width: size.height(context) * .12,
                          child: pickUploaded6!
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    _images6!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFD3DBEE),
                                      borderRadius: BorderRadius.circular(6)),
                                  height: size.height(context) * .16,
                                  width: size.height(context) * .12,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height(context) * .33,
                      left: size.width(context) * .695,
                      child: GestureDetector(
                        onTap: () {
                          upload("image6");
                        },
                        child: Image.asset(
                          "assets/smallbtn.png",
                          height: size.height(context) * .03,
                          width: size.width(context) * .3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height(context) * .04,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        Bottom_NavigationBar.routeName, (route) => false);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: size.height(context) * .055,
                    width: size.width(context) * .35,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFFE36B99),
                            Color(0xFF811634),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xFFF5F5F5)),
                    child: const Center(
                        child: Text(
                      'Next',
                      style: TextStyle(
                          fontFamily: inter,
                          color: Color(0xFFF5F5F5),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: size.height(context) * .04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
