
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/pdf_generator.dart';
import '../utils/stripe_payment_service.dart';
import '../utils/ticket_download_dialog.dart';
import '../widgets/ticket_download.dart';
import 'package:flutter/material.dart';

class ParkingPaymentScreen extends StatelessWidget {
  final String websiteName = "ParkPay";
  final String userName = "John Doe";
  final String parkingTimings = "10:00 AM - 6:00 PM";
  final String location = "123 Parking Street, City";
  final double amount = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(websiteName, style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF7C444F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to $websiteName",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Your one-stop solution for hassle-free parking payments. "
                  "Secure and easy transactions with detailed tracking of your payments.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Payment Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("User Name: $userName"),
            Text("Parking Timings: $parkingTimings"),
            Text("Location: $location"),
            Text("Amount: \$${amount.toStringAsFixed(2)}"),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF7C444F),
                ),
                onPressed: () async {
                  String ticketPath = await PDFGenerator.generateTicket(
                    websiteName: websiteName,
                    userName: userName,
                    parkingTimings: parkingTimings,
                    location: location,
                    amount: amount,
                  );
                  showDialog(
                    context: context,
                    builder: (context) => TicketDownloadDialog(ticketPath: ticketPath),
                  );
                 /* bool paymentSuccess = await StripePaymentService.processPayment(context, amount);

                  if (paymentSuccess) {
                    String ticketPath = await PDFGenerator.generateTicket(
                      websiteName: websiteName,
                      userName: userName,
                      parkingTimings: parkingTimings,
                      location: location,
                      amount: amount,
                    );
                    showDialog(
                      context: context,
                      builder: (context) => TicketDownloadDialog(ticketPath: ticketPath),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Payment failed! Please try again.")),
                    );
                  }*/
                },
                child: Text("Pay"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
