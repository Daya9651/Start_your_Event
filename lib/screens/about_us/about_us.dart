import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text(
          "About Us",
          style: GoogleFonts.kurale(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(
                child: Text(
                  "Your Ultimate Events Companion",
                  style: TextStyle(fontSize: 22,
                  fontWeight: FontWeight.bold),
                  ),
              ),
              Text('Welcome to All Things Booking, your one-stop solution for seamlessly'
                  ' planning and managing all your events. Whether its a corporate conference, '
                  'a music festival, a wedding celebration, or a cozy dinner party,'
                  ' our comprehensive booking application has got you covered.                                                 '
                  '1. Event Discovery: Explore a diverse range of events happening in your '
                  'area or around the world. From concerts and workshops to sports tournaments and '
                  'community gatherings, find the perfect event to suit your interests and schedule.                                    '
                  '2. Secure Booking: Reserve your spot at your favorite events with just a few taps. '
                  'Our secure booking system ensures that your transactions are safe and hassle-free. '
                  'Say goodbye to long queues and last-minute ticket scrambles.                                                '
                  '3. Customer Support: Our dedicated customer support team is available to assist you'
                  ' every step of the way. Whether you have questions about an event, need help '
                  'with bookings, or encounter any issues, we are here to help.',
              style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
