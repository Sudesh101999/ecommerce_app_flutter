import 'package:ecommerce_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late bool _passwordVisible;

  // _userPasswordController = TextEditingController();
  late TextEditingController _userPasswordController;
  late TextEditingController _userEmailController;
  late TextEditingController _userNameController;

  @override
  void initState() {
    _passwordVisible = false;
    _userNameController = TextEditingController(text: '');
    _userEmailController = TextEditingController(text: '');
    _userPasswordController = TextEditingController(text: 'password');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              top: 20,
            ),
            child: IconButton(
              icon: Icon(
                Icons.keyboard_backspace_sharp,
                size: 35,
                color: Colors.grey[400],
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name input
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[500],
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _userNameController,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "User name",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //Email input
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[500],
                          ),
                        ),
                        TextFormField(
                          controller: _userEmailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "abcd@efgh.com",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //password input
                        Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[500],
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _userPasswordController,
                          obscureText: !_passwordVisible,
                          //This will obscure text dynamically
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey[400],
                                // color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        //button
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              // begin: Alignment.topLeft,
                              // end: Alignment.bottomRight,
                              // stops: [0.0, 1.0],
                              colors: [
                                Colors.blue.shade700,
                                Colors.blue.shade300,
                              ],
                            ),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {
                              if (_userNameController.text.isEmpty) {
                                showMessage("Name getting empty...!!!");
                              } else if (_userEmailController.text.isEmpty) {
                                showMessage("Email getting empty...!!!");
                              } else if (_userPasswordController.text.isEmpty) {
                                showMessage("Password getting empty...!!!");
                              } else {
                                String name = _userNameController.text;
                                String email = _userEmailController.text;
                                String password = _userPasswordController.text;
                                showMessage(
                                    'Name: $name,\nEmail: $email,\nPassword: $password');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('Don\'t have an account ?'),
                            TextButton(
                              child: const Text(
                                'Sign in',
                                style: TextStyle(fontSize: 19, color: Colors.grey),
                              ),
                              onPressed: () {
                                //signup screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
