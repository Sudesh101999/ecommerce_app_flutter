import 'package:flutter/material.dart';

class HomeComanView extends StatelessWidget {
  const HomeComanView({
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
    return Container(
      width: 150,
      margin: const EdgeInsets.only(
        left: 15,
        top: 20,
        bottom: 30,
        right: 5,
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
    );
  }
}
