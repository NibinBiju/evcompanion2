import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class RouteMapPage extends StatefulWidget {
  final double destinationLatitude;
  final double destinationLongitude;

  RouteMapPage({required this.destinationLatitude, required this.destinationLongitude});

  @override
  _RouteMapPageState createState() => _RouteMapPageState();
}

class _RouteMapPageState extends State<RouteMapPage> {
  late GoogleMapController mapController;
  Set<Marker> markers = Set();
  Set<Polyline> polylines = Set();

  @override
  void initState() {
    super.initState();
    _addMarker();
    _getPolyline();
  }

  void _addMarker() {
    markers.add(Marker(
      markerId: MarkerId('destination'),
      position: LatLng(widget.destinationLatitude, widget.destinationLongitude),
      infoWindow: InfoWindow(title: 'Destination'),
    ));
  }

  void _getPolyline() async {
    PolylinePoints polylinePoints = PolylinePoints();
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'YOUR_GOOGLE_MAPS_API_KEY', // Replace with your API key
      PointLatLng(widget.destinationLatitude, widget.destinationLongitude),
      PointLatLng(9.931233, 76.267303),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {
      polylines.add(Polyline(
        polylineId: PolylineId('route'),
        color: Colors.blue,
        width: 5,
        points: polylineCoordinates,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route to Station'),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.destinationLatitude, widget.destinationLongitude),
          zoom: 12.0,
        ),
        markers: markers,
        polylines: polylines,
      ),
    );
  }
}
