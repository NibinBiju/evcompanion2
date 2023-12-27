import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:evcompanion2/controller/ev_stations_service/ev_station_services.dart';
import 'package:evcompanion2/presentation/view/homepage/widgets/homepage_ev_card.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    var evLocationController = Provider.of<EvStationsServices>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CarouselSlider.builder(
          itemCount: evLocationController.stationData.length,
          itemBuilder: (context, index, number) {
            Map<String, dynamic> data = evLocationController.stationData[index];

            return HomepageCard(
              stationName: data['stationName'],
              location: data['location'],
            );
          },
          options: CarouselOptions(
            aspectRatio: 60 / 40,
            onPageChanged: (index, reason) {
              var evLocations = evLocationController.stationData[index];
              print(
                  "Latitude: ${evLocations["latitude"]}, Longitude: ${evLocations["longitude"]}");
              double latitude = evLocations["latitude"];
              double longitude = evLocations["longitude"];

              _mapController.future.then((controller) {
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(latitude, longitude),
                      zoom: 14,
                    ),
                  ),
                );
              });
            },
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
