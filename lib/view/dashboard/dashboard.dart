import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/article/artikel_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: camel_case_types
class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_Screen();
}

// ignore: camel_case_types
class _Home_Screen extends State<Home_Screen> {
  // ignore: non_constant_identifier_names
  int activeIndex = 0;
  final imageSlinder = [
    'assets/images/Join.png',
    'assets/images/Dailyprogress.png',
    'assets/images/Meet.png'
  ];
  final imagesArtikel = [
    'assets/images/mobile.jpeg',
    'assets/images/Athletis.png',
    'assets/images/Foods.png',
    'assets/images/Nurtrition.png',
    'assets/images/Fruits.png',
    'assets/images/GettingStarted.png'
  ];
  final titleslider = [
    'Save time in the kitchen with Gofit'
        'Traning on fire'
        'Food in healty'
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFF6F6F6),
          title: Text(
            'GoFit',
            style: ThemeText.headingDashboard,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              CarouselSlider.builder(
                  itemCount: imageSlinder.length,
                  itemBuilder: (context, index, realIndex) {
                    final imageSlinders = imageSlinder[index];
                    return buiildImage(imageSlinders, index);
                  },
                  options: CarouselOptions(
                      height: 320,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index))),
              SizedBox(
                height: 24,
                child: buildIndicator(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'NEW ARTICLES',
                      style: ThemeText.heading4,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Artikel(),
                          ),
                        );
                      },
                      child: Text(
                        'View all',
                        style: ThemeText.headingView,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagesArtikel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: 400,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            imagesArtikel[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Save time in the kitchen with GoFit',
                      style: ThemeText.headingImage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buiildImage(String imageSlinder, int index) => Container(
        //margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.amber,
        child: Image.asset(
          imageSlinder,
          fit: BoxFit.cover,
        ),
      );

  Widget buiildImageArtikel(String imageSlinder, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.amber,
        child: Image.asset(
          imageSlinder,
          fit: BoxFit.cover,
        ),
      );
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: imageSlinder.length,
        effect: const JumpingDotEffect(
            dotHeight: 10,
            dotWidth: 10,
            dotColor: Colors.black,
            activeDotColor: Colors.orangeAccent),
      );
}
