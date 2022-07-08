import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late bool _newNotification = true;

  final controller = CarouselController();
  int activeIndex = 0;
  List imageSliders = [
    'assets/images/man_1.png',
    'assets/images/man_2.png',
    'assets/images/man_3.png',
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: null,
      statusBarColor: Color(0xFFFCFCFC),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFCFCFC),
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 10,
          ),
          child: IconButton(
            icon: Icon(
              Icons.keyboard_backspace_sharp,
              size: 35,
              color: Colors.grey[600],
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              left: 0,
              top: 10,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.search_outlined,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 0,
              top: 10,
              right: 20,
            ),
            child: IconButton(
              icon: Stack(
                children: [
                  if (_newNotification)
                    Positioned(
                      right: 1,
                      top: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        width: 20.0 / 2.5,
                        height: 20.0 / 2.5,
                      ),
                    ),
                  Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.black,
                    size: 30,
                  )
                ],
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //pointer below images
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: .6,
                        height: 160,
                        aspectRatio: 1.2,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        },
                      ),
                      items: [for (var item in imageSliders) Image.asset(item)],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imageSliders.map((url) {
                          int index = imageSliders.indexOf(url);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: activeIndex == index
                                  ? Colors.blue
                                  : const Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      'Black turtleneck top',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF2D2D2D),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Row(
                      children: [
                        Text(
                          '\$43',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF667EEA),
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Text(
                          '\$93',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF2D2D2D),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Divider(
                    height: 0,
                    thickness: 1.3,
                    color: Color(0xFFE2E2E2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 90,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF667EEA),
                          ),
                          child: Center(
                            child: Text(
                              '4.5',
                              style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Very Good',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Text(
                          '20 Reviews',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF667EEA),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 1.3,
                    color: Color(0xFFE2E2E2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 0, left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            color: Color(0xFF2D2D2D),
                            fontSize: 23,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'arofjawoeijfa  fpoajpo adhf ap adf paofp aofafoa fp fao foa fop oroifoiasjfpioa jfpoiajhf fpoaiwjfpo iawpioefjpioawjfoe awpoifjpoa frpoiarjpfoiafejapwoeifjpoawefjpoiajwfpoiaopf  poawpfio',
                          style: TextStyle(
                            color: Color(0xFF656565),
                            fontSize: 16,
                            height:
                                1.5, // the height between text, default is null
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'More',
                              style: TextStyle(
                                color: Color(0xFF667EEA),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 1.3,
                    color: Color(0xFFE2E2E2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Select Size',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Selected Color',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF2A2A2A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 1.3,
                    color: Color(0xFFE2E2E2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFF3F3F3),
                          ),
                          child: Center(
                            child: Text(
                              'S',
                              style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF667EEA),
                          ),
                          child: Center(
                            child: Text(
                              'M',
                              style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFF3F3F3),
                          ),
                          child: Center(
                            child: Text(
                              'L',
                              style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFFFFFFF),
                          ),
                          child: Center(
                            child: Text(
                              'XXL',
                              style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 18,
              bottom: 18
            ),
            color: Color(0xFF667EEA),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'BUY NOW',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
