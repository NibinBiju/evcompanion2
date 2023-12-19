import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

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
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 216, 216, 216),
                      borderRadius: BorderRadius.circular(10),
                    ),
                child: SfSlider(
                  min: 0.0,
                  max: 100.0,
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
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                       color: const Color.fromARGB(255, 216, 216, 216),
                      borderRadius: BorderRadius.circular(10),
                    ),
            ),
          ),
          SizedBox(height: 300),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
        ],
      ),
    );
  }
}
