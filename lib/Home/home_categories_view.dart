import 'package:flutter/material.dart';

class HomeCategoriesView extends StatelessWidget {
  const HomeCategoriesView({
    Key? key,
    required this.lable,
    required this.imgPath,
    required this.boxColor,
    required this.boxMargin,
  }) : super(key: key);

  final String lable;
  final AssetImage imgPath;
  final Color boxColor;
  final EdgeInsets boxMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: boxMargin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: imgPath,//const AssetImage('assets/images/woman.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            boxColor.withOpacity(0.5),//Color.fromARGB(100, 28, 118, 238).withOpacity(0.5),
            BlendMode.dstATop,
          ),
        ),
        color: Colors.blue.withOpacity(0.8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            offset: const Offset(8, 10),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      // color: Colors.purple.shade100,
      child: Center(
          child: Text(
            lable,
            style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
