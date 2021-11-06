import 'package:flutter/material.dart';
import 'package:islam_app/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islam_app/dashboard/dashboard.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:permission_handler/permission_handler.dart';

class Allow_Location extends StatefulWidget {

  @override
  _Allow_LocationState createState() => _Allow_LocationState();
}

class _Allow_LocationState extends State<Allow_Location> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Hero(
        tag: "Hero",
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(Constants.splash_screen_image,fit: BoxFit.cover,),
            ),
            Container(
              //color: Colors.green,
              margin: EdgeInsets.only(top:50.0, left:16.0, right:16.0, bottom: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            //height: 120.0,
                            //   color: Colors.red,
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              child: Icon(Icons.keyboard_backspace,
                                  color: Colors.white),
                              backgroundColor: HexColor("#eb9c34"),
                              radius: 22.0,
                            )),
                      ),
                      Spacer(),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => Dashboard()),
                      //     );
                      //   },
                      //   child: Container(
                      //       padding: EdgeInsets.all(10.0),
                      //       decoration: BoxDecoration(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(20)),
                      //         color: Colors.white70,
                      //       ),
                      //       child: Text(
                      //         "Skip",
                      //         style: TextStyle(
                      //             decoration: TextDecoration.none,
                      //             color: Colors.black87,
                      //             fontSize: 14.0),
                      //       )),
                      // ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: HexColor("#eb9c34"),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Constants.loaction,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Allow Location",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  decoration: TextDecoration.none,
                                  fontFamily: "Calibri"),
                            )
                          ],
                        )),
                  ),
                  // SizedBox(
                  //   height: 30.0,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
/*checkallpermission() async {
    await [
    //  Permission.contacts,
      Permission.location,
      Permission.locationWhenInUse
    ].request();
  }*/
}
