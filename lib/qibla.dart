import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:islam_app/constants/constants.dart';
import 'package:islam_app/qibla_compass.dart';



class Qibla_Dir extends StatelessWidget {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qiblah',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      darkTheme: ThemeData.dark().copyWith(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body:
        Hero(
          tag: "hero",
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  //  color: Colors.green,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    Constants.dome_bg,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox.expand(
                  child: Container(
                    //color: Colors.green,
                    margin: EdgeInsets.only(
                        top: 16.0, left: 16.0, right: 16.0, bottom: 16.0),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  height: 22.0,
                                  //   color: Colors.red,
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                      child: Image.asset(Constants.backoutline))),
                              Expanded(
                                child: Text(
                                  "Qibla Direction",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.none,
                                      fontFamily: "Arial",
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0),
                                ),
                              ),

                            ],
                          ),
                          Spacer(flex: 2,),
                          Expanded(
                            flex: 7,
                            child: FutureBuilder(
                              future: _deviceSupport,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting)
                                  return Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  );

                                if (snapshot.hasError)
                                  return Center(
                                    child: Text('Error: ${snapshot.error.toString()}'),
                                  );
                                if (snapshot.hasData)
                                  return QiblaCompass();
                                else
                                  return Container(
                                    child: Text('Error'),
                                  );
                              },
                            )
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),




      ),
    );
  }
}