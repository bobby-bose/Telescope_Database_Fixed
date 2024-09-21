import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as LatLng;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LatLng.LatLng issPosition = LatLng.LatLng(0, 0);
  final MapController _mapController = MapController();
  late bool _isDisposed;

  @override
  void initState() {
    super.initState();
    _isDisposed = false;
    moveISS(); // Start updating ISS position
  }

  void moveISS() async {
    try {
      final response =
          await http.get(Uri.parse('http://api.open-notify.org/iss-now.json'));
      if (!_isDisposed && response.statusCode == 200) {
        final data = json.decode(response.body);
        final lat = double.parse(data['iss_position']['latitude']);
        final lon = double.parse(data['iss_position']['longitude']);

        if (!_isDisposed) {
          setState(() {
            issPosition = LatLng.LatLng(lat, lon);
          });

          _mapController.move(issPosition, 2.0); // Center map to ISS position
        }
      }
    } catch (e) {
      if (!_isDisposed) {
        print('Error fetching ISS position: $e');
      }
    }

    // Update ISS position every 3 seconds
    if (!_isDisposed) {
      Future.delayed(Duration(seconds: 3), moveISS);
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ISS Location',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo.shade900,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24,
            ),
            decoration: BoxDecoration(
              color: Colors.indigo.shade700,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: issPosition,
              zoom: 2.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
                maxZoom: 4,
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 50,
                    height: 30,
                    point: issPosition,
                    child: Builder(
                      builder: (BuildContext context) => Image.asset(
                        'assets/icons/ISSIcon.png',
                        width: 50,
                        height: 30,
                      ),
                    ),
                  ),
                ],
              ),
              CircleLayer(
                circles: [
                  CircleMarker(
                    point: issPosition,
                    radius: 70,
                    color: Colors.red.withOpacity(0.25),
                    borderStrokeWidth: 1,
                    borderColor: Colors.redAccent,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
