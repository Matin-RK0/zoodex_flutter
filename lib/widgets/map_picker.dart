import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/blocs/Location_Provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zoodex/utils/theme.dart';

class MapPicker extends StatefulWidget {
  @override
  _MapPickerState createState() => _MapPickerState();
}

class _MapPickerState extends State<MapPicker> {
  late MapController _mapController;
  LatLng? _currentCenter;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  Future<void> _getCurrentLocation(LocationProvider locationProvider) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    LatLng newLocation = LatLng(position.latitude, position.longitude);
    locationProvider.updateLocation(newLocation);
    _mapController.move(newLocation, _mapController.camera.zoom);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 586,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        color: AppTheme.backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    color: AppTheme.backgroundColor,
                  ),
                ),
                Text('انتخاب موقعیت'),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close_rounded,
                  ),
                ),
              ],
            ),
            Divider(),
            Text(
              "برای مشاهده نزدیک ترین مجموعه ها ابتدا موقعیتت رو روی نقشه مشخص کن",
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 450,
              child: Consumer<LocationProvider>(
                builder: (context, locationProvider, child) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (_currentCenter == null) {
                      _currentCenter = locationProvider.selectedLocation;
                      _mapController.move(_currentCenter!, 14.0);
                    }
                  });

                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      FlutterMap(
                        mapController: _mapController,
                        options: MapOptions(
                          initialCenter: locationProvider.selectedLocation,
                          initialZoom: 14.0,
                          onMapEvent: (event) {
                            if (event is MapEventMove) {
                              _currentCenter = _mapController.camera.center;
                            }
                          },
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c'],
                          ),
                        ],
                      ),

                      // **مارکر ثابت در مرکز صفحه**
                      Positioned(
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),

                      // **دکمه‌های کنترلی**
                      Positioned(
                        bottom: 20.0,
                        left: 20.0,
                        right: 20.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white, // پس‌زمینه سفید
                                  shape: BoxShape.circle, // شکل دایره‌ای
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26, // سایه برای زیبایی
                                      blurRadius: 4,
                                      spreadRadius: 1,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () async {
                                    await _getCurrentLocation(locationProvider);
                                  },
                                  icon: Icon(Icons.my_location,
                                      color: AppTheme.primaryColor, size: 24),
                                  tooltip: "موقعیت من",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 360,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_currentCenter != null) {
                                    locationProvider
                                        .updateLocation(_currentCenter!);
                                  }
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  "تایید موقعیت",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
