import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentDetails extends StatefulWidget {
  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  TextEditingController cardNumberTextController = TextEditingController();

  TextEditingController expiryDateTextController = TextEditingController();

  TextEditingController cardHolderNameTextController = TextEditingController();

  TextEditingController cvvCodeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNumberTextController.text,
            expiryDate: expiryDateTextController.text,
            cardHolderName: cardHolderNameTextController.text,
            cvvCode: cvvCodeTextController.text,
            showBackView: false,
            onCreditCardWidgetChange: (CreditCardBrand
                brand) {},
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: cardNumberTextController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Card number"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: expiryDateTextController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Expiry date"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: cardHolderNameTextController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Card holder name"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: cvvCodeTextController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "cvv Code"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("submit"))
        ],
      ),
    );
  }
}
