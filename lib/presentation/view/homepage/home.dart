import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/mapview.jpg'), fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 60,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(71, 0, 0, 0),
                              blurStyle: BlurStyle.solid,
                              blurRadius: 4,
                              spreadRadius: 2),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 248, 248, 248),
                      ),
                      // width: MediaQuery.of(context).size.width / 1.3,
                      width: 277,
                      height: 70,
                      child: const Center(
                        //search field
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'City',
                              hintTextDirection: TextDirection.ltr,
                              hintStyle: TextStyle(
                                fontSize: 23,
                                color: Colors.grey,
                              )),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        //search filter
                        Container(
                          width: 73,
                          height: 73,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(71, 0, 0, 0),
                                  blurStyle: BlurStyle.solid,
                                  blurRadius: 4,
                                  spreadRadius: 2),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.filter_alt_outlined,
                              size: 32,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //location
                        Container(
                          width: 73,
                          height: 73,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(71, 0, 0, 0),
                                  blurStyle: BlurStyle.solid,
                                  blurRadius: 4,
                                  spreadRadius: 2),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.location_searching_rounded,
                              size: 32,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 73,
                          height: 73,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(71, 0, 0, 0),
                                  blurStyle: BlurStyle.solid,
                                  blurRadius: 4,
                                  spreadRadius: 2),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.verified_sharp,
                              size: 32,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              top: 300,
              left: 140,
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (cnt) {
                        return Container(
                          height: 400,
                          color: Colors.amber,
                        );
                      });
                },
                icon: const Icon(
                  Icons.location_on,
                  color: myappColor,
                  size: 42,
                ),
              ))
        ],
      ),
    );
  }
}
