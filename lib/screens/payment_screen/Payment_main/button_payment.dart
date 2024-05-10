import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PaymentOptionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const PaymentOptionButton({
    Key? key, // Key parameter is optional
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.black,),
      label: Text(title,
        style: TextStyle(color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 22),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange.shade400),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}