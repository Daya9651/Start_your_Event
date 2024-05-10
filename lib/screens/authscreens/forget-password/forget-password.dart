import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weddify/constants/constantss/constantss.dart';
import 'package:weddify/widgets/button/primaryelevatedbutton.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: Text(
          'Forgot Password',
          style: GoogleFonts.kurale(fontSize: 30),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/lonIn.jpg'),
                fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border:Border.all(color: Colors.black,),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextFormField(
                  controller: emailController,
                  decoration:
                      const InputDecoration(
                        hintText: 'startyourevent@gmail.com',
                        focusedBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            )

                        ),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.black,
                        ),
                      ),
                ),
              ),

              // ignore: prefer_const_constructors
              SizedBox(
                height: 40,
              ),
              PrimaryElevatedButton(
                  title: 'Forgot',
                  onPressed: () {
                    auth
                        .sendPasswordResetEmail(
                            email: emailController.text.toString())
                        .then((value) {
                      toastMessage(
                          'We have sent you email to recover password, please check email');
                    }).onError((error, stackTrace) {
                      toastMessage(error.toString());
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
