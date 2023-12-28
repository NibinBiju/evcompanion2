class ChargingPlug {
  final String name;
  final String status;
  final String capacity;
  final String image;

  ChargingPlug({
    required this.name,
    required this.status,
    required this.capacity,
    required this.image,
  });
}

class ChargingType {
  final String name;
  final String description;

  ChargingType({
    required this.name,
    required this.description,
  });
}


class ChargingStation {
  final String stationName;
  final String location;
  final double latitude;
  final double longitude;
  final ChargingType chargingType;
  final List<ChargingPlug> chargingPlugs;
  final List<Map<String, String>> amenities;
  final double parkingFee;
  final double costPerHour;
  final String address;
  final String image;

  ChargingStation({
    required this.stationName,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.chargingType,
    required this.chargingPlugs,
    required this.amenities,
    required this.parkingFee,
    required this.costPerHour,
    required this.address,
    required this.image,
  });
}