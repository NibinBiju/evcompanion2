import 'package:evcompanion2/presentation/view/settings_page/Adminpage/stationstate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evcompanion2/controller/favorite_controller/f_controller.dart';
import 'package:evcompanion2/model/favorite_model.dart';
import 'package:evcompanion2/presentation/view/details_page/details_page.dart';
import '../../booking_page/booking_page.dart';

class HomepageCard extends StatefulWidget {
  static final List<HomepageCard> favoritesList = [];
  const HomepageCard({
    Key? key,
    required this.stationName,
    required this.location,
    required this.portName,
    required this.index,
    required this.amenities,
    required this.pricePerHr,
    required this.image,
  });

  final String stationName;
  final String location;
  final String pricePerHr;
  final List<Map<String, dynamic>> portName;
  final int index;
  final List<Map<String, dynamic>> amenities;
  final String image;

  @override
  State<HomepageCard> createState() => _HomepageCardState();
}

class _HomepageCardState extends State<HomepageCard> {
  bool addtoFavorite = false;
  FavoriteController favoriteController = FavoriteController();

  @override
  Widget build(BuildContext context) {
    var favContro = Provider.of<FavoriteController>(context);
    var stationState = Provider.of<StationState>(context);

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
        width: 380,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      widget.stationName,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      widget.location,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(widget.portName.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        width: 130,
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
                                child: Image.asset(widget.portName[index]['image']),
                              ),
                              title: Text(
                                widget.portName[index]['name'],
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                              ),
                              subtitle: Text(
                                widget.portName[index]['acType'].toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Capacity:- ${widget.portName[index]['capacity']}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // View station button
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              stationName: widget.stationName,
                              location: widget.location,
                              amenities: widget.amenities,
                              pricePerHr: widget.pricePerHr,
                              portName: widget.portName,
                              image: widget.image,
                            ),
                          ),
                        );
                      },
                      child: Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                              color: Colors.green,
                            ),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'View station',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Book charge button
                    GestureDetector(
                      onTap: () {
                        if (stationState.stationData[widget.index]['stationState'] != 'Not Available') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return BookingPage(
                                location: widget.location,
                                stationName: widget.stationName,
                              );
                            }),
                          );
                        }
                      },
                        child: Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Colors.green,
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Book charge',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                   // ),
                  ],
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    if (favContro.favoriteList.any((element) => element.stationName == widget.stationName)) {
                      return;
                    } else {
                      favContro.addToFav(FavoriteModel(
                        stationName: widget.stationName,
                        location: widget.location,
                      ));
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: favContro.favoriteList.any((element) =>
                            element.stationName == widget.stationName)
                        ? Colors.green
                        : const Color.fromARGB(255, 226, 226, 226),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
