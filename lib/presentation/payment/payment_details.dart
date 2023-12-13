// import 'package:evcompanion2/presentation/payment/roadMap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentDetails extends StatefulWidget {
  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  TextEditingController cardNumberTextController=TextEditingController();

  TextEditingController expiryDateTextController=TextEditingController();

  TextEditingController cardHolderNameTextController=TextEditingController();

  TextEditingController cvvCodeTextController=TextEditingController();

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
                  showBackView: false, //true when you want to show cvv(back) view
                  onCreditCardWidgetChange: (CreditCardBrand brand) {}, // Callback for anytime credit card brand is changed
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: cardNumberTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Card number"),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: expiryDateTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Expiry date"),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: cardHolderNameTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Card holder name"),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: cvvCodeTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "cvv Code"),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("submit"))
          ],
        ),
    );
  }
}