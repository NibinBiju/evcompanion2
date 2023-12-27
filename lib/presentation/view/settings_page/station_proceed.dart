import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StationProceed extends StatelessWidget {
  const StationProceed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 50,),
              CircularPercentIndicator(
                radius: 90.0,
                lineWidth: 10.0,
                percent: 0.8,
                center: Text("80%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                progressColor: Colors.green,
              ),
              SizedBox(height: 20), 
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                       color: Color.fromARGB(255, 239, 237, 237),
                      borderRadius: BorderRadius.circular(10),
                    ),
                      height: 70,
                      width: 160,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              'Time left',
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),
                            ),
                            SizedBox(height: 10,),
                            Text("45 min",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20), 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                     decoration: BoxDecoration(
                       color: Color.fromARGB(255, 239, 237, 237),
                      borderRadius: BorderRadius.circular(10),
                    ),
                      height: 70,
                      width: 160,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              'Time left',
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),
                            ),
                            SizedBox(height: 10,),
                            Text("45 min",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                       color: Color.fromARGB(255, 239, 237, 237),
                      borderRadius: BorderRadius.circular(10),
                    ),
                      height: 70,
                      width: 160,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              'Energy deliver',
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),
                            ),
                            SizedBox(height: 10,),
                            Text("15.5 KWH",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20), 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                     decoration: BoxDecoration(
                       color: Color.fromARGB(255, 239, 237, 237),
                      borderRadius: BorderRadius.circular(10),
                    ),
                      height: 70,
                      width: 160,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              'Charging ID',
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),
                            ),
                            SizedBox(height: 10,),
                            Text("125871",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Charging fees",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                    
                    Text("15.00",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),)
                  ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Idle fees",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                    
                    Text("00.00",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),)
                  ],
                  ),
                  SizedBox(height: 10,),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                    
                    Text("15",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),)
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
          SizedBox(height: 30,),
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
                      child: Text("Start charging",
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
      ),
    );
  }
}
