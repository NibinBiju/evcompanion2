import 'dart:async';
import 'dart:convert';
// import 'dart:ui' as ui;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:evcompanion2/presentation/view/details_page/details_aoeg.dart';
import 'package:evcompanion2/presentation/view/homepage/widgets/homepage_ev_card.dart';
import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_google_places/flutter_google_places.dart' as loc;
// import 'package:google_api_headers/google_api_headers.dart' as header;
import 'package:google_maps_webservice/places.dart' as places;
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController searchController = TextEditingController();
  Location locationController = Location();
  // static const LatLng _pGooglePlex = LatLng(37.346, -122.0090);
  static const LatLng _pApplepark = LatLng(37.346, -122.0090);
  static const LatLng _destination = LatLng(10.011104, 76.343877);
  final Completer<GoogleMapController> _mapController = Completer();

  BitmapDescriptor customMarkerIcon = BitmapDescriptor.defaultMarker;

  void addCustomMarker() async {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(
              size: Size(13, 13),
            ),
            'assets/ev_location_marker.png')
        .then((icon) {
      setState(() {
        customMarkerIcon = icon;
      });
    });
  }

  LatLng? _currentP = null;

  @override
  void initState() {
    super.initState();
    addCustomMarker();
    getLocationupdaets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myappColor,
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 10,
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/evcomp.jpg'),
          ),
        ),
        title: const Text('EV Companion'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w200,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 27,
            ),
          )
        ],
      ),
      body: _currentP == null
          ? const Center(
              child: Text('Loading...'),
            )
          : Stack(
              children: [
                GoogleMap(
                  onMapCreated: (GoogleMapController mapcontroller) {
                    _mapController.complete(mapcontroller);
                  },
                  zoomControlsEnabled: false,
                  initialCameraPosition:
                      CameraPosition(target: _currentP!, zoom: 14),
                  markers: {
                    Marker(
                        markerId: const MarkerId('_currentPositon'),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _currentP!),
                    Marker(
                        markerId: const MarkerId('_destination'),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _destination,
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 200,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/charging.jpeg'),
                                              fit: BoxFit.cover)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Row(
                                            children: [
                                              Text(
                                                'Vypin Charging stations',
                                                style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.w600,
                                                  color: myappColor,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                          const Row(
                                            children: [
                                              Text(
                                                '4.3',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.orangeAccent,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.orangeAccent,
                                              )
                                            ],
                                          ),
                                          const Text(
                                              '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley'''),
                                          const SizedBox(
                                            height: 70,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return const DetailsPage();
                                              }));
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    123, 54, 179, 58),
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                border: Border.all(
                                                  width: 4,
                                                  color: myappColor,
                                                ),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Views Details',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }),
                    const Marker(
                      markerId: MarkerId('_desitinationLocation'),
                      icon: BitmapDescriptor.defaultMarker,
                      position: _pApplepark,
                    ),
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 290,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: TextField(
                              controller: searchController,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  searchPlaces();
                                }
                              },
                              style: const TextStyle(
                                fontSize: 25,
                                color: myappColor,
                                fontWeight: FontWeight.w200,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'search',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (_currentP != null && _mapController.isCompleted) {
                            _mapController.future.then((controller) {
                              controller.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: _currentP!,
                                    zoom: 14,
                                  ),
                                ),
                              );
                            });
                          }
                        },
                        child: const CircleAvatar(
                          radius: 33,
                          backgroundColor: Colors.green,
                          child: Center(
                            child: Icon(
                              Icons.gps_fixed_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CarouselSlider.builder(
                      itemCount: 1,
                      itemBuilder: (context, index, number) {
                        return HomepageCard();
                      },
                      options: CarouselOptions(aspectRatio: 60 / 40),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                )
              ],
            ),
    );
  }

  Future<void> getLocationupdaets() async {
    bool serviceEnabled;
    PermissionStatus _permissionGranted;

    serviceEnabled = await locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }
    _permissionGranted = await locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await locationController.requestPermission();
      if (_permissionGranted == PermissionStatus.granted) {
        return;
      }
    }
    locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          print(_currentP);
        });
      }
    });
  }

  void searchPlaces() async {
    places.Prediction? prediction = await loc.PlacesAutocomplete.show(
      context: context,
      apiKey: 'AIzaSyBkuIUpT3yTbQ8by32XKYuS2ggdORXhxNo',
      offset: 0,
      radius: 10000,
      strictbounds: false,
      mode: loc.Mode.overlay,
      language: "en",
      components: [places.Component(places.Component.country, "US")],
    );

    if (prediction != null) {
      final response = await http.get(
        Uri.parse(
            'https://maps.googleapis.com/maps/api/place/details/json?place_id=${prediction.placeId}&key=AIzaSyBkuIUpT3yTbQ8by32XKYuS2ggdORXhxNo'),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['status'] == 'OK') {
          final result = data['result'];
          double lat = result['geometry']['location']['lat'];
          double lng = result['geometry']['location']['lng'];
          LatLng selectedLocation = LatLng(lat, lng);

          _mapController.future.then((controller) {
            controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: selectedLocation,
                  zoom: 14,
                ),
              ),
            );
          });
          setState(() {
            _currentP = selectedLocation;
          });
        }
      }
    }
  }
}
