import 'package:evcompanion2/presentation/view/payment_page_slot/payment_confirmation_page.dart';
import 'package:flutter/material.dart';

class PaymentSlot extends StatefulWidget {
  const PaymentSlot({super.key});

  @override
  State<PaymentSlot> createState() => _PaymentSlotState();
}

class _PaymentSlotState extends State<PaymentSlot> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        centerTitle: true,
        title: const Text('Payment method'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 27,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Payment method',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(19),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/gpay.jpg'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Google',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 21,
                            ),
                          ),
                        ],
                      ),
                      Checkbox(
                          value: isCheck,
                          onChanged: (check) {
                            isCheck = !isCheck;
                            setState(() {});
                          })
                    ],
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const PaymentConfirmationPage();
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
