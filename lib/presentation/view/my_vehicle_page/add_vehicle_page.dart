import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';

class AddVehiclePage extends StatelessWidget {
  const AddVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: myappColor,
                width: 4,
              ),
            ),
            child: const Center(
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: 25,
                  color: myappColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 20,
        title: const Text(
          'Add New Vehicle',
          style: TextStyle(
            color: myappColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 32,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Vehicle Details',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //add vehicle name
            const Text(
              'Vehicle Name',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 216, 216),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: TextField(
                  cursorHeight: 35,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add model name',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //add vehicle company name
            const Text(
              'Company Name',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 216, 216),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: TextField(
                  cursorHeight: 35,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add brand name',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //add vehicle uid number
            const Text(
              'Add UID Number',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 216, 216),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: TextField(
                  cursorHeight: 35,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add model name',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //add battery capacity
            const Text(
              'Add Battery capacity',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 216, 216),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: TextField(
                  cursorHeight: 35,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add Battery capacity',
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
