// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dating/app_ui/screen/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/blogs/fullBlog.dart';
import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';

class BlogListScreen extends StatelessWidget {
  const BlogListScreen({super.key});
  static const routeName = "/blog-list";

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/blog_1_img.png",
      "assets/blog_2_img.png",
      "assets/blog_3_img.png",
      "assets/blog_4_img.png",
      "assets/blog_5_img.png",
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf5f5f5),
        foregroundColor: const Color(0xFF7A112F),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.popAndPushNamed(context, Bottom_NavigationBar.routeName);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xFF7A112F),
          ),
        ),
        title: const Text(
          'Blogs',
          style: TextStyle(
              fontSize: 18.0,
              fontFamily: merriweather,
              color: Color(0xFF7A112F),
              fontWeight: FontWeight.w700),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 14,
          mainAxisExtent: MediaQuery.of(context).size.height * 0.342,
          // childAspectRatio: 0.75,
        ),
        itemCount: images.length,
        padding: const EdgeInsets.all(18),
        itemBuilder: (context, index) {
          return BlogGridBox(
            url: "",
            about: "Franklin Gleichner . Nov 11 2022",
            title: "Most important point in a relationship",
            subtitle:
                "Aenean morbi aliquam viverra sit cursus in aenean laoreet hac. Orci ornare viverra scelerisque et quam. Proin ornare elementum purus ut sed tincidunt lorem risus nibh.",
            img: Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

class BlogGridBox extends StatelessWidget {
  final String url, about, title, subtitle;
  final Image img;
  const BlogGridBox({
    Key? key,
    required this.url,
    required this.about,
    required this.title,
    required this.subtitle,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = Sizess();

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(FullBlogScreen.routeName,
          arguments: {"url": url, "about": about, "title": title, "img": img}),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1.2,
            color: const Color(0xff888888),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: size.height(context) * 0.18,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(9.3),
                  topRight: Radius.circular(9.3),
                ),
              ),
              child: img,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 4),
              child: Text(
                about,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    fontFamily: inter,
                    color: Color(0xff777777)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                title,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  fontFamily: inter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                subtitle,
                maxLines: 6,
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  fontFamily: inter,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
