import 'package:adhan/adhan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:islam_app/Video/video.dart';
import 'package:islam_app/Video/video2.dart';
import 'package:islam_app/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islam_app/dashboard/dashboard.dart';
import 'package:islam_app/prayernew.dart';
import 'package:islam_app/speeches/speeches_category.dart';
import 'package:islam_app/zakat/zakat_silver.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Speeches extends StatefulWidget {
  @override
  _SpeechesState createState() => _SpeechesState();
}

class _SpeechesState extends State<Speeches> with SingleTickerProviderStateMixin {
  List<String> Video_titles = [
    "NEW | When a Scholar ",
    "NEW | Trust in Allah ",
  ];
  List<String> Video_pic = [
    "assets/images/m1.PNG",
    "assets/images/m2.PNG",

  ];
  List<String> Video_desc = [
    "NEW | When a Scholar Insults Another... Friday Jumu'ah with Mufti Menk",
    "NEW | Trust in Allah During Trying Times - Mufti Menk",
  ];
  PrayerTimes prayerTimes;
  AnimationController animController ;
  Animation<double> animation;
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition();
  }
  void initState() {

    // TODO: implement initState
    super.initState();
    animController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    final curvedAnimation = CurvedAnimation(
        parent: animController, curve: Curves.easeOutExpo
    );
    animation= Tween<double> (begin: 0, end: 210).animate(curvedAnimation)..addListener(() {setState(() {

    });});
    _determinePosition().then((value) => {
      if (value != null)
        {
          setState(() {

            final myCoordinates =
            Coordinates(value.latitude, value.longitude); // Replace with your own location lat, lng.
            final params = CalculationMethod.karachi.getParameters();
            params.madhab = Madhab.hanafi;
            prayerTimes = PrayerTimes.today(myCoordinates, params);
          })
        }
      else
        {print("null")}
    });

    //  startTime();
  }

  String getPrayerName(Prayer nextPrayer) {
    switch (nextPrayer) {
      case Prayer.fajr:
        return 'Pray Fajar';
        break;

      case Prayer.dhuhr:
        return 'Pray Dhuhr';
        break;

      case Prayer.asr:
        return 'Pray Asar';
        break;

      case Prayer.maghrib:
        return 'Pray Maghrib';
        break;

      case Prayer.isha:
        return 'Pray Isha';
        break;

      default:
        return '';
        break;

    }



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Container(
                //  height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  Constants.dome_bg,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height ,
              margin: EdgeInsets.only(
                  top: 50.0, left: 15.0, right: 15.0, bottom: 40.0),
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
                          child: Container(
                              padding: EdgeInsets.only(left: 10.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                //  color: Colors.white70,
                              ),
                              child: Image.asset(
                                Constants.transparent_back,
                                height: 30.0,
                              )),
                        ),
                      ),
                      Expanded(
                          child: Center(
                              child: Text(
                                "Speeches",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none,
                                    fontFamily: "Arial"),
                              ))),
                      /*  GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()),
                          );
                        },
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              //  color: Colors.white70,
                            ),
                            child: Image.asset(
                              Constants.share,
                              height: 25.0,
                            )),
                      ),*/
                      SizedBox(width: 50.0,)
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PrayerNewScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 30, bottom: 90.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            //  color: Colors.white,
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 12),
                              child: Center(
                                  child: Text(
                                    "(Now)",
                                    style: TextStyle(
                                      color: HexColor("#eb9c34"),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                    ),
                                  ))),
                          Container(
                              child: Center(
                                  child: Text(
                                    // "Pray Maghrib",
                                    prayerTimes == null ? "" :getPrayerName( prayerTimes.nextPrayer()),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                    ),
                                  ))),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.black26,
                          ),
                          child: Container(
                            //   margin: EdgeInsets.only(top:20.0,bottom: 20.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 120,
                                    padding: const EdgeInsets.only(left: 12.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        )),
                                    child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        icon: new Icon(Icons.search),
                                        border: InputBorder.none,
                                        hintText: 'Enter Speeches here..',
                                      ),
                                      autofocus: false,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      height: 46.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                        //  color: HexColor("#eb9c34"),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      // color: HexColor("#0070BF"),
                                      child: ButtonTheme(
                                        //  minWidth: 100.0,
                                        height: 40.0,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                              side: BorderSide(
                                                  color: HexColor("#eb9c34"))),
                                          color: Colors.transparent,
                                          textColor: Colors.white,
                                          disabledColor: Colors.black26,
                                          disabledTextColor: Colors.white30,
                                          padding: EdgeInsets.all(4.0),
                                          splashColor: Colors.blueAccent,
                                          onPressed: () {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(builder: (context) => SpeechesCategory()),
                                            // );
                                          },
                                          child: Image.asset(
                                            Constants.filter,
                                            width: 25,
                                          ),

                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) => SpeechesCategory()),
                                      // );
                                    },
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        Expanded (
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              color: Colors.black26,
                            ),
                            child: Container(
                              padding: EdgeInsets.only(bottom: 120,left: 10,right: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white24,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                color: Colors.transparent,
                              ),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>Video2()));
                                    },
                                    child: new Container(
                                      margin:
                                      EdgeInsets.only(top: 8.0, bottom: 1.0),
                                      alignment: Alignment.topCenter,
                                      // color: Colors.grey,
                                      //  padding: EdgeInsets.all(.0),
                                      //height: MediaQuery.of(context).size.width / 4.5,
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        color: Colors.white24.withOpacity(.15),
                                        child: Container(

                                            padding: EdgeInsets.only(
                                                top: 5.0,
                                                right: 5.0,
                                                left: 5.0,
                                                bottom: 1),
                                            alignment: Alignment.topLeft,
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(8.0)),
                                                    //  border: Border.all(),
                                                    image: new DecorationImage(
                                                      image: new AssetImage(
                                                          Video_pic[1]),
                                                      fit: BoxFit.fill
                                                      ,
                                                    ),
                                                    color: Colors.black,
                                                  ),
                                                  height: 80.0,
                                                  width: 80.0,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(Video_titles[1],
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      "#eb9c34"),
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                        ],
                                                      ),
                                                      Container(
                                                          margin: EdgeInsets.only(
                                                              top: 2.0,
                                                              bottom: 2.0),
                                                          child: Text(
                                                              Video_desc[1],
                                                              style: TextStyle(
                                                                  color:
                                                                  Colors.white70,
                                                                  fontSize: 11
                                                              ))),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>Video1()));},
                                    child: new Container(
                                      margin:
                                      EdgeInsets.only(top: 8.0, bottom: 1.0),
                                      alignment: Alignment.topCenter,
                                      // color: Colors.grey,
                                      //  padding: EdgeInsets.all(.0),
                                      //height: MediaQuery.of(context).size.width / 4.5,
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        color: Colors.white24.withOpacity(.15),
                                        child: Container(

                                            padding: EdgeInsets.only(
                                              top: 5.0,
                                              right: 5.0,
                                              left: 5.0,
                                            ),
                                            alignment: Alignment.topLeft,
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(8.0)),
                                                    //  border: Border.all(),
                                                    image: new DecorationImage(
                                                      image: new AssetImage(
                                                          Video_pic[0]),
                                                      fit: BoxFit.fill
                                                      ,
                                                    ),
                                                    color: Colors.black,
                                                  ),
                                                  height: 80.0,
                                                  width: 80.0,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(Video_titles[0],
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      "#eb9c34"),
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                        ],
                                                      ),
                                                      Container(
                                                          margin: EdgeInsets.only(
                                                              top: 2.0,
                                                              bottom: 2.0),
                                                          child: Text(
                                                              Video_desc[0],
                                                              style: TextStyle(
                                                                  color:
                                                                  Colors.white70,
                                                                  fontSize: 11
                                                              ))),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
