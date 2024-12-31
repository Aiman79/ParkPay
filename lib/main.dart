import 'package:flutter/material.dart';
import 'package:parkpay/screens/parking_payment_screen.dart';

void main() {
  runApp(ParkPayApp());
}

class ParkPayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ParkPay',
      theme: ThemeData(
        primaryColor: Color(0xFF7C444F),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle(color: Color(0xFF7C444F)),
          bodyText1: TextStyle(color: Color(0xFF7C444F)),
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
      home: ParkingPaymentScreen(),
    );
  }
}
