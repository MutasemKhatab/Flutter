import 'dart:convert';

import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key, required this.onSelectLocation})
      : super(key: key);
  final void Function(PlaceLocation) onSelectLocation;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;
  bool isGittingLocation = false;

  String get locationImage {
    return "https://maps.googleapis.com/maps/api/staticmap?center=${_pickedLocation!.latitude},${_pickedLocation!.longitude}&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C${_pickedLocation!.latitude},${_pickedLocation!.longitude}&key=AIzaSyDLcwxUggpPZo8lcbH0TB4Crq5SJjtj4ag";
  }

  void _savePlace(double latitude, double longtude) async {
    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longtude&key=AIzaSyDLcwxUggpPZo8lcbH0TB4Crq5SJjtj4ag");
    final respone = await http.get(url);
    final responseData = json.decode(respone.body);
    final address = responseData['results'][0]['formatted_address'];
    setState(() {
      _pickedLocation = PlaceLocation(
          latitude: latitude, longitude: longtude, address: address);
      widget.onSelectLocation(_pickedLocation!);
      isGittingLocation = false;
    });
  }

  void _getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      isGittingLocation = true;
    });
    locationData = await location.getLocation();
    final ltd = locationData.latitude;
    final lgt = locationData.longitude;
    if (ltd == null || lgt == null) return;
    _savePlace(ltd, lgt);
  }

  void _selectOnMap() async {
    final pickedLocation =
        await Navigator.of(context).push<LatLng>(MaterialPageRoute(
      builder: (context) => const MapScreen(),
    ));
    if (pickedLocation == null) return;
    _savePlace(pickedLocation.latitude, pickedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Text(
      "no location selected yet...",
      style: TextStyle(color: Colors.white),
    );
    if (isGittingLocation) {
      content = const CircularProgressIndicator();
    }
    if (_pickedLocation != null) {
      content = Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 170,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.2))),
          child: content,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
                icon: const Icon(Icons.location_on),
                onPressed: _getLocation,
                label: const Text('Get current location')),
            TextButton.icon(
                icon: const Icon(Icons.map),
                onPressed: _selectOnMap,
                label: const Text('Select on map'))
          ],
        )
      ],
    );
  }
}
