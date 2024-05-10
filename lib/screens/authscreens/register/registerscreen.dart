// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weddify/constants/constantss/constantss.dart';
import 'package:weddify/constants/routes/routes.dart';
import 'package:weddify/firebase_helper/firebaseauth/firebaseauthhelper.dart';
import 'package:weddify/screens/authscreens/login/loginscreen.dart';
import 'package:weddify/widgets/button/primaryelevatedbutton.dart';
import 'package:weddify/widgets/toptext/toptext.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isShowPassword = true;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade50,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/Regi.jpg'),
          fit: BoxFit.cover)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 0, right: 16, bottom: 50, left: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TopText(
                          title: "      Register Here",
                          subtitle: "Welcome, Geeks Create Your First Account"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        hintText: "Name",
                        focusedBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.orange, width: 1.5
                          )

                        ),
                        prefixIcon: Icon(
                          Icons.person,
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
                      border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "E-Mail",
                        focusedBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.orange, width: 1.5
                            )

                        ),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: phone,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Phone",
                        focusedBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.orange, width: 1.5
                            )
                        ),

                        prefixIcon: Icon(
                          Icons.call,
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
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
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
                              color: Colors.orange, width: 1.5
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
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryElevatedButton(
                    title: 'Create An Account',
                    onPressed: () async {
                      bool isVaildated = signUpVaildation(
                          email.text, password.text, name.text, phone.text);
                      if (isVaildated) {
                        bool isLogined = await FirebaseAuthHelper.instance
                            .signUp(name.text, email.text, password.text, context);
                        if (isLogined) {
                          // ignore: use_build_context_synchronously
                          Routes.instance.pushAndRemoveUntil(
                              widget: const LoginScreen(), context: context);
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " I have already an account?",

                        style: GoogleFonts.kurale(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "Login Here",
                          style: GoogleFonts.kurale(
                            fontSize: 16,
                            color: Colors.pink,
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
