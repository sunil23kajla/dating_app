import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/SettingScreen.dart';
import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../screen/BottomNavigationBar/Profile/ProfileScreen.dart';

Future<void> openModalBottomSheet(
  BuildContext context,
  Function() onDeletePressed,
  void Function(ImageSource) imageSelect,
) =>
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        builder: (context) => Container(
              padding: const EdgeInsets.all(12),
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 2),
                  bottomSheetTopBar(),
                  const SizedBox(height: 3.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          "Profile photo",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 19,
                              fontFamily: inter),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      BottomSheetIconButton(
                        icon: Icons.camera_alt,
                        onTap: () => imageSelect(ImageSource.camera),
                      ),
                      const SizedBox(width: 20),
                      BottomSheetIconButton(
                          onTap: () => imageSelect(ImageSource.gallery),
                          icon: Icons.photo),
                    ],
                  )
                ],
              ),
            ));

Center bottomSheetTopBar() {
  return Center(
    child: Container(
      height: 3.5,
      width: 47,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10.5)),
    ),
  );
}

Future<void> openModalBottomSheetWidget(
  BuildContext context,
  Function() onDeletePressed,
  void Function(ImageSource) imageSelect,
) =>
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        builder: (context) => Container(
              padding: const EdgeInsets.all(12),
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 2),
                  bottomSheetTopBar(),
                  const SizedBox(height: 3.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          "Upload photo",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 19,
                              fontFamily: inter),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      BottomSheetIconButton(
                        icon: Icons.camera_alt,
                        onTap: () => imageSelect(ImageSource.camera),
                      ),
                      const SizedBox(width: 20),
                      BottomSheetIconButton(
                          onTap: () => imageSelect(ImageSource.gallery),
                          icon: Icons.photo),
                    ],
                  )
                ],
              ),
            ));

Center bottomSheetTopBarWidget() {
  return Center(
    child: Container(
      height: 3.5,
      width: 47,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(3.5)),
    ),
  );
}

Future<void> settingbottomsheet(
  BuildContext context,
) =>
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        builder: (context) => Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(12),
            height: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.width * .01,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(child: settingbottomsheetWidget()),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).size.width * .1,
                  width: MediaQuery.of(context).size.width * .35,
                  child: InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, SettingScreen.routeName);
                    }),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.settings,
                          color: Color(0xFF7A112F),
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                              fontFamily: inter,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF7A112F)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )));

Center settingbottomsheetWidget() {
  return Center(
    child: Container(
      height: 3.5,
      width: 47,
      decoration: BoxDecoration(
          color: const Color(0xFF000000),
          borderRadius: BorderRadius.circular(3.5)),
    ),
  );
}
