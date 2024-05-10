// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weddify/constants/constantss/constantss.dart';
import 'package:weddify/constants/routes/routes.dart';
import 'package:weddify/firebase_helper/firebaseauth/firebaseauthhelper.dart';
import 'package:weddify/screens/authscreens/forget-password/forget-password.dart';
import 'package:weddify/screens/authscreens/register/registerscreen.dart';
import 'package:weddify/screens/custom_bottombar/custom_bottombar.dart';
import 'package:weddify/screens/home/homescreen.dart';
import 'package:weddify/widgets/button/primaryelevatedbutton.dart';
import 'package:weddify/widgets/toptext/toptext.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade50,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/lonIn.jpg'),
          fit: BoxFit.cover, )
        ),
        child: Center(

          child: Padding(
            padding: const EdgeInsets.only(top: 0, right: 16, bottom: 16, left: 16),
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    TopText(
                        title: "Welcome Back!",
                        subtitle: "Enter your password and login here"),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,),
                        borderRadius: BorderRadius.circular(15),


                      ),
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          hintText: "G-Mail",
                          focusedBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.orange,
                              ),
                          ),
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,),
                            borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: password,
                        obscureText: isShowPassword,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          hintText: "Password",
                          focusedBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.orange,
                              )
                          ),
                          suffixIcon: CupertinoButton(
                            onPressed: () {
                              setState(() {
                                isShowPassword = !isShowPassword;
                              });
                            },
                            child: Icon(
                              Icons.visibility,
                              color: isShowPassword ? Colors.grey : Colors.green,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CupertinoButton(
                        onPressed: () {
                          Routes.instance
                              .push(widget: ForgotPasswordScreen(), context: context);
                        },
                        child: Text(
                          "forget password?",
                          style: GoogleFonts.kurale(
                            fontSize: 18,
                            color: Colors.pink[400],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    PrimaryElevatedButton(
                      title: 'Login',
                      onPressed: () async {
                        bool isVaildated = loginVaildation(email.text, password.text);
                        if (isVaildated) {
                          bool isLogined = await FirebaseAuthHelper.instance
                              .login(email.text, password.text, context);
                          if (isLogined) {
                            Routes.instance.pushAndRemoveUntil(
                                widget: const CustomBottomBar(), context: context);
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don't have an account??",
                          style: GoogleFonts.kurale(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                          child: Text(
                            "Register Here",
                            style: GoogleFonts.kurale(
                              fontSize: 16,
                              color: Colors.pink[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

            ),
          ),
        ),
      ),
    );
  }
}

class Fontweight {}
