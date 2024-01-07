import 'dart:typed_data';
import 'package:evcompanion2/presentation/view/settings_page/greenspeed_station.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Battery extends StatelessWidget {
  const Battery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR code', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
      centerTitle: true,
      ),
    
      body: Column(
       // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Text("Scan the QR code of the Charger to start charging",
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),
          Container(
            width: 200,
            height: 200,
            color: Colors.black,
            child: MobileScanner(
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                final Uint8List? image = capture.image;
                for (final barcode in barcodes) {
                  debugPrint('Barcode found! ${barcode.rawValue}');
                }
              },
            ),
            
          ),
          SizedBox(height: 20,),
          Divider(),
          SizedBox(height: 20,),
          Text("Enter charger id", style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold,color: Colors.grey)),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(hintText: "Enter charger ",
              border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Greenspeed()));
              },
              child: Container(
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("Proceed",
                  
                  style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,
                  ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  }