import 'package:evcompanion2/presentation/payment/payment_details.dart';
import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';

class RoadMap extends StatefulWidget {
  const RoadMap({super.key});

  @override
  State<RoadMap> createState() => _RoadMapState();
}

class _RoadMapState extends State<RoadMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(backgroundImage: AssetImage("assets/evcomp.jpg")),
      ),
      title: Text("Payment",style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,fontSize: 21
      ),),
      backgroundColor: myappColor,
     ),
     body: Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 90,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Row(
                    children: [
                      Image.asset("assets/gpay.jpg")
                    ],
                  ),
              ),
            );
          }),
        )
      ]),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentDetails()));
      },
       backgroundColor: Colors.blue,
      child: Icon(Icons.add,color: Colors.white,)
      ),
    );
  }
}
