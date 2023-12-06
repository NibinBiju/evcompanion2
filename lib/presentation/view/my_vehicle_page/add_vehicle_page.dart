import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';

class AddVehiclePage extends StatelessWidget {
  AddVehiclePage({super.key});
  final TextEditingController _modelNameController = TextEditingController();
  final TextEditingController _brandNameController = TextEditingController();
  final TextEditingController _uidNumberController = TextEditingController();
  final TextEditingController _betteryCapacityController =
      TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Text(
                    'Vehicle Details',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //add vehicle image
              const Row(
                children: [
                  Text(
                    'Vehicle Image',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 216, 216, 216),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //add vehicle name
              const Row(
                children: [
                  Text(
                    'Vehicle Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 216, 216, 216),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: TextField(
                    // controller: ,
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
              const Row(
                children: [
                  Text(
                    'Company Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
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
              const Row(
                children: [
                  Text(
                    'Add UID Number',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
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
                      hintText: 'Add UID Number',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //add battery capacity
              const Row(
                children: [
                  Text(
                    'Add Battery capacity',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
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
              const SizedBox(
                width: double.infinity,
                height: 150,
              )
            ],
          ),
        ),
      ),
    );
  }
}
