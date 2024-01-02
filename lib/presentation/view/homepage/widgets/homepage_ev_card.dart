import 'package:evcompanion2/controller/favorite_controller/f_controller.dart';
import 'package:evcompanion2/model/favorite_model.dart';
import 'package:evcompanion2/presentation/view/details_page/details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../booking_page/booking_page.dart';
import '../../settings_page/my_favourite.dart';

class HomepageCard extends StatefulWidget {
   static final List<HomepageCard>favoritesList=[];
  const HomepageCard({
    super.key,
    required this.stationName, required this.location, required this.portName,
  });

  final String stationName;
  final String location;
  final String portName;

  @override
  State<HomepageCard> createState() => _HomepageCardState();
}

class _HomepageCardState extends State<HomepageCard> {
  bool addtoFavorite=false;
  FavoriteController favoriteController=FavoriteController();

  
  @override
  Widget build(BuildContext context) {
    var favContro=Provider.of<FavoriteController>(context);

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
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      widget.stationName,
                      style:const TextStyle(
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
                      style:const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              child:
                                  Image.asset('assets/fast_charging_port.png'),
                            ),
                            title:  Text(
                              widget.portName,
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //view station button
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const DetailsPage();
                        }));
                      },
                      child: Container(
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
                    ),

                    //book station button
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const BookingPage();
                        }));
                      },
                      child: Container(
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
                    ),
                  ],
                )
              ],
            ),

            //button for add to favorite
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
if(favContro.favoriteList.any((element) => element.stationName==widget.stationName)){
    return;
}else{
favContro.addToFav(FavoriteModel(stationName: widget.stationName, location:widget.location));
}
                     
                    },
                    icon:  Icon(
                      // Icons.favorite_outline,
                      // color: Colors.green,
                      addtoFavorite? Icons.favorite:Icons.favorite_outline,
                      color: addtoFavorite?Colors.green:Colors.green,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
