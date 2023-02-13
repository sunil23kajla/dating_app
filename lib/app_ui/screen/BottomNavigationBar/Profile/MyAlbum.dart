import 'package:dating/app_ui/screen/BottomNavigationBar/Profile/AddImage.dart';
import 'package:dating/constant/albumlist.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../constant/constant.dart';
import '../../../Widget/showdialogbox.dart';

class MyAlbumScreen extends StatefulWidget {
  const MyAlbumScreen({Key? key}) : super(key: key);

  static const String routeName = '/my-album';

  @override
  State<MyAlbumScreen> createState() => _MyAlbumScreenState();
}

class _MyAlbumScreenState extends State<MyAlbumScreen> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: size.width(context) * .04),
              height: size.height(context) * .77,
              width: size.width(context),
              child: GridView.builder(
                primary: false,
                scrollDirection: Axis.vertical,
                clipBehavior: Clip.antiAlias,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  mainAxisExtent: 230,
                ),
                itemCount: albumList.length,
                itemBuilder: ((context, index) {
                  var album = albumList[index];
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
                                      // imageList.removeAt(index);
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
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AddImages.routeName);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width(context) * .02),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            // color: const Color(0xFFD3DBEE),
                            borderRadius: BorderRadius.circular(6)),
                        height: size.height(context) * .16,
                        width: size.height(context) * .13,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6)),
                              height: size.height(context) * .23,
                              width: size.width(context),
                              child: Image.asset(
                                album[0],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              // color: Colors.red,
                              height: size.height(context) * .055,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    album[1],
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontFamily: inter,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    album[2],
                                    style: const TextStyle(
                                        fontFamily: inter,
                                        fontSize: 16,
                                        color: Color(0xFF717171)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: size.height(context) * .02,
            ),
            InkWell(
              onTap: () {
                showdialogbox(context, size);
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
                  "Create Album",
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
      ),
    );
  }
}
