import 'package:evcompanion2/controller/ev_stations_service/ev_station_services.dart';
import 'package:evcompanion2/presentation/view/homepage/widgets/homepage_ev_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EvListView extends StatelessWidget {
  const EvListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var evLocationController = Provider.of<EvStationsServices>(context);
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: SingleChildScrollView(
          child: Column(
              children: List.generate(evLocationController.stationData.length,
                  (index) {
            Map<String, dynamic> data = evLocationController.stationData[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: HomepageCard(
                stationName: data['stationName'],
                location: data['location'],
                portName: data['chargingPlugs'][index]['name'],

              ),
            );
          })),
        ),
      ),
    );
  }
}
