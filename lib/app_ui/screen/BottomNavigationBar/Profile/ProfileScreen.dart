import 'dart:io';

import 'package:dating/app_ui/Widget/profileimagepicker.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/CoinsSceen.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/Profile/EditProfile.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/Profile/GameResult.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/Profile/MyAlbum.dart';
import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        if (response.isEmpty) {
          return null;
        }
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

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Color(0xFFFFFFFF)),
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: SizedBox(
            height: size.height(context) * 1.15,
            width: size.width(context),

            // color: Colors.red,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                    clipBehavior: Clip.antiAlias,
                    height: size.height(context) * .32,
                    width: size.width(context) * .58,
                    margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                    padding:
                        const EdgeInsets.only(bottom: 2, left: 5, right: 5),
                    transform: Matrix4.translationValues(0, -5, 0),
                    decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        width: 4,
                        gradient: LinearGradient(
                          colors: [Color(0xFF7A112F), Color(0xFFC92564)],
                        ),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(size.width(context) * .28),
                        bottomRight: Radius.circular(size.width(context) * .28),
                      ),
                    ),
                    child: CircleAvatar(
                      radius: size.height(context) * .2,
                      child: Image.asset(
                        'assets/Rectangle 67.png',
                        // height: size.height(context) * .1,
                        fit: BoxFit.fill,
                      ),
                    )),
                Positioned(
                  left: size.width(context) * .08,
                  top: size.height(context) * .05,
                  child: InkWell(
                    onTap: (() {
                      if (imageList.length < 6) {
                        openModalBottomSheetWidget(
                            context, _deleteSelectedImage, getAndSetImage);
                      } else {
                        Fluttertoast.showToast(
                            msg: "can not select more than six images",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 14.0);
                      }
                    }),
                    child: Image.asset(
                      'assets/Vector (44).png',
                      height: size.height(context) * .02,
                    ),
                  ),
                ),
                Positioned(
                  right: size.width(context) * .08,
                  top: size.height(context) * .04,
                  child: InkWell(
                    onTap: (() {
                      settingbottomsheet(
                        context,
                      );
                    }),
                    child: Image.asset(
                      'assets/Menu.png',
                      height: size.height(context) * .03,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height(context) * .28,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, EditProfile.routeName);
                    },
                    child: Container(
                      height: size.height(context) * .04,
                      width: size.width(context) * .31,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF7A112F), Color(0xFFC92564)],
                          ),
                          borderRadius: BorderRadius.circular(35),
                          color: const Color(0xFFF5F5F5)),
                      child: const Center(
                          child: Text(
                        'Edit Profile',
                        style: TextStyle(
                            fontFamily: inter,
                            color: Color(0xFFF5F5F5),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      )),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height(context) * .36,
                  child: GradientText(
                    'Wesley Langworth, 22',
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: merriweather,
                        fontWeight: FontWeight.w400),
                    colors: const [Color(0xFF7A112F), Color(0xFFC92564)],
                  ),
                ),
                Positioned(
                  top: size.height(context) * .42,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width(context) * .05),
                    height: size.height(context) * .4,
                    width: size.width(context),
                    child: imageList.isNotEmpty
                        ? GridView.builder(
                            primary: false,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 10,
                                    mainAxisExtent: 140,
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
                                    borderRadius: BorderRadius.circular(6),
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
                ),
                Positioned(
                  bottom: size.height(context) * .27,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyAlbumScreen.routeName);
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
                        "My Album",
                        style: TextStyle(
                          fontFamily: inter,
                          color: Color(0xFFF5F5F5),
                          fontSize: 16,
                        ),
                      )),
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height(context) * .08,
                  child: SizedBox(
                    width: size.width(context),
                    child: Column(
                      children: [
                        Divider(
                          height: size.height(context) * .03,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width(context) * .04),
                          child: InkWell(
                            onTap: (() {
                              Navigator.pushNamed(
                                  context, CoinsScreen.routeName);
                            }),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Total Coins',
                                  style: TextStyle(
                                      fontFamily: inter,
                                      color: Color(0xFF000000),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.navigate_next_outlined,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: size.height(context) * .03,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width(context) * .04),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, GameResultScreen.routeName);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Game Result',
                                  style: TextStyle(
                                      fontFamily: inter,
                                      color: Color(0xFF000000),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.navigate_next_outlined,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: size.height(context) * .03,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class BottomSheetIconButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final double? size;
  final Color? bgColor;
  const BottomSheetIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.size,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return Container(
      clipBehavior: Clip.antiAlias,
      // width: size.width(context) * .12,
      // height: size.height(context) * .065,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7A112F), Color(0xFFC92564)],
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
          child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      )),
    );
  }
}
