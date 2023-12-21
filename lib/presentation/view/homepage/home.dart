import 'dart:async';
import 'dart:convert';
import 'package:evcompanion2/presentation/view/homepage/widgets/ev_list_view.dart';
import 'package:evcompanion2/presentation/view/homepage/widgets/ev_map_view.dart';
import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_google_places/flutter_google_places.dart' as loc;
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

  bool viewCategoryCheck = true;
  List viewCategoryPages = [
    MapView(),
    EvListView(),
  ];
  int pageViewCategoryIndex = 0;

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
                viewCategoryCheck
                    ? GoogleMap(
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
                              onTap: () {}),
                          const Marker(
                            markerId: MarkerId('_desitinationLocation'),
                            icon: BitmapDescriptor.defaultMarker,
                            position: _pApplepark,
                          ),
                        },
                      )
                    : Container(),

                //view category
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  viewCategoryCheck = !viewCategoryCheck;
                                  pageViewCategoryIndex = 0;
                                });
                              },
                              child: Container(
                                width: 70,
                                height: 40,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurStyle: BlurStyle.outer,
                                      blurRadius: 2,
                                    )
                                  ],
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(13),
                                    bottomLeft: Radius.circular(13),
                                  ),
                                  color: viewCategoryCheck
                                      ? Colors.green
                                      : Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    'Mapview',
                                    style: TextStyle(
                                      color: viewCategoryCheck
                                          ? Colors.white
                                          : Colors.green,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  viewCategoryCheck = !viewCategoryCheck;
                                  pageViewCategoryIndex = 1;
                                });
                              },
                              child: Container(
                                width: 70,
                                height: 40,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black,
                                        blurStyle: BlurStyle.outer,
                                        blurRadius: 2,
                                      )
                                    ],
                                    color: viewCategoryCheck
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(13),
                                      topRight: Radius.circular(13),
                                    )),
                                child: Center(
                                  child: Text(
                                    'Listview',
                                    style: TextStyle(
                                      color: viewCategoryCheck
                                          ? Colors.green
                                          : Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //search bar
                    viewCategoryCheck
                        ? Padding(
                            padding: const EdgeInsets.all(13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 290,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 2,
                                          color: Colors.black,
                                        ),
                                        BoxShadow(
                                          color: Colors.black,
                                        ),
                                        BoxShadow(
                                          color: Colors.black,
                                        ),
                                      ]),
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
                                          fontWeight: FontWeight.w400,
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
                                    if (_currentP != null &&
                                        _mapController.isCompleted) {
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
                                  child: Column(
                                    children: [
                                      const CircleAvatar(
                                        radius: 33,
                                        backgroundColor: Colors.green,
                                        child: Center(
                                          child: Icon(
                                            Icons.gps_fixed_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.green,
                                        child: Center(
                                          child: IconButton(onPressed: (){},
                                           icon: Icon(Icons.format_align_center_outlined,
                                           color: Colors.white,)),
                                        ),
                                      )
                                    ],
                                  ),

                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
                //list of pages in home

                viewCategoryPages[pageViewCategoryIndex],
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
