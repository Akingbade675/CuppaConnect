import 'dart:async';

import 'package:coffee_shop_app/src/components/app_icon_button.dart';
import 'package:coffee_shop_app/src/components/app_text.dart';
import 'package:coffee_shop_app/src/constants/constants.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/delivery/components/map_bottom_sheet.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  Location location = Location();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final destination = const LatLng(6.6105832, 3.3708609);
  final source = const LatLng(6.6195932, 3.3728609);

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  LocationData? _locationData;

  List<LatLng> polylineCoordinates = [];
  PolylineResult result = PolylineResult();

  Set<Marker> markers = {};

  Future<dynamic> _getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    return await location.getLocation();
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    result = await polylinePoints.getRouteBetweenCoordinates(
      GOOGLE_MAPS_API_KEY,
      PointLatLng(source.latitude, source.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    print(
        'Duration: ${result.duration}. Distance: ${result.distance}. StartAddress: ${result.startAddress}. EndAddress: ${result.endAddress}');
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }

      setState(() {});
    }
  }

  _generateMarkers() async {
    final sourceIcon, destinationIcon;
    [sourceIcon, destinationIcon] = await Future.wait(
      [
        BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(),
          AppIcons.bikeMarker,
        ),
        BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(),
          AppIcons.pin,
        ),
      ],
    );

    markers = {
      Marker(
        markerId: const MarkerId('destination'),
        position: source,
        icon: destinationIcon,
        infoWindow: const InfoWindow(
            title: 'Destination', snippet: 'Magodo Ikeja, Ikosi Ketu'),
      ),
      Marker(
        markerId: const MarkerId('source'),
        position: source,
        infoWindow: const InfoWindow(title: 'Source'),
        icon: sourceIcon,
      ),
    };
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _generateMarkers();
    getPolyPoints();
    // _getLocation().then((locationData) {
    //   print(locationData);
    //   setState(() {
    //     _locationData = locationData;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: source,
              zoom: 16,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            polylines: {
              Polyline(
                polylineId: const PolylineId('polyline'),
                color: AppColors.brown,
                width: 4,
                points: polylineCoordinates,
              ),
            },
            markers: markers,
          ),
          Positioned(
            top: 40,
            left: 30,
            right: 30,
            child: Row(
              children: [
                AppIconButton(
                  iconPath: AppIcons.arrowLeft,
                  size: 44.w,
                  iconSize: 24,
                  color: Colors.white,
                  iconColor: Colors.black,
                  padding: 12,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFE4E4E4),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                  onPressed: () => context.pop(),
                ),
                const Spacer(),
                AppIconButton(
                  iconPath: AppIcons.gps,
                  size: 44.w,
                  iconSize: 24,
                  padding: 12,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFE4E4E4),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: Colors.white,
                  iconColor: Colors.black,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: MapBottomSheet(result: result),
          ),
        ],
      ),
    );
  }
}
