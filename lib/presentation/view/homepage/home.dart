import 'dart:async';
import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Location locationController = Location();
  static const LatLng _pGooglePlex = LatLng(37.346, -122.0090);
  static const LatLng _pApplepark = LatLng(37.346, -122.0090);
  static const LatLng _destination = LatLng(10.011104, 76.343877);
  final Completer<GoogleMapController> _mapController = Completer();

  late BitmapDescriptor customMarkerIcon;
  Future<void> _loadCustomMarker() async {
    final ByteData data = await rootBundle.load('assets/profile.jpg');
    final Uint8List byteData = data.buffer.asUint8List();
    customMarkerIcon = BitmapDescriptor.fromBytes(byteData);
  }

  LatLng? _currentP = null;

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
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
                    const Marker(
                        markerId: MarkerId('_destination'),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _destination),
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
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 25,
                                color: myappColor,
                                fontWeight: FontWeight.w200,
                              ),
                              decoration: InputDecoration(
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
                          backgroundColor: Colors.white,
                          child: Center(
                            child: Icon(
                              Icons.gps_fixed_outlined,
                              color: myappColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
}
