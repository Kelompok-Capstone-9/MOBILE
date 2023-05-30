import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
          backgroundColor: Colors.orange,
          title: const Text('GoFit'),
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
                      height: 300,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index))),
              SizedBox(height: 32, child: buildIndicator()),
              const Padding(padding: EdgeInsets.all(3)),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'NEW ARTICLES',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 230,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'View All',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.all(3)),
              CarouselSlider.builder(
                  itemCount: imagesArtikel.length,
                  itemBuilder: (context, index, realIndex) {
                    final imagesArtikels = imagesArtikel[index];

                    return buiildImageArtikel(imagesArtikels, index);
                  },
                  options: CarouselOptions(
                      height: 250,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index))),
            ],
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Colors.grey,
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //         backgroundColor: Colors.grey,
        //         icon: Icon(Icons.home),
        //         label: 'Home'),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.business),
        //       label: 'Business',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.school),
        //       label: 'School',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.settings),
        //       label: 'Settings',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.add_a_photo),
        //       label: 'Settings',
        //     ),
        //   ],
        //   // currentIndex: _selectedIndex,
        //   // selectedItemColor: Colors.amber[800],
        //   // onTap: _onItemTapped,
        // ),
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
