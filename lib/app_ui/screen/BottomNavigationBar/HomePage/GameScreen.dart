import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/QuestionsAnswer.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/customGradientContainer.dart';
import 'package:dating/constant/checkBoxDeta.dart';
import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  static const String routeName = '/game-screen';

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: size.width(context) * .05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height(context) * .04,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/Vector (10).png',
                  height: size.height(context) * .02,
                ),
              ),
              SizedBox(
                height: size.height(context) * .03,
              ),
              const Text(
                'Let’s play game',
                style: TextStyle(
                    fontFamily: merriweather,
                    fontSize: 24,
                    color: Color(0xFF7A112F),
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: size.height(context) * .03,
              ),
              Expanded(
                child: GridView.builder(
                  // primary: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      // maxCrossAxisExtent: 200,
                      crossAxisCount: 2,
                      mainAxisExtent: size.height(context) * .06,
                      // childAspectRatio: 1 / .32,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 40),
                  findChildIndexCallback: (Key key) {
                    final valueKey = key as ValueKey;
                    final index = games
                        .indexWhere((element) => element == valueKey.value);
                    if (index == -1) return null;
                    return index;
                  },
                  itemCount: games.length,
                  itemBuilder: (context, index) {
                    final item = games[index];
                    return PlayGameMethod(
                      key: ValueKey(item),
                      item: item,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayGameMethod extends StatefulWidget {
  const PlayGameMethod({
    Key? key,
    required this.item,
  }) : super(key: key);
  final String item;
  @override
  State<PlayGameMethod> createState() => _PlayGameMethodState();
}

class _PlayGameMethodState extends State<PlayGameMethod>
    with AutomaticKeepAliveClientMixin {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    super.build(context);
    return UnicornOutlineButton(
      strokeWidth: 3,
      radius: 6,
      gradient:
          const LinearGradient(colors: [Color(0xFF7A112F), Color(0xFFC92564)]),
      onPressed: () {
        setState(() {
          clicked = !clicked;
          Navigator.pushNamed(context, QuestionsAnswer.routeName);
        });
      },
      child: Expanded(
        child: Container(
          margin: const EdgeInsets.all(2.7),
          padding: EdgeInsets.symmetric(horizontal: size.width(context) * .02),
          alignment: Alignment.center,
          // width: double.infinity,
          height: size.height(context) * .06,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                clicked ? const Color(0xFF7A112F) : Colors.white,
                clicked ? const Color(0xFFC92564) : Colors.white,
              ],
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            widget.item,
            style: TextStyle(
                fontFamily: merriweather,
                fontSize: 18,
                color: clicked ? Colors.white : const Color(0xFF7A112F),
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
