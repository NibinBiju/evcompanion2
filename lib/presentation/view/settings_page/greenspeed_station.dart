import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'station_proceed.dart';

class Greenspeed extends StatefulWidget {
  @override
  _GreenspeedState createState() => _GreenspeedState();
}

class _GreenspeedState extends State<Greenspeed> {
  double _value = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greenspeed station',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                        color: Color.fromARGB(255, 239, 237, 237),
                        borderRadius: BorderRadius.circular(10),
                      ),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Text("How much time you need to change the vehicle?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black)),
                      SfSlider(
                        min: 0.0,
                        max: 10.0,
                        value: _value,
                        showTicks: true,
                        showLabels: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                       SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Price Estimation",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                      Text('${_value.round()*150}')
                            ],
                    ),
                    ],
                  ),
                  
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Charge required",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
                      
                      Text("Charger type",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),)
                    ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("12 Units",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                      
                      Text("AC Type-2",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),)
                    ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Location",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
                      
                      Text("Charging slot",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),)
                    ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("4517 Washington Ave",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                      
                      Text("A-2",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),)
                    ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Manchester,Kentucky 39495",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),                    
                    ],
                    ),
                  ],
                ),
                width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                         color: Color.fromARGB(255, 239, 237, 237),
                        borderRadius: BorderRadius.circular(10),
                      ),
              ),
            ),
            SizedBox(height: 300),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                 onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StationProceed()));
                },
                child: Container(
                  width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:Center(
                        child: Text("Proceed",
                        style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,
                        ),
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
