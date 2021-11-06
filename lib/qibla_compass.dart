import 'dart:async';
import 'dart:math' show pi;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islam_app/global.dart';

import 'package:islam_app/loading_error_widget.dart';

class QiblaCompass extends StatefulWidget {
  @override
  _QiblaCompassState createState() => _QiblaCompassState();
}

class _QiblaCompassState extends State<QiblaCompass> {
  final _locationStreamController =
  StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return CupertinoActivityIndicator();
          if (snapshot.data.enabled == true) {
            switch (snapshot.data.status) {
              case LocationPermission.always:
              case LocationPermission.whileInUse:
                return QiblahCompassWidget();

              case LocationPermission.denied:
                return LocationErrorWidget(
                  error: "Location service permission denied",
                  callback: _checkLocationStatus,
                );
              case LocationPermission.deniedForever:
                return LocationErrorWidget(
                  error: "Location service Denied Forever !",
                  callback: _checkLocationStatus,
                );
            // case GeolocationStatus.unknown:
            //   return LocationErrorWidget(
            //     error: "Unknown Location service error",
            //     callback: _checkLocationStatus,
            //   );
              default:
                return Container();
            }
          } else {
            return LocationErrorWidget(
              error: "Please enable Location service",
              callback: _checkLocationStatus,
            );
          }
        },
      ),
    );
  }

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else
      _locationStreamController.sink.add(locationStatus);
  }

  @override
  void dispose() {
    super.dispose();
    _locationStreamController.close();
    FlutterQiblah().dispose();
  }
}

class QiblahCompassWidget extends StatelessWidget {
  final _kaabaSvg = SvgPicture.asset('assets/qibla.png');

  @override
  Widget build(BuildContext context) {
    var _platformBrightness = Theme.of(context).brightness;
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return CupertinoActivityIndicator();

        final qiblahDirection = snapshot.data;
        var _angle = ((qiblahDirection.qiblah ?? 0) * (pi / 180) * -1);

        // if (_angle < 5 && _angle > -5) print('IN RANGE');

        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Transform.rotate(
              angle:_angle,
              child: SvgPicture.asset('assets/5.svg', // compass
                  color: _platformBrightness == Brightness.dark
                      ? Colors.black
                      : Colors.black),
            ),
            _kaabaSvg,
            Image.asset('assets/qibla3D.png',
                width: 150.0, height: 150.0,//needle
                /*color: _platformBrightness == Brightness.dark
                    ? Colors.orange
                    : Colors.orange*/),
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
             // padding: EdgeInsets.symmetric(horizontal: 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Latitude : ", style: GoogleFonts.roboto(color: Colors.orange, fontSize: 16, fontWeight: FontWeight.w600),),
                      Text("${GlobalValues.latitude}° N  ", style: GoogleFonts.roboto(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),

                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Longitude : ", style: GoogleFonts.roboto(color: Colors.orange, fontSize: 16, fontWeight: FontWeight.w600),),
                      Text("${GlobalValues.longitude}° E", style: GoogleFonts.roboto(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),

                    ],
                  ),

                ],
              ),
            ),

          ],
        );
      },
    );
  }
}