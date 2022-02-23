import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sonocare_partner2/controller/map_controller.dart';
import 'package:sonocare_partner2/util/app_constants.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';

//const LatLng SOURCE_LOCATION = LatLng(9.19497455726949, 12.461157348341885);
//const LatLng DEST_LOCATION = LatLng(9.21406397684134, 12.488736896453696);
const double CAMERA_ZOOM = 18;
const double CAMERA_TILT = 90;
const double CAMERA_BEARING = 30;
const double PIN_VISIBLE_POSITION = 40;
const double PIN_INVISIBLE_POSITION = -220;

class MapPage extends StatefulWidget {
  LatLng source_location;
  LatLng destination_location;
  String icon;
  MapPage({Key? key, required this.source_location, required this.destination_location, required this.icon}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  bool loadingMap = false;
  String loadingMapText = 'Loading Map...';

  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController xController;
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  Set<Marker> _markers = Set<Marker>();
  double pinPillPosition = PIN_VISIBLE_POSITION;
  late LatLng currentLocation;
  late LatLng destinationLocation;
  bool userBadgeSelected = false;

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;

  Future<Uint8List?> getBytesFromAsset({required String path,required int width})async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(),
        targetWidth: width
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(
        format: ui.ImageByteFormat.png))
        ?.buffer.asUint8List();
  }

  @override
  void initState() {
    super.initState();

    polylinePoints = PolylinePoints();

    // set up initial locations
    this.setInitialLocation();
  }

  double coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void setSourceAndDestinationMarkerIcons(BuildContext context) async {

    sourceIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.0),
        'assets/image/you_drop_icon.png'
    );
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 10.0),
        //Images.main_logo_sm
        widget.icon=='ambulance'?'assets/image/ambulance_drop_icon.png':widget.icon=='delivery'?'assets/image/delivery_drop_icon.png':'assets/image/nurse_drop_icon.png'
        //widget.icon
    );
  }

  void setInitialLocation() {
    currentLocation = LatLng(
        widget.source_location.latitude,
        widget.source_location.longitude
    );

    destinationLocation = LatLng(
        widget.destination_location.latitude,
        widget.destination_location.longitude
    );
  }

  @override
  Widget build(BuildContext context) {

    setSourceAndDestinationMarkerIcons(context);

    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: widget.source_location
    );

    return Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: GoogleMap(
                myLocationEnabled: true,
                compassEnabled: false,
                tiltGesturesEnabled: false,
                polylines: _polylines,
                markers: _markers,
                mapType: MapType.normal,
                initialCameraPosition: initialCameraPosition,
                onTap: (LatLng loc) {
                  setState(() {
                    this.pinPillPosition = PIN_INVISIBLE_POSITION;
                    this.userBadgeSelected = false;
                  });
                },
                onMapCreated: _onMapCreated
              ),
            ),
            if(loadingMap)
            Container(
              color: ColorResources.COLOR_WHITE,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(loadingMapText, style: const TextStyle(color: Colors.black, fontSize: 20, letterSpacing: 1.2),),
              ],
            )],),)
          ],
        )
    );
  }

  Future<void> showPinsOnMap() async {
    setState(() {
      _markers.add(Marker(
          markerId: const MarkerId('sourcePin'),
          position: currentLocation,
          icon: sourceIcon,
          onTap: () {
            setState(() {
              this.userBadgeSelected = true;
            });
          }
      ));

      _markers.add(Marker(
          markerId: const MarkerId('destinationPin'),
          position: destinationLocation,
          icon: destinationIcon,
          onTap: () {
            setState(() {
              this.pinPillPosition = PIN_VISIBLE_POSITION;
            });
          }
      ));
    });
    /*
    LatLngBounds bound = LatLngBounds(southwest: currentLocation, northeast: destinationLocation);
    CameraUpdate u2 = CameraUpdate.newLatLngBounds(bound, 50);
    _controller.animateCamera(u2).then((void v){
      check(u2,_controller);
    });*/

  }

  Future<bool> setPolylines() async {
    setState(() {
      loadingMap=true;
    });
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        AppConstants.MAP_API_KEY,
        PointLatLng(
            currentLocation.latitude,
            currentLocation.longitude
        ),
        PointLatLng(
            destinationLocation.latitude,
            destinationLocation.longitude
        )
    );

    print('-----------------');
    print(result.status);
    print('-----------------');
    if (result.status == 'OK') {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      _calculateDistance(result.points);

      setState(() {
        _polylines.add(
            Polyline(
                width: 6,
                polylineId: const PolylineId('polyLine'),
                color: const Color(0xffC92A2A),
                points: polylineCoordinates
            )
        );
        loadingMap=false;
      });
    }else{
      setState(() {
        loadingMapText='Your map failed to load';
      });
    }
    return true;
  }

  void _onMapCreated(GoogleMapController controller) async {
    setState(() {
      xController = controller;
      showPinsOnMap();
      setPolylines().then((_) => _setMapFitToTour(_polylines));
    });
  }
  void _setMapFitToTour(Set<Polyline> p) {
    double minLat = p.first.points.first.latitude;
    double minLong = p.first.points.first.longitude;
    double maxLat = p.first.points.first.latitude;
    double maxLong = p.first.points.first.longitude;

    double totalDistance = 0.0;

    p.forEach((poly) {
      poly.points.forEach((point) {
        if (point.latitude < minLat) minLat = point.latitude;
        if (point.latitude > maxLat) maxLat = point.latitude;
        if (point.longitude < minLong) minLong = point.longitude;
        if (point.longitude > maxLong) maxLong = point.longitude;
      });
    });
    xController.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            southwest: LatLng(minLat, minLong),
            northeast: LatLng(maxLat, maxLong)),
        30));
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<void> _calculateDistance(List<PointLatLng> points) async {
    double totalDistance = 0.0;

    for (int i = 0; i < points.length - 1; i++) {
      totalDistance += _coordinateDistance(
        polylineCoordinates[i].latitude,
        polylineCoordinates[i].longitude,
        polylineCoordinates[i + 1].latitude,
        polylineCoordinates[i + 1].longitude,
      );
    }
    print('-----0qwas');
    print(totalDistance.ceilToDouble());
    String totalSTR = totalDistance.ceilToDouble().toString();
    await Get.find<MapController>().setDistance(distance: totalSTR);
  }
}