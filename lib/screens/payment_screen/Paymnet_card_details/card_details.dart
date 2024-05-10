
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weddify/screens/payment_screen/Payment_Processing/process_payment.dart';


class PaymentConfirmationPage extends StatelessWidget {
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();

  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  void _submitForm() {
    final String card = _cardNumberController.text;
    final String year = _yearController.text;
    final String cvv = _cvvController.text;
    final String user = _userNameController.text;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        leading:IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,
            size: 28,),
          onPressed: () {
            Navigator.pop(context); // Navigate back to previous screen
          },
        ),
        title: Text('Debit/Credit card',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),),
      ),
       body:

    SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(0.5),
                child: Image.asset("assets/payment/credit_card1.png",
                  height: 255,
                  width: 600,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8,),
              TextField(
                keyboardType: TextInputType.number,
                controller: _cardNumberController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                   hintText: "Credit Card Number",
                   labelText: 'Credit Card Number',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue
                    )
                  )
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(16),
                ],
              ),
              SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.number,
                controller: _yearController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  hintText: "MM/YY",
                  labelText: 'MM/YY',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue
                        )
                    )
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(4),
                ],
              ),
              SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.number,
                controller: _cvvController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  hintText: "CVV",
                  labelText: 'CVV',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue
                        )
                    )
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  hintText: "Name on Card",
                  labelText: 'Name on Card',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue
                        )
                    )
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentProcess()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
                  minimumSize: MaterialStateProperty.all<Size>(Size(01, 50)),
                  elevation: MaterialStateProperty.all<double>(10),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.yellow),
                ),
                  child: Text('Continue', style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                   ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}