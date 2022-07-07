import 'package:ecommerce_app/Features/features_page.dart';
import 'package:ecommerce_app/Home/home_categories_view.dart';
import 'package:ecommerce_app/Home/home_coman_view.dart';
import 'package:ecommerce_app/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _newNotification = true;

  late TextEditingController _searchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _newNotification = true;
    _searchController = TextEditingController(text: '');
  }

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
          child: const Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              left: 0,
              top: 10,
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
                  /*Container(
                      alignment: Alignment.topRight,
                      child: const Icon(Icons.do_not_disturb_on_total_silence_sharp,color: Colors.red,size: 10,),
                    ),*/

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
          Padding(
            padding: const EdgeInsets.only(
              left: 0,
              top: 10,
              right: 20,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.filter_alt_outlined,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //search input field
              Container(
                margin: const EdgeInsets.all(22),
                // padding: const EdgeInsets.all(10),
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: const Offset(10, 18),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.grey),
                          hintText: 'Search Your Product',
                          icon: Icon(
                            Icons.search,
                            size: 30,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Cetegories..........................................
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "Cetegories",
                      style: TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(255, 67, 67, 67),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 30,
                    ),
                    child: Text(
                      "See all",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ),
                ],
              ),
              //list........
              Container(
                height: 125,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    HomeCategoriesView(
                      lable: 'Woman',
                      imgPath: AssetImage('assets/images/woman.png'),
                      boxColor: Color.fromARGB(100, 28, 118, 238),
                      boxMargin: EdgeInsets.only(
                        left: 35,
                        top: 20,
                        bottom: 30,
                        right: 5,
                      ),
                    ),
                    HomeCategoriesView(
                      lable: 'Man',
                      imgPath: AssetImage('assets/images/man.png'),
                      boxColor: Color.fromARGB(255, 150, 6, 0),
                      boxMargin: EdgeInsets.only(
                        left: 15,
                        top: 20,
                        bottom: 30,
                        right: 5,
                      ),
                    ),
                    HomeCategoriesView(
                      lable: 'Kids',
                      imgPath: AssetImage('assets/images/kids.png'),
                      boxColor: Colors.green,
                      boxMargin: EdgeInsets.only(
                        left: 15,
                        top: 20,
                        bottom: 30,
                        right: 5,
                      ),
                    ),
                    /*Container(
                      width: 120,
                      margin: const EdgeInsets.only(
                        left: 35,
                        top: 20,
                        bottom: 30,
                        right: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: const AssetImage('assets/images/woman.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            const Color.fromARGB(100, 28, 118, 238)
                                .withOpacity(0.5),
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
                      child: const Center(
                          child: Text(
                        'Woman',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    Container(
                      width: 120,
                      margin: const EdgeInsets.only(
                        left: 15,
                        top: 20,
                        bottom: 30,
                        right: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: const AssetImage('assets/images/man.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              const Color.fromARGB(255, 150, 6, 0)
                                  .withOpacity(0.5),
                              BlendMode.dstATop),
                        ),
                        color: Colors.red.withOpacity(0.8),
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
                      child: const Center(
                          child: Text(
                        'Man',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    Container(
                      width: 120,
                      margin: const EdgeInsets.only(
                        left: 15,
                        top: 20,
                        bottom: 30,
                        right: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: const AssetImage('assets/images/kids.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.green.withOpacity(0.5), BlendMode.dstATop),
                        ),
                        color: Colors.green.withOpacity(0.8),
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
                      child: const Center(
                          child: Text(
                        'Kids',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),*/
                  ],
                ),
              ),

              //Featured.............................................
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "Featured",
                      style: TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(255, 67, 67, 67),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FeaturedPage(),
                        ),
                      );*/
                      Navigator.of(context).push(_featuredPage(const FeaturedPage()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                        right: 30,
                      ),
                      child: Text(
                        "See all",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 270,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(_ProductDetails(const ProductDetails()));
                      },
                      child: HomeComanView(
                          price: 'Rs. 5559',
                          productName: 'Product Name',
                          imgPath: Image.asset(
                            'assets/images/man_2.png',
                            height: 160,
                            fit: BoxFit.fill,
                          ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(_ProductDetails(const ProductDetails()));
                      },
                      child: HomeComanView(
                          price: 'Rs. 5559',
                          productName: 'Product Name',
                          imgPath: Image.asset(
                            'assets/images/woman_1.png',
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(_ProductDetails(const ProductDetails()));
                      },
                      child: HomeComanView(
                          price: 'Rs. 5559',
                          productName: 'Product Name',
                          imgPath: Image.asset(
                            'assets/images/woman_2.png',
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(_ProductDetails(const ProductDetails()));
                      },
                      child: HomeComanView(
                          price: 'Rs. 5559',
                          productName: 'Product Name',
                          imgPath: Image.asset(
                            'assets/images/woman_6.png',
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(_ProductDetails(const ProductDetails()));
                      },
                      child: HomeComanView(
                          price: 'Rs. 5559',
                          productName: 'Product Name',
                          imgPath: Image.asset(
                            'assets/images/woman_7.png',
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                      ),
                    ),
                    /*Container(
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
                            child: Image.asset(
                              'assets/images/woman_1.png',
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Rs. 5559',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Product Name',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            child: Image.asset(
                              'assets/images/woman_2.png',
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Rs. 5559',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Product Name',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            child: Image.asset(
                              'assets/images/woman_6.png',
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Rs. 5559',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Product Name',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            child: Image.asset(
                              'assets/images/woman_7.png',
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Rs. 5559',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Product Name',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),*/
                  ],
                ),
              ),

              //Best..................................................
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "Best Sell",
                      style: TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(255, 67, 67, 67),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 30,
                    ),
                    child: Text(
                      "See all",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ),
                ],
              ),
              Container(
                height: 270,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [

                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(_ProductDetails(const ProductDetails()));
                      },
                      child: HomeComanView(
                        price: 'Rs. 5559',
                        productName: 'Product Name',
                        imgPath: Image.asset(
                          'assets/images/man_2.png',
                          height: 160,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(_ProductDetails(const ProductDetails()));
                      },
                      child: HomeComanView(
                        price: 'Rs. 5559',
                        productName: 'Product Name',
                        imgPath: Image.asset(
                          'assets/images/man_3.png',
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(_ProductDetails(const ProductDetails()));
                      },
                      child: HomeComanView(
                        price: 'Rs. 5559',
                        productName: 'Product Name',
                        imgPath: Image.asset(
                          'assets/images/woman_3.png',
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(_ProductDetails(const ProductDetails()));
                      },
                      child: HomeComanView(
                        price: 'Rs. 5559',
                        productName: 'Product Name',
                        imgPath: Image.asset(
                          'assets/images/woman_5.png',
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(_ProductDetails(const ProductDetails()));
                      },
                      child: HomeComanView(
                        price: 'Rs. 5559',
                        productName: 'Product Name',
                        imgPath: Image.asset(
                          'assets/images/woman_6.png',
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    /*Container(
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
                            child: Image.asset(
                              'assets/images/man_2.png',
                              height: 160,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Rs. 5559',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Product Name',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            child: Image.asset(
                              'assets/images/man_3.png',
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Rs. 5559',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Product Name',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            child: Image.asset(
                              'assets/images/woman_3.png',
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Rs. 5559',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Product Name',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            child: Image.asset(
                              'assets/images/woman_4.png',
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Rs. 5559',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Product Name',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            child: Image.asset(
                              'assets/images/woman_5.png',
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Rs. 5559',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Product Name',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            child: Image.asset(
                              'assets/images/woman_6.png',
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Rs. 5559',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Product Name',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Route _featuredPage(FeaturedPage featuredPage) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const FeaturedPage(),
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
