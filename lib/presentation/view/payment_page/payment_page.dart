import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: myappColor,
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 10,
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/evcomp.jpg'),
          ),
        ),
        title: const Text('EV Companion'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w200,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 27,
            ),
          )
        ],
      ),
      body: Column(
        children: List.generate(
            1,
            (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: ListTile(
                        leading: Image.asset(
                            'assets/7123025_logo_google_g_icon.png'),
                        title: Text('Google'),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
