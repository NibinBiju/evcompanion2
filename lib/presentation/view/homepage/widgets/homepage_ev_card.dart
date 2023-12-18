import 'package:flutter/material.dart';

class HomepageCard extends StatelessWidget {
  const HomepageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      borderOnForeground: false,
      surfaceTintColor: Colors.black,
      shape: Border.all(
        color: Colors.black,
        width: 4,
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
              children: [
                Text(
                  'SuperCharger station',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            const Row(
              children: [
                Text(
                  'Station Location',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //container inside card 1
                Container(
                  width: 144,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: const Color.fromARGB(255, 233, 229, 229),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: SizedBox(
                          width: 30,
                          height: 40,
                          child: Image.asset('assets/fast_charging_port.png'),
                        ),
                        title: const Text(
                          'Charger A',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: const Text(
                          'AC type 2',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Capacity:- BOKW',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),

                //container inside card 2
                Container(
                  width: 140,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: const Color.fromARGB(255, 233, 229, 229),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: SizedBox(
                          width: 30,
                          height: 40,
                          child: Image.asset('assets/ordinary_plug.png'),
                        ),
                        title: const Text(
                          'Charger B',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: const Text(
                          'CSS 2',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Capacity:- BOKW',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                      color: Colors.green,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'View station',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Text(
                      'Book charge',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
