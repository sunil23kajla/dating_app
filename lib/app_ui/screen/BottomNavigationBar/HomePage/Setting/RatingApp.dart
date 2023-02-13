import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingAppScreen extends StatefulWidget {
  const RatingAppScreen({Key? key}) : super(key: key);

  static const String routeName = '/rating-app';

  @override
  State<RatingAppScreen> createState() => _RatingAppScreenState();
}

class _RatingAppScreenState extends State<RatingAppScreen> {
  double? _rating;
  IconData? _selectedIcon;
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
          'Rating',
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
      body: SizedBox(
        height: size.height(context),
        width: size.width(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Rate the app now',
                style: TextStyle(
                    fontFamily: merriweather,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF7A112F)),
              ),
              SizedBox(
                height: size.height(context) * .1,
              ),
              Image.asset(
                'assets/Rating.png',
                height: size.height(context) * .2,
                fit: BoxFit.contain,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: RatingBar.builder(
                    initialRating: _rating ?? 0.0,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 3,
                    itemSize: size.height(context) * .05,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                    itemBuilder: (context, _) => Icon(
                        _selectedIcon ?? Icons.star_border_outlined,
                        color: const Color(0xFF7A112F)),
                    onRatingUpdate: (rating) {
                      _rating = rating;
                      setState(() {});
                    },
                  ),
                ),
              ),
              SizedBox(
                height: size.height(context) * .03,
              ),
              Container(
                height: size.height(context) * .18,
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
                    hintText: 'Type your review here...',
                    hintStyle: TextStyle(
                        color: Color(0xBA7A112F),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(197, 122, 17, 47),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(183, 122, 17, 47)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
