import 'dart:io';

import 'package:evcompanion2/controller/add_vehicle_controller/add_vehicle_provider.dart';
import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final TextEditingController _modelNameController = TextEditingController();
  final TextEditingController _brandNameController = TextEditingController();
  final TextEditingController _uidNumberController = TextEditingController();
  final TextEditingController _betteryCapacityController =
      TextEditingController();

  XFile? _image;
 
  Future<void> pickImage() async {
     final ImagePicker _picker=ImagePicker();
    final XFile? pickedFile=await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image=pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    var addVehicleProvider = Provider.of<AddVehicleProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: InkWell(
        onTap: () {
          addVehicleProvider.addVehiclePostData(
              uid: _uidNumberController.text,
              make: _brandNameController.text,
              model: _modelNameController.text,
              year: '2023',
              batteryCapacity: _betteryCapacityController.text,
              chargingTime: '45',
              vehicleImage: 'vehicleImage');
        },
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  _image == null
                  ? Text('Please select an image')
                : Image.file(File(_image!.path)),
                      IconButton(
                      onPressed: () async{
                      await  pickImage();
                      },
                        icon: Icon(Icons.add),
                    ),
                    ],
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
                child: Center(
                  child: TextField(
                    controller: _modelNameController,
                    cursorHeight: 35,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
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
                child: Center(
                  child: TextField(
                    controller: _brandNameController,
                    cursorHeight: 35,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add brand name',
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
                child: Center(
                  child: TextField(
                    controller: _betteryCapacityController,
                    cursorHeight: 35,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
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
