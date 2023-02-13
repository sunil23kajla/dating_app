import 'package:dating/constant/blocklist.dart';
import 'package:flutter/material.dart';

import '../../../../../constant/constant.dart';

class BlocklistScreen extends StatefulWidget {
  const BlocklistScreen({Key? key}) : super(key: key);

  static const String routeName = '/block-list';

  @override
  State<BlocklistScreen> createState() => _BlocklistScreenState();
}

class _BlocklistScreenState extends State<BlocklistScreen> {
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
          'Blocklist',
          style: TextStyle(
              fontSize: 18.0,
              fontFamily: merriweather,
              color: Color(0xFF7A112F),
              fontWeight: FontWeight.w700),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height(context) * 0.03),
          child: Container(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width(context) * .03,
        ),
        height: size.height(context),
        width: size.width(context),
        child: ListView.builder(
          itemCount: blocklist.length,
          itemBuilder: (context, index) {
            var block = blocklist[index];
            return Container(
              alignment: Alignment.center,
              height: size.height(context) * .09,
              width: size.width(context),
              margin: EdgeInsets.only(bottom: size.height(context) * .03),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFFDEDEDE),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: size.height(context) * .031,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: size.height(context) * .1,
                    width: size.height(context) * .1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage(block[0]),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                title: Text(
                  block[1],
                  style: const TextStyle(
                      fontFamily: merriweather,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                trailing: PopupMenuButton(
                  constraints: BoxConstraints(
                    maxHeight: size.height(context) * .04,
                    maxWidth: size.width(context) * .25,
                  ),
                  offset: Offset(
                    -15,
                    size.height(context) * .01,
                  ),
                  child: const Icon(Icons.more_vert_outlined),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Container(
                            alignment: Alignment.center,
                            // height: size.height(context) * .04,
                            width: size.width(context) * .22,
                            child: const Text(
                              "Unblock",
                              style: TextStyle(
                                  fontFamily: inter,
                                  fontSize: 14,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                    ];
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
