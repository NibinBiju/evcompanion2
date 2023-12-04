import 'package:evcompanion2/presentation/view/my_vehicle_page/add_vehicle_page.dart';
import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyVehicle extends StatefulWidget {
  const MyVehicle({super.key});

  @override
  State<MyVehicle> createState() => _MyVehicleState();
}

class _MyVehicleState extends State<MyVehicle> {
  // String name = 'Tesla';
  // String type = 'type3';
  // String image = "assets/tesla.jpg";
  // String ccs = 'ccs2';
  // void navigate() {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => AddVehicle()));
  // }

  Future<void> fetchData() async {
    var uri = Uri.parse('http://127.0.0.1:8000/api/addVehicle/');
    var response = await http.get(uri);
    print(response.statusCode);
    print(response.body);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: const Text(
          'My Vehicle',
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
            )),
      ),

      //add button
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (cnt) {
            return const AddVehiclePage();
          }));
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black87,
                  blurRadius: 2,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: myappColor,
                width: 4,
              ),
            ),
            child: const Center(
              child: Text(
                'Add New Vehicle',
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
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            1,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: Colors.black,
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: myappColor,
                      width: 3,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('assets/tesla.jpg')),
                              borderRadius: BorderRadius.circular(19),
                              border: Border.all(
                                color: myappColor,
                                width: 3,
                              )),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Model',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Company name',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'UID',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Battery capacity',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '100',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
