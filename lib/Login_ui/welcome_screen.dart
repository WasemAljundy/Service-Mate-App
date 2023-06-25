import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/Login_ui/singup_screen.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/square_tile.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  double _sigmaX = 5;
  double _sigmaY = 5;
  double _opacity = 0.2;
  double _width = 350;
  double _height = 300;
  final _formKey = GlobalKey<FormState>();

  // sign user
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/img.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                  const Text("Hi !",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ClipRect(
                    child: BackdropFilter(
                      filter:
                      ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 1)
                                .withOpacity(_opacity),
                            borderRadius:
                            BorderRadius.all(Radius.circular(30))),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.63,
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // username
                                MyTextField(
                                  controller: usernameController,
                                  hintText: 'Email',
                                  obscureText: false,
                                ),

                                const SizedBox(height: 10),

                                // sign in
                                MyButton(
                                  onTap: (() {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignupScreen()),
                                      );
                                    } else {
                                      print('not valid');
                                    }
                                  }),
                                ),

                                const SizedBox(height: 10),

                                // or continue with
                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        'Or',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10),

                                // google + apple sign in buttons
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      // facebook button
                                      SquareTile(
                                          imagePath:
                                          'assets/images/facebook.png',
                                          title: "Continue with Facebook"),
                                      SizedBox(height: 10),

                                      // google button
                                      SquareTile(
                                        imagePath: 'assets/images/google.png',
                                        title: "Continue with Google",
                                      ),

                                      SizedBox(height: 10),
                                      // apple button
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 10),

                                // not a member? register now
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Text(
                                            'Don\'t have an account?',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                            textAlign: TextAlign.start,
                                          ),
                                          const SizedBox(width: 4),
                                          const Text(
                                            'Sign Up',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 71, 233, 133),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.01),
                                      const Text('Forgot Password?',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 71, 233, 133),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          textAlign: TextAlign.start),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}