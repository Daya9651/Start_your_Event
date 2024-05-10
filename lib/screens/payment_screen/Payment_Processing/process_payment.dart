import 'package:flutter/material.dart';
import 'package:weddify/screens/payment_screen/Payment_Successful/payment_successful.dart';
import 'package:weddify/screens/payment_screen/map/google_map.dart';

class PaymentProcess extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          leading:IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black,
              size: 32,),
            onPressed: () {
              Navigator.pop(context); // Navigate back to previous screen
            },
          ),
          backgroundColor: Colors.blue.shade100,
    ),
    body: Center(
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => PaymentSuccessful(card: 'card', year: 'year', cvv: 'cvv', user: 'user'))
          );
              //MaterialPageRoute(builder: (context) => PaymentSuccessful(card: 'card', year: 'year', cvv: 'cvv', user: 'user',)));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),// Change the button color here
        ),
        child: Text('Process Payment',
          style: TextStyle(color: Colors.black, fontSize: 15,
            fontWeight: FontWeight.bold),),
      ),
    )
    );
  }
}