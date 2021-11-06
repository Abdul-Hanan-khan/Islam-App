import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:islam_app/ViewAll.dart';
import 'package:islam_app/books/books.dart';
import 'package:islam_app/constants/constants.dart';
import 'package:islam_app/counter/tasbi.dart';
import 'package:islam_app/prayernew.dart';
import 'package:islam_app/speeches/speeches.dart';
import 'package:islam_app/zakat/zakat_gold.dart';
import 'package:adhan/adhan.dart';

import 'package:geolocator/geolocator.dart';
import 'package:islam_app/qibla.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {

Animation<double> animation;
AnimationController animController ;
  String finalDate = '';
  String finalTime = '';
  DateTime today = new DateTime.now();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String englishDate = '';
  String day = '';
  String islamicDate = '';
  var date = new DateTime.now().toString();
  PrayerTimes prayerTimes;
bool isForward = false;

  void initState() {
    getDate();
    // TODO: implement initState
    super.initState();
animController = AnimationController(
  duration: Duration(seconds: 1), vsync: this,
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor('#075852'),
          key: scaffoldKey,
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  height: 150,
                  color: HexColor('#075852'),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 45,
                        ),
                        SizedBox(height: 30,),
                        Text("User",style: TextStyle(color: Colors.white),),

                      ],
                    ),
                  ),
                ),


                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    title: Text('Zakat'),
                    leading: Image.asset('assets/icons/zakkat.png',width: 50,height: 50,),
                  ),
                ),
                Divider(color: Colors.grey,
                  thickness: 1,
                ),

                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    title: Text('Books'),
                    leading: Image.asset('assets/icons/book.png',width: 40,height: 40,),
                  ),
                ),
                Divider(color: Colors.grey,
                  thickness: 1,
                ),


                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    title: Text('Speeches'),
                    leading: Image.asset('assets/icons/speech.png',width: 50,height: 50,),
                  ),
                ),
                Divider(color: Colors.grey,
                  thickness: 1,
                ),


                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    title: Text('Qibla'),
                    leading: Image.asset('assets/qibla.png',width: 50,height: 50,),
                  ),
                ),
                Divider(color: Colors.grey,
                  thickness: 1,
                ),


                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    title: Text('Classes'),
                    leading: Image.asset('assets/icons/classroom.png',width: 40,height: 40,),
                  ),
                ),
                Divider(color: Colors.grey,
                  thickness: 1,
                ),


                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    title: Text('Tasbeeh'),
                    leading: Image.asset('assets/icons/muslim.png',width: 50,height: 50,),
                  ),
                ),
                Divider(color: Colors.grey,
                  thickness: 1,
                ),

                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    title: Text('Login'),
                    leading: Icon(Icons.login),
                  ),
                ),







              ],
            ),
          ),
          body: SingleChildScrollView(
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
                Container(
                  //color: Colors.green,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 16.0, right: 16.0, bottom: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              scaffoldKey.currentState.openDrawer();
                            },
                            child: Container(
                                height: 22.0,
                                //   color: Colors.red,
                                alignment: Alignment.center,
                                child: Image.asset(Constants.drawer)),
                          ),
                          Expanded(
                            child: Text(
                              "About Islam",
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
                          GestureDetector(
                            onTap: () {

                            },
                            child: Container(
                                height: 22.0,
                                //   color: Colors.red,
                                alignment: Alignment.center,
                                child: Image.asset(Constants.share)),
                          ),
                        ],
                      ),
                     GestureDetector(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => PrayerNewScreen(prayerTimes:prayerTimes)));
                       },
                       child: Container(
                         child: Column(
                           children: <Widget>[
                             SizedBox(
                               height: 5,
                             ),
                             Container(
                               //  color: Colors.white,
                                 margin: EdgeInsets.only(
                                     top: MediaQuery.of(context).size.height / 10),
                                 child: Center(
                                     child: Text(
                                       "(Next)",
                                       style: TextStyle(
                                         color: HexColor("#eb9c34"),
                                         fontWeight: FontWeight.w400,
                                         fontSize: 16.0,
                                       ),
                                     ))),
                             SizedBox(
                               height: 10,
                             ),
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
                             Container(
                                 margin: EdgeInsets.only(top: 30.0),
                                 child: Center(
                                     child: Text(
                                       finalDate,
                                       style: TextStyle(
                                         color: Colors.white,
                                         fontWeight: FontWeight.w400,
                                         fontSize: 16.0,
                                       ),
                                     ))),
                             Container(
                                 margin: EdgeInsets.only(top: 5.0),
                                 child: Center(
                                     child: Text(
                                       _today,
                                       style: TextStyle(
                                         color: HexColor("#eb9c34"),
                                         fontWeight: FontWeight.w400,
                                         fontSize: 15.0,
                                       ),
                                     ))),
                           ],
                         ),
                       ),
                     ),
                    /*  Container(
                          margin: EdgeInsets.only(top: 30.0),
                          child: Row(
                            children: [
                              Container(
                                height: 45.0,
                                width: MediaQuery.of(context).size.width / 1.33,
                                child: TextField(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                  cursorColor: HexColor("#eb9c34"),
                                  showCursor: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "   Search..",
                                    hintStyle: TextStyle(color: Colors.black54),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0)),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0)),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              GestureDetector(
                                child: Container(
                                  height: 45.0,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                      color: HexColor("#eb9c34"),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  // color: HexColor("#0070BF"),
                                  child: Icon(Icons.search,
                                      size: 30.0, color: Colors.white),
                                ),
                                onTap: () {
                                  //code here
                                },
                              ),
                            ],
                          )),*/
                   /*   Container(
                       // color: Colors.pink,
                          margin: EdgeInsets.only(top: 30.0),
                          width: MediaQuery.of(context).size.width,
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: animation.value,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(left:20.0, bottom: 5.0),
                                    child: TextField(


                                      cursorColor: HexColor("#eb9c34"),
                                      style: TextStyle(color:Colors.black87),
                                      decoration: InputDecoration(
                                        hintText: "Search .. ",
                                        border: InputBorder.none,
                                      ),
                                    )
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left:4.0),
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                   color:  HexColor("#eb9c34"),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12.0),
                                      bottomLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                    )

                                ),
                                child: IconButton(

                                  color: Colors.black,

                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  onPressed: (){

                                    if(!isForward){
                                      animController.forward();
                                      isForward = true;
                                    }
                                    else
                                    {
                                      animController.reverse();
                                      isForward=false;
                                    }

                                  },
                                ),
                              ),

                            ],
                          )
                      ),*/
                      Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "All Categories",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Arial"),
                          )),
                      Container(
                        // color: Colors.red,
                        width: MediaQuery.of(context).size.width,
                        //   padding: EdgeInsets.only(left:20.0, right:20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Zakat_Gold()));

                                    },
                                    child:
                                    Container(
                                      height: 80,
                                      width: 80,
                                      alignment: Alignment.bottomCenter,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(15.0))
                                      ),
                                      child:
                                      Column(
                                        children: [
                                          Container(
                                            // height:44.3,
                                            child: Image.asset(Constants.zakkat,
                                            height: 44.3,),
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
                                                  child: Image.asset(Constants.greennew,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(top: 12.0),
                                                alignment: Alignment.bottomCenter,
                                                child: Text('Zakat',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,

                                                ),
                                                textAlign: TextAlign.center,),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                     )

                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Books()));
                                    },
                                    child:
                                    Container(
                                      height: 80,
                                      width: 80,
                                      alignment: Alignment.bottomCenter,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                                      ),
                                      child:
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Container(
                                            // height:44.3,
                                            child: Image.asset(Constants.book,
                                              height: 40,),
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
                                                  child: Image.asset(Constants.greennew,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(top: 12.0),
                                                alignment: Alignment.bottomCenter,
                                                child: Text('Books',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12
                                                  ),),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )

                                ),
                                GestureDetector(
                                    onTap: () {

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Speeches()),
                                      );

                                    },
                                    child:
                                    Container(
                                      height: 80,
                                      width: 80,
                                      alignment: Alignment.bottomCenter,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                                      ),
                                      child:
                                      Column(
                                        children: [
                                          Container(
                                            height:44.3,
                                            child: Image.asset(Constants.speech,
                                              height: 20,),
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
                                                  child: Image.asset(Constants.greennew,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(top: 12.0),
                                                alignment: Alignment.bottomCenter,
                                                child: Text('Speeches',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12
                                                  ),),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )

                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Qibla_Dir()),
                                      );
                                    },
                                    child:
                                    Container(
                                      height: 80,
                                      width: 80,
                                      alignment: Alignment.bottomCenter,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                                      ),
                                      child:
                                      Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top:2),

                                            // height:44.3,
                                            child: Image.asset("assets/qibla.png",
                                              height: 42.3,),
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
                                                  child: Image.asset(Constants.greennew,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(top: 12.0),
                                                alignment: Alignment.bottomCenter,
                                                child: Text('Qibla',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12
                                                  ),),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )

                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child:
                                    Container(
                                      height: 80,
                                      width: 80,
                                      alignment: Alignment.bottomCenter,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                                      ),
                                      child:
                                      Column(
                                        children: [

                                          Container(
                                            // height:44.3,
                                            margin: EdgeInsets.only(top:2),
                                            child: Image.asset(Constants.classroom,
                                              height: 42.3,),
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
                                                  child: Image.asset(Constants.greennew,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(top: 12.0),
                                                alignment: Alignment.bottomCenter,
                                                child: Text('Classes',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12
                                                  ),),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )

                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Tasbi()));


                                    },
                                    child:
                                    Container(
                                      height: 80,
                                      width: 80,
                                      alignment: Alignment.bottomCenter,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                                      ),
                                      child:
                                      Column(
                                        children: [
                                          Container(
                                            // height:44.3,
                                            child: Image.asset(Constants.muslim,
                                              height: 44.3,),
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
                                                  child: Image.asset(Constants.greennew,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(top: 12.0),
                                                alignment: Alignment.bottomCenter,
                                                child: Text('Tasbi',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12
                                                  ),),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )

                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "My Questions & Answers",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Arial",
                                  decoration: TextDecoration.none,
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ViewAllScreen()));
                                },
                                child: Container(
                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                        color: HexColor("#eb9c34"),
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        fontFamily: "Arial"),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: HexColor('#0A4541'),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset(
                                Constants.girl,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 5.0),
                                    child: Text(
                                      'Sandal',
                                      style:
                                          TextStyle(color: HexColor("#eb9c34"), decoration: TextDecoration.none,),
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        Constants.descnew,
                                        style: TextStyle(color: Colors.white,  decoration: TextDecoration.none,),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Text(
                                        'Like',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: HexColor("#eb9c34"),  decoration: TextDecoration.none,),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Dislike',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white,  decoration: TextDecoration.none,),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Reply',
                                        style: TextStyle(
                                            fontSize: 10,
                                            decoration: TextDecoration.none,
                                            color: HexColor("#eb9c34")),
                                      ),
                                      Spacer(),
                                      Spacer(),
                                      Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          '13-Jan-2021',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              letterSpacing: 1.5,  decoration: TextDecoration.none,),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Image.asset(
                                        Constants.john,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0, bottom: 5.0),
                                              child: Text(
                                                'John Doe',
                                                style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                    color: HexColor("#eb9c34")),
                                              ),
                                            ),
                                            Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Text(
                                                  Constants.descnew,
                                                  style: TextStyle(
                                                      decoration: TextDecoration.none,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 5),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  // color: Colors.pink,
                    margin: EdgeInsets.only(
                        top: 12.0, left: 16.0, right: 45.0, bottom: 20.0),
                    width: MediaQuery.of(context).size.width,
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: animation.value,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(left:20.0, bottom: 2.0),
                              child: TextField(


                                cursorColor: HexColor("#eb9c34"),
                                style: TextStyle(color:Colors.black87),
                                decoration: InputDecoration(
                                  hintText: "Search .. ",
                                  border: InputBorder.none,
                                ),
                              )
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left:4.0),
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              color:  HexColor("#eb9c34"),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.0),
                                bottomLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                              )

                          ),
                          child: IconButton(

                            color: Colors.black,

                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            onPressed: (){

                              if(!isForward){
                                animController.forward();
                                isForward = true;
                              }
                              else
                              {
                                animController.reverse();
                                isForward=false;
                              }

                            },
                          ),
                        ),

                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  var _today = "";

  getDate() {
    var date = new DateTime.now().toString();
    var time = new TimeOfDay.now();
    var dateParse = DateTime.parse(date);
    var timeParse = TimeOfDay(hour: time.hour, minute: time.minute);
    var todayParse = HijriCalendar.now();
    var formattedDate =
        "${getDay(dateParse.weekday)} , ${dateParse.day} ${getMonth(dateParse.month)}  ${dateParse.year}";
    print(dateParse.weekday);
    var formatedTimeOfDay = "${timeParse.hour}:${timeParse.minute} Pm";
    var formatedToday =
    "${todayParse.hDay} ${todayParse.longMonthName} || ${todayParse.hYear} AH ";
        // "${todayParse.hYear} -${todayParse.longMonthName} - ${todayParse.hDay}";

    setState(() {
      _today = formatedToday.toString();

      finalDate = formattedDate.toString();
      finalTime = formatedTimeOfDay.toString();
    });
  }

  String getDay(int weekday) {
    switch (weekday) {
      case 1:
        return 'Monday';
        break;

      case 2:
        return 'Tuesday';
        break;

      case 3:
        return 'Wednesday';
        break;

      case 4:
        return 'Thursday';
        break;

      case 5:
        return 'Friday';
        break;

      case 6:
        return 'Saturday';
        break;

      case 7:
        return 'Sunday';
        break;
    }
  }

  getMonth(int month) {
    switch (month) {
      case 1:
        return 'January';
        break;

      case 2:
        return 'February';
        break;

      case 3:
        return 'March';
        break;

      case 4:
        return 'April';
        break;

      case 5:
        return 'May';
        break;

      case 6:
        return 'June';
        break;

      case 7:
        return 'July';
        break;

      case 8:
        return 'August';
        break;

      case 9:
        return 'September';
        break;

      case 10:
        return 'October';
        break;

      case 11:
        return 'November';
        break;

      case 12:
        return 'December';
        break;
    }
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

}
