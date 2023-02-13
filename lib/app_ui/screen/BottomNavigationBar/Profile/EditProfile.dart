import 'dart:io';

import 'package:dating/app_ui/Widget/BottomSheetWidget.dart';
import 'package:dating/app_ui/Widget/profileimagepicker.dart';
import 'package:dating/constant/checkBoxDeta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constant/constant.dart';
import '../../../Widget/PhysicalDialogBox.dart';
import '../../../Widget/showdialogEditProfile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  static const String routeName = '/edit-profile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile>
    with TickerProviderStateMixin {
  var personalityList = List<dynamic>.filled(personality.length, false);
  bool check = false;
  var _imageSelected = false;
  File? image;
  String personalityText = "";
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

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
        if (!response.isEmpty) {
          return response.file;
        } else {
          return null;
        }

        // return null;
      }

      return image;
    } on PlatformException {
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
          title: const Text(
            'Edit Profile',
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: merriweather,
                color: Color(0xFF7A112F),
                fontWeight: FontWeight.w700),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(size.height(context) * 0.03),
            child: Container(),
          )),
      body: Container(
        height: size.height(context),
        width: size.width(context),
        padding: EdgeInsets.symmetric(horizontal: size.width(context) * .05),
        // color: Colors.red,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: size.height(context) * .12,
                      width: size.height(context) * .12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: _imageSelected
                          ? Image.file(
                              image!,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/Rectangle 67.png',
                              height: size.height(context) * .05,
                              fit: BoxFit.cover,
                            ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height(context) * .01,
              ),
              InkWell(
                onTap: (() {
                  openModalBottomSheet(
                      context, _deleteSelectedImage, getAndSetImage);
                }),
                child: const Text(
                  'Change Profile Picture',
                  style: TextStyle(
                      fontFamily: inter,
                      fontSize: 14,
                      color: Color(0xFF1C76BD),
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: size.height(context) * .05,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'About Me',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: inter,
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: size.height(context) * .02,
              ),
              Container(
                height: size.height(context) * .084,
                width: size.width(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFDEDEDE),
                ),
                child: Container(
                  width: size.width(context),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const TextField(
                    maxLines: null,
                    cursorColor: Color(
                      0xFFB7798B,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'About me',
                        suffix: Text('500'),
                        hintStyle: TextStyle(
                            color: Color(
                              0xFF858585,
                            ),
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: inter),
                        fillColor: Colors.white,
                        focusColor: Colors.green,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: size.height(context) * .04,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Basic details',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: inter,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: size.height(context) * .015,
              ),
              Container(
                height: size.height(context) * .52,
                width: size.width(context),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width(context) * .03,
                    vertical: size.height(context) * .01),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFDEDEDE),
                ),
                child: InkWell(
                  onTap: (() {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return const AlertDialog(
                              content: ShowdialogEditProfile());
                        });
                  }),
                  child: Column(
                    children: [
                      BasicDetails(size, context, 'Name', 'Wesley Langworth'),
                      BasicDetails(size, context, 'D.O.B.', '12 Jan 1999'),
                      BasicDetails(size, context, 'Gender', 'Female'),
                      BasicDetails(size, context, 'City', 'Black'),
                      BasicDetails(size, context, 'State', 'Brown'),
                      BasicDetails(size, context, 'Country', 'No'),
                      BasicDetails(size, context, 'Zodiac Sign', 'Leo'),
                      BasicDetails(size, context, 'Income', '5 LPA'),
                      BasicDetails(
                          size, context, 'Occupation', 'Human Resource'),
                      BasicDetails(size, context, 'Marital Status', 'Single'),
                      BasicDetails(size, context, 'Child(ren)', 'No'),
                      BasicDetails(
                          size, context, 'Sexual Orientation', 'Empty'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height(context) * .04,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Personality',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: inter,
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: size.height(context) * .015,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    builder: (context) {
                      return BottomSheetWidget(
                        personalityText: personalityText,
                        tabController: _tabController,
                      );
                    },
                  );
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  // height: size.height(context) * .06,
                  width: size.width(context),
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width(context) * .02,
                      vertical: size.height(context) * .02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFDEDEDE),
                  ),
                  child: const Text(
                    "Shy, Self-cofident, Reliable, Sophisticated",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: inter,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: size.height(context) * .04,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Sports',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: inter,
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: size.height(context) * .015,
              ),
              InkWell(
                onTap: (() {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    builder: (context) {
                      return BottomSheetWidget(
                        personalityText: personalityText,
                        tabController: _tabController,
                      );
                    },
                  );
                }),
                child: Container(
                  alignment: Alignment.centerLeft,
                  // height: size.height(context) * .06,
                  width: size.width(context),
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width(context) * .02,
                      vertical: size.height(context) * .02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFDEDEDE),
                  ),
                  child: const Text(
                    "Billiards/ Pool, Football, Volleyball, Walking/ Hiking",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: inter,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: size.height(context) * .04,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Looking for',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: inter,
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: size.height(context) * .015,
              ),
              Container(
                alignment: Alignment.centerLeft,
                // height: size.height(context) * .06,
                width: size.width(context),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width(context) * .02,
                    vertical: size.height(context) * .02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFDEDEDE),
                ),
                child: const Text(
                  "Long term, Soulmate, Learning/ Exchanging",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: inter,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: size.height(context) * .04,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Hobbies',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: inter,
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: size.height(context) * .015,
              ),
              Container(
                alignment: Alignment.centerLeft,
                // height: size.height(context) * .08,
                width: size.width(context),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width(context) * .02,
                    vertical: size.height(context) * .02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFDEDEDE),
                ),
                child: const Text(
                  "Cooking/ Baking, Networking/ Socialising, Video games,Wine or Food Tasting",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: inter,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: size.height(context) * .04,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Type of relationship',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: inter,
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: size.height(context) * .015,
              ),
              Container(
                alignment: Alignment.centerLeft,
                // height: size.height(context) * .06,
                width: size.width(context),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width(context) * .02,
                    vertical: size.height(context) * .02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFDEDEDE),
                ),
                child: const Text(
                  "Open to anything",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: inter,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: size.height(context) * .04,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Sexual practises',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: inter,
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: size.height(context) * .015,
              ),
              Container(
                alignment: Alignment.centerLeft,
                // height: size.height(context) * .06,
                width: size.width(context),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width(context) * .02,
                    vertical: size.height(context) * .02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFDEDEDE),
                ),
                child: const Text(
                  "Reading erotic literature, Romantic sex, Costumes",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: inter,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: size.height(context) * .04,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Physical details',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: inter,
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: size.height(context) * .015,
              ),
              Container(
                // height: size.height(context) * .52,
                width: size.width(context),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width(context) * .03,
                    vertical: size.height(context) * .02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFDEDEDE),
                ),
                child: InkWell(
                  onTap: (() {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return const AlertDialog(
                              content: PhysicaldialogBix());
                        });
                  }),
                  child: Column(
                    children: [
                      PhysicalDetails(size, context, 'Height', '5.9”'),
                      PhysicalDetails(size, context, 'Figure', 'Empty'),
                      PhysicalDetails(size, context, 'Ethnicity', 'Empty'),
                      PhysicalDetails(size, context, 'Hair color', 'Black'),
                      PhysicalDetails(size, context, 'Eye color', 'Brown'),
                      PhysicalDetails(size, context, 'Smoker', 'No'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget BasicDetails(Sizess size, BuildContext context, question, answer) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width(context) * .73,
          height: size.height(context) * .04,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                question,
                style: const TextStyle(
                    fontFamily: inter,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              Text(
                answer,
                style: const TextStyle(
                    fontFamily: inter,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF858585),
                    fontSize: 14),
              ),
            ],
          ),
        ),
        Icon(
          Icons.arrow_forward_ios_outlined,
          size: size.height(context) * .02,
        )
      ],
    );
  }

  Widget PhysicalDetails(Sizess size, BuildContext context, physical, details) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width(context) * .73,
          height: size.height(context) * .04,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                physical,
                style: const TextStyle(
                    fontFamily: inter,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              Text(
                details,
                style: const TextStyle(
                    fontFamily: inter,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF858585),
                    fontSize: 14),
              ),
            ],
          ),
        ),
        Icon(
          Icons.arrow_forward_ios_outlined,
          size: size.height(context) * .02,
        )
      ],
    );
  }
}
