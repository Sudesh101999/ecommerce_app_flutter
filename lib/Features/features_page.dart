import 'package:ecommerce_app/Features/feature_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeaturedPage extends StatefulWidget {
  const FeaturedPage({Key? key}) : super(key: key);

  @override
  State<FeaturedPage> createState() => _FeaturedPageState();
}

class _FeaturedPageState extends State<FeaturedPage> {
  late bool _newNotification = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: null,
      statusBarColor: Color(0xFFFFFFFF),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
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
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 27,
                top: 10
              ),
              child: Text(
                'Featured',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 67, 67, 67),
                ),
              ),
            ),
          ),
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.82,
              children: [
                FeatureView(
                  price: 'Rs. 5559',
                  productName: 'Product Name',
                  imgPath: Image.asset(
                    'assets/images/woman_5.png',
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
                FeatureView(
                  price: 'Rs. 5559',
                  productName: 'Product Name',
                  imgPath: Image.asset(
                    'assets/images/man_1.png',
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
                FeatureView(
                  price: 'Rs. 5559',
                  productName: 'Product Name',
                  imgPath: Image.asset(
                    'assets/images/woman_5.png',
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
                FeatureView(
                  price: 'Rs. 5559',
                  productName: 'Product Name',
                  imgPath: Image.asset(
                    'assets/images/man_2.png',
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
                FeatureView(
                  price: 'Rs. 5559',
                  productName: 'Product Name',
                  imgPath: Image.asset(
                    'assets/images/man_3.png',
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
                FeatureView(
                  price: 'Rs. 5559',
                  productName: 'Product Name',
                  imgPath: Image.asset(
                    'assets/images/woman_7.png',
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
                FeatureView(
                  price: 'Rs. 5559',
                  productName: 'Product Name',
                  imgPath: Image.asset(
                    'assets/images/woman_6.png',
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
                FeatureView(
                  price: 'Rs. 5559',
                  productName: 'Product Name',
                  imgPath: Image.asset(
                    'assets/images/woman_5.png',
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
