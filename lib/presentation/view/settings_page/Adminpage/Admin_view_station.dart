import 'package:evcompanion2/controller/ev_stations_service/ev_station_services.dart';
import 'package:flutter/material.dart';

class StationDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/juice-cBHAhaGK_zU-unsplash.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            StationDetailsList(),
            Positioned(
              top: 30,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StationDetailsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: EvStationsServices().stationData.length,
      itemBuilder: (context, index) {
        final station = EvStationsServices().stationData[index];
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white
            ),
            child: ListTile(
              title: Text(station['stationName'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              subtitle: Text(station['location'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StationDetailsPageView(station: station),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}


class StationDetailsPageView extends StatelessWidget {
  final Map<String, dynamic> station;

  StationDetailsPageView({required this.station});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(station['stationName'],
        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(station['image'],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,),
              SizedBox(height: 16.0),
              Text('Location: ${station['location']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              Text('Charging Type: ${station['chargingType']['name']}'),
              Text('Address: ${station['address']}'),
                SizedBox(height: 20,),
              Text('Charging Plugs:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              for (var plug in station['chargingPlugs'])
                ListTile(
                  title: Text(plug['name']),
                  subtitle: Text('Status: ${plug['status']}'),
                ),
        
              Text('Amenities:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              for (var amenity in station['amenities'])
                ListTile(
                  title: Text(amenity['name']),
                  leading: Image.asset(
                    amenity['image'],
                    height: 24.0,
                    width: 24.0,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
