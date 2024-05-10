import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddify/screens/home/homescreen.dart';

class PaymentSuccessful extends StatelessWidget {
  final String card;
  final String year;
  final String cvv;
  final String user;

  PaymentSuccessful({required this.card, required this.year, required this.cvv, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        title: Text('Payment Successful', style: TextStyle(fontSize: 26,
            fontWeight: FontWeight.bold ),),
        backgroundColor: Colors.blue.shade100,
      ),
      body:
          Center(
            child: Container(
              height: 375,
              width: 383,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/payment/succesful_payment.png'),
                  Text(
                    'Payment Successful',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5,),
                  SizedBox(height: 3,),
                  Text('Payment Type                                         Net Banking',
                    style: TextStyle(fontWeight: FontWeight.w400),),
                  SizedBox(height: 5,),
                  Text('      Bank                                                         HDFC                 ',
                  style: TextStyle(fontWeight: FontWeight.w400
                  ),),
                  SizedBox(height: 5,),
                  Text('Email                         dayakumar06588@gmail.com'),
                  SizedBox(height: 20,),
                  Text('        Amount Paid                                        15000.00                   ',
                    style: TextStyle(fontWeight: FontWeight.w600),),
                  SizedBox(height: 15,),
                  Text('Transaction ID                                    986514725880',
                    style: TextStyle(fontWeight: FontWeight.w600),),

                  SizedBox(height: 25,),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                      ElevatedButton(
                      onPressed: () {
                       Navigator.pop(context);
                      },
                            style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0), // Square shape
                        ),
                       backgroundColor: Colors.blue, // Button background color set to white
                     ),
                       child: Text('CLOSE',
                     style: TextStyle(color: Colors.white,
                         fontWeight: FontWeight.w600),),
                    ),
                  ]
                  ),
                ]
              )
            )
          )
       );
    }
}

