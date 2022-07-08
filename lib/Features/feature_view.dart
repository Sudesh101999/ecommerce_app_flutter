import 'package:ecommerce_app/product_details.dart';
import 'package:flutter/material.dart';

class FeatureView extends StatelessWidget {
  const FeatureView({
    Key? key,
    required this.price,
    required this.productName,
    required this.imgPath,
  }) : super(key: key);

  final String price;
  final String productName;
  final Image imgPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(_ProductDetails(const ProductDetails()));
      },
      child: Container(
        // width: 150,
        margin: const EdgeInsets.only(
          left: 10,right: 10,top: 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: imgPath,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              price,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              productName,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Route _ProductDetails(ProductDetails featuredPage) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
      const ProductDetails(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
