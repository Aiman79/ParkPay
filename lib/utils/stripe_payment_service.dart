import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripePaymentService {
  static Future<bool> processPayment(BuildContext context, double amount) async {
    try {
      // Configure Stripe (Add your publishable key)
      Stripe.publishableKey = "your_stripe_publishable_key";

      // Mock client secret (Replace this with your server integration)
      const clientSecret = "your_payment_intent_client_secret";

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "ParkPay",
        ),
      );

      await Stripe.instance.presentPaymentSheet();
      return true;
    } catch (e) {
      print("Payment Error: $e");
      return false;
    }
  }
}
