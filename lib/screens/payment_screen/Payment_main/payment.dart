import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weddify/provider/appprovider.dart';
import 'package:weddify/screens/payment_screen//Payment_main/button_payment.dart';
import 'package:weddify/screens/payment_screen/map/google_map.dart';
import '../../../constants/routes/routes.dart';
import '../../../firebase_helper/firebasefirestore/firebase_firestore.dart';
import '../../../models/bestvenue/bestvenuemodel.dart';
import '../../custom_bottombar/custom_bottombar.dart';
import '../../stripehelper/stripehelper.dart';
import '../Paymnet_card_details/card_details.dart';

class PaymentMethod extends StatefulWidget {
  final ProductModel singleProduct;
  const PaymentMethod({super.key, required this.singleProduct});

  @override
  State<PaymentMethod> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<PaymentMethod> {
  int groupValue = 1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade100,
        //iconTheme: IconThemeData(color: Colors.white),
        // title: Text(
        //   "Check-out",
        //   style: GoogleFonts.kurale(),
        // ),
       // centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Row(
               children: [
                 IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black,
                    size: 32,),
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to previous screen
                  },
                 ),
                 Text('Payment Option',
                   style: TextStyle(fontSize: 35,
                       fontWeight: FontWeight.w500),
                 ),
               ],
             ),

            SizedBox(height: 25,),
            PaymentOptionButton(
              title: 'Cash on Delivery',
              icon: Icons.attach_money_rounded,
              // onPressed: () {
              //   // Handle cash on delivery option
              // },
              onPressed: () async {
                appProvider.clearBuyProduct();
                appProvider.addBuyProduct(widget.singleProduct);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> mapPage()));
                if (groupValue == 1) {
                  bool value = await FirebaseFirestoreHelper.instance
                      .uploadOrderedProductFirebase(
                      appProvider.getBuyProductList,
                      context,
                      "Cash on Delivery");
                  appProvider.clearBuyProduct();
                  if (value) {
                    Future.delayed(const Duration(seconds: 30), () {
                      Routes.instance.push(
                          widget: const CustomBottomBar(), context: context);
                    });
                  }
                }
                else {
                  int value = double.parse(
                      appProvider.totalPriceBuyProductList().toString())
                      .round()
                      .toInt();
                  String totalPrice = (value * 100).toString();
                  await StripeHelper.instance
                      .makePayment(totalPrice.toString(), context);
                }
              },
            ),

            SizedBox(height: 20),
            PaymentOptionButton(
              title: 'Debit/Credit card',
              icon: Icons.credit_card,
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentConfirmationPage()));
                // Handle online payment option
              },
            ),
            SizedBox(height:20,),
            Container(
              padding: EdgeInsets.all(2),
              child: Image.asset("assets/payment/Delivery_man1.png",
                  height: 300,
                  width: 300,
                  fit: BoxFit.contain,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
