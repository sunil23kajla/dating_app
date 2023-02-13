import 'package:dating/constant/checkBoxDeta.dart';
import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:underline_indicator/underline_indicator.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget(
      {Key? key, required this.personalityText, required this.tabController})
      : super(key: key);

  final String personalityText;
  final TabController tabController;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 6,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool check = false;
  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
            // width: size.width(context) * 1,
            height: size.height(context) * .6,
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(children: [
              SizedBox(
                height: size.height(context) * .02,
              ),
              Center(
                child: Container(
                  height: size.height(context) * .007,
                  width: size.width(context) * .2,
                  decoration: BoxDecoration(
                      color: const Color(0xFF000000),
                      borderRadius: BorderRadius.circular(3.5)),
                ),
              ),
              DefaultTabController(
                length: 6,
                initialIndex: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TabBar(
                      controller: _tabController,
                      indicator: const UnderlineIndicator(
                          strokeCap: StrokeCap.round, // Set your line endings.
                          borderSide: BorderSide(
                            color: Color(0xff7A112F),
                            width: 4,
                          ),
                          insets: EdgeInsets.only(bottom: 0)),
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      indicatorColor: const Color(0xFF7A112F),
                      indicatorWeight: 4.5,
                      labelColor: const Color(0xFF7A112F),
                      tabs: const <Widget>[
                        Tab(
                          child: Text(
                            'Personality',
                            style: TextStyle(
                                fontFamily: inter,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF000000)),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Sports',
                            style: TextStyle(
                                fontFamily: inter,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF000000)),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Hobbies',
                            style: TextStyle(
                                fontFamily: inter,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF000000)),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Looking for',
                            style: TextStyle(
                                fontFamily: inter,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF000000)),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Type of relationship',
                            style: TextStyle(
                                fontFamily: inter,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF000000)),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Sexual practises',
                            style: TextStyle(
                                fontFamily: inter,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF000000)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: size.height(context) * .5,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width(context) * .02),
                      child: TabBarView(controller: _tabController, children: [
                        InkWell(
                          onTap: (() {
                            _tabController.index = 0;
                          }),
                          child: Column(
                            children: [
                              SizedBox(height: size.height(context) * .01),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: size.height(context) * .02,
                              ),
                              const Text(
                                'What’s your personality?',
                                style: TextStyle(
                                    fontFamily: inter,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF000000)),
                              ),
                              SizedBox(
                                height: size.height(context) * .02,
                              ),
                              SizedBox(
                                height: size.height(context) * .26,
                                width: size.width(context),
                                // color: Colors.red,
                                child: SingleChildScrollView(
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    children: personality
                                        .map(
                                          (e) => InkWell(
                                            onTap: () {
                                              setState(() {
                                                check = !check;
                                              });
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: GradientBoxBorder(
                                                  width: 1.2,
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      check
                                                          ? const Color(
                                                              0xFF7A112F)
                                                          : const Color(
                                                              0xFF818181),
                                                      check
                                                          ? const Color(
                                                              0xFFC92564)
                                                          : const Color(
                                                              0xFF818181),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 4),
                                              child: GradientText(
                                                e,
                                                style: const TextStyle(
                                                    fontFamily: inter,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                colors: [
                                                  check
                                                      ? const Color(0xFF7A112F)
                                                      : const Color(0xFF818181),
                                                  check
                                                      ? const Color(0xFFC92564)
                                                      : const Color(0xFF818181),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height(context) * .008,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Skip',
                                    style: TextStyle(
                                        fontFamily: inter,
                                        fontSize: 20,
                                        color: Color(0xFF818181),
                                        fontWeight: FontWeight.w700),
                                  )),
                              SizedBox(
                                height: size.height(context) * .008,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: size.height(context) * .045,
                                width: size.width(context) * .4,
                                margin: EdgeInsets.only(
                                    bottom: size.height(context) * .002),
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF7A112F),
                                        Color(0xFFC92564)
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                    color: const Color(0xFFF5F5F5)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Done',
                                    style: TextStyle(
                                        fontFamily: inter,
                                        color: Color(0xFFF5F5F5),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (() {
                            _tabController.index = 1;
                          }),
                          child: const Center(
                            child: Text('data'),
                          ),
                        ),
                        const Center(
                          child: Text('data'),
                        ),
                        const Center(
                          child: Text('data'),
                        ),
                        const Center(
                          child: Text('data'),
                        ),
                        const Center(
                          child: Text('data'),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
