import 'package:favourite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen(
      {Key? key,
      this.location = const PlaceLocation(
          latitude: 37.422, longitude: -122.084, address: 'Google Office'),
      this.isSelecting = true})
      : super(key: key);
  final PlaceLocation location;
  final bool isSelecting;
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _location;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'Pick your locating' : 'Your location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop<LatLng>(_location);
                },
                icon: const Icon(Icons.save))
        ],
      ),
      body: GoogleMap(
        onTap: !widget.isSelecting
            ? null
            : (argument) {
                setState(() {
                  _location = argument;
                });
              },
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.location.latitude,
            widget.location.longitude,
          ),
          zoom: 16,
        ),
        markers: (_location == null && widget.isSelecting)
            ? {}
            : {
                Marker(
                    markerId: const MarkerId('m1'),
                    position: _location ??
                        LatLng(
                          widget.location.latitude,
                          widget.location.longitude,
                        ))
              },
      ),
    );
  }
}
