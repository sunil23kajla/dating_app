import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';

class FullBlogScreen extends StatelessWidget {
  const FullBlogScreen({super.key});
  static const routeName = '/full-blog';

  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    var height = size.height(context);
    var width = size.width(context);
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var url = args['url'] as String;
    var about = args['about'] as String;
    var title = args['title'] as String;
    var img = args['img'] as Image;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(width: width, height: height * 0.321, child: img),
              Positioned(
                top: height * 0.1928,
                bottom: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 0, width * 0.3, 8),
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                          fontFamily: merriweather,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        about,
                        style: const TextStyle(
                            fontFamily: inter,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // top: height * 0.287,
                child: Container(
                  margin: EdgeInsets.only(top: height * 0.287),
                  constraints: BoxConstraints(minHeight: height * 0.7),
                  decoration: const BoxDecoration(
                      color: Color(0xfff5f5f5),
                      // color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21, vertical: 24),
                    child: Text(
                      "Quis aliquet aenean praesent ultrices pellentesque. Sed ipsum varius viverra gravida aenean lectus. Ultricies condimentum nam pellentesque a lobortis egestas. Ac nibh augue elit habitasse eu ante ultrices. Bibendum est imperdiet augue mi mattis pharetra viverra nunc. Id aliquet sagittis ut est ipsum.\n\nCommodo enim nisl elementum convallis sit aliquam sagittis. Tellus rhoncus auctor platea vitae sed. Pulvinar nunc porttitor fusce in. Tristique turpis egestas integer pulvinar etiam sed. Vestibulum molestie vitae dui sed vestibulum. Auctor eu mauris mauris amet quis. Malesuada enim euismod vel cursus nisi facilisis. Blandit auctor sem pellentesque sit at ac fames tellus magna. At cursus orci vulputate nisi interdum neque elit elementum nec. Pellentesque ultricies leo tellus dolor sagittis sit. Ac vulputate pharetra ultrices quis. Id viverra in aliquam duis in pretium semper nisl duis. Integer consectetur amet sagittis at vivamus amet imperdiet. Eleifend porttitor lacinia porta tellus proin auctor risus adipiscing amet. Diam natoque orci pulvinar nisl ipsum arcu amet. Quis iaculis iaculis pellentesque vitae et urna aliquam nec. Dapibus egestas at vulputate quis. Augue orci nunc nunc nisl leo metus arcu at dui. Et odio ut justo egestas iaculis id. Elit quis habitasse lacinia augue at facilisis netus ipsum vitae. Faucibus nunc in facilisi nascetur mauris sociis. Nec pellentesque id posuere lectus arcu nisl sit. Fringilla mattis pretium ut metus scelerisque tellus amet eu. Sit diam arcu viverra arcu vitae curabitur quisque. Ullamcorper blandit elementum habitant eget interdum tincidunt pretium. Ultrices pretium lectus nibh est quis augue. Semper neque eget in ut ipsum eu ac ut. Tincidunt tincidunt cras fermentum aenean fermentum congue. Blandit lacus vulputate neque metus nisi.",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.5,
                        height: 1.302,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
