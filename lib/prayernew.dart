import 'dart:async';
import 'package:adhan/adhan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islam_app/constants/constants.dart';
import 'package:islam_app/order.dart';
import 'package:intl/intl.dart';

import 'package:islam_app/views/alarm_page.dart';
import 'package:islam_app/views/clock_page.dart';


class PrayerNewScreen extends StatefulWidget {
  PrayerTimes prayerTimes;
  PrayerNewScreen({this.prayerTimes});


  @override
  _PrayerNewScreenState createState() => _PrayerNewScreenState();
}

class _PrayerNewScreenState extends State<PrayerNewScreen> {


  int selected = 0;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  void initState() {
    // TODO: implement initState
    super.initState();
    //  startTime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(),
        body: Hero(
          tag: "hero",
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
                              "Prayers Time",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                 
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0),
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          GestureDetector(
                            onTap: () {
                              /*Navigator.push(
                                 context,
                               MaterialPageRoute(builder: (context) => Qibla_Dir()),
                               );*/
                            },
                            child: Container(
                                height: 22.0,
                                //   color: Colors.red,
                                alignment: Alignment.center,
                                child: Image.asset(Constants.settings)),
                          ),
                        ],
                      ),
                      Spacer(flex: 2,),
                      Expanded(
                        flex: 7,
                        child: Column(
                          children: [
                            Container(
                               margin: EdgeInsets.only(top: 30.0, bottom: 20.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      // margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Today Prayers Time",
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            ),
                                      )),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(

                                      shape: BoxShape.circle,
                                      color: HexColor('#1E5D59')
                                    ),
                                      // margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                                      alignment: Alignment.center,
                                      child:
                                     GestureDetector(
                                       onTap: (){
                                         Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPlacedScreen()));
                                       },
                                       child: Container(
                                         child: Image.asset(Constants.share,
                                          height: 18,
                                           ),
                                       ),
                                     )
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                // color:
                                // // Hexcolor('#B5D1D4'),
                                // decoration: BoxDecoration(
                                //     gradient: LinearGradient(
                                //         begin: Alignment.topCenter,
                                //         end: Alignment.bottomCenter,
                                //         tileMode: TileMode.repeated,
                                //         colors: [HexColor('#B5D1D4'), HexColor('#055751')])),

                                child: ListView(
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => AlarmPage(namazTime: widget.prayerTimes.fajr, namazName: "Fajar", )));
                                        setState(() {
                                          selected = 0;

                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        margin: EdgeInsets.only(top:10.0),
                                        height: 50,
                                        decoration: BoxDecoration(
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       color: Hexcolor('#F8E5BB'),
                                          //       spreadRadius: 2,
                                          //       blurRadius: 5)
                                          // ],
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10.0)),
                                            // gradient: LinearGradient(colors: [
                                            //   selected == 0
                                            //       ? HexColor('#055751')
                                            //       : Colors.transparent,
                                            //   selected == 0
                                            //       ? HexColor('#081D32')
                                            //       : Colors.transparent,
                                            // ])
                                          color: selected ==0 ? HexColor('#093E3A'):Colors.transparent,
                                        ),
                                        width: MediaQuery.of(context).size.width,
                                        child: Row(
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[

                                            selected == 0?
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                              //    color: Colors.yellow,
                                                  child: Image.asset(Constants.tick,
                                                    height: 12,),
                                                ),
                                              ):

                                              Expanded(
                                                flex:1,
                                                child: Container(
                                                //  color: Colors.yellow,
                                                  child: Image.asset(Constants.checkoff,
                                                    height: 12,),
                                                ),
                                              ),



                                            SizedBox(width: 14.0,),
                                            Expanded(
                                              flex:3,
                                              child: Container(

                                            //  color: Colors.deepOrangeAccent,
                                                child: Text(
                                                  'Fajar',
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 0
                                                          ? Colors.white
                                                          : Colors.white30,
                                                      fontSize: 12,
                                                      letterSpacing: 1,
                                                     ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 14.0,),
                                            Expanded(
                                              flex:4,
                                              child: Container(

                                                // color: Colors.blue,
                                                child: Text(
                                                  DateFormat.jm().format(widget.prayerTimes.fajr==null?DateTime.now():widget.prayerTimes.fajr)==null?DateFormat.jm().format(DateTime.now()):DateFormat.jm().format(widget.prayerTimes.fajr==null?DateTime.now():widget.prayerTimes.fajr),
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 0
                                                          ? Colors.white
                                                          : Colors.white30,
                                                      fontSize: 12,
                                                      letterSpacing: 1,
                                                     ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Container(
                                                alignment: Alignment.center,
                                             //   color: Colors.green,
                                                child: Text(
                                                  'Azan',
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 0
                                                          ? HexColor('#FDA32C')
                                                          : Colors.white30,
                                                      fontSize: 12,
                                                      letterSpacing: 1,
                                                      ),
                                                ),
                                              ),
                                            ),

                                            selected == 0?
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                              //  color: Colors.amberAccent,
                                                child: Image.asset(Constants.volumn,
                                                  height: 12,),
                                              ),
                                            ):

                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                             //   color: Colors.amberAccent,
                                                child: Image.asset(Constants.volumnoff,
                                                  height: 12,),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          selected = 1;

                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        margin: EdgeInsets.only(top:10.0),
                                        height: 50,
                                        decoration: BoxDecoration(
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       color: Hexcolor('#F8E5BB'),
                                          //       spreadRadius: 2,
                                          //       blurRadius: 5)
                                          // ],
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10.0)),
                                            // gradient: LinearGradient(colors: [
                                            //   selected == 0
                                            //       ? HexColor('#055751')
                                            //       : Colors.transparent,
                                            //   selected == 0
                                            //       ? HexColor('#081D32')
                                            //       : Colors.transparent,
                                            // ])
                                          color: selected ==1 ? HexColor('#093E3A'):Colors.transparent
                                        ),
                                        width: MediaQuery.of(context).size.width,
                                        child: Row(
                                       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[

                                            selected == 1?
                                              Expanded(
                                                flex:1,
                                                child: Container(
                                                  child: Image.asset(Constants.tick,
                                                    height: 12,),
                                                ),
                                              ):

                                            Expanded(
                                              flex:1,
                                              child: Container(
                                                  child: Image.asset(Constants.checkoff,
                                                    height: 12,),
                                                ),
                                              ),



                                            SizedBox(width: 14.0,),
                                            Expanded(
                                              flex:3,
                                              child: Container(

                                              child: Text(
                                                  'Sunrise',
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 1
                                                          ? Colors.white
                                                          : Colors.white30,
                                                      fontSize: 12,
                                                      letterSpacing: 1,
                                                     ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 14.0,),
                                            Expanded(
                                              flex:4,
                                              child: Container(

                                              child: Text(
                                                  DateFormat.jm().format(widget.prayerTimes.sunrise),
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 1
                                                          ? Colors.white
                                                          : Colors.white30,
                                                      fontSize: 12,
                                                      letterSpacing: 1,
                                                     ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex:5,
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Mute',
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 1
                                                          ? HexColor('#FDA32C')
                                                          : Colors.white30,
                                                      fontSize: 12,
                                                      letterSpacing: 1,
                                                     ),
                                                ),
                                              ),
                                            ),

                                            selected == 1?
                                            Expanded(
                                              flex:1,
                                              child: Image.asset(Constants.volumn,
                                                height: 12,),
                                            ):

                                            Expanded(
                                              flex:1,
                                              child: Image.asset(Constants.volumnoff,
                                                height: 12,),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => AlarmPage(namazTime: widget.prayerTimes.dhuhr, namazName: "Dhuhr",)));

                                        setState(() {
                                          selected = 2;

                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        margin: EdgeInsets.only(top:10.0),
                                        height: 50,
                                        decoration: BoxDecoration(
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       color: Hexcolor('#F8E5BB'),
                                          //       spreadRadius: 2,
                                          //       blurRadius: 5)
                                          // ],
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10.0)),
                                            // gradient: LinearGradient(colors: [
                                            //   selected == 0
                                            //       ? HexColor('#055751')
                                            //       : Colors.transparent,
                                            //   selected == 0
                                            //       ? HexColor('#081D32')
                                            //       : Colors.transparent,
                                            // ])
                                          color: selected ==2 ? HexColor('#093E3A'):Colors.transparent
                                        ),
                                        width: MediaQuery.of(context).size.width,
                                        child: Row(
                                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[

                                            selected == 2?
                                              Expanded(
                                                flex: 1,
                                                child: Image.asset(Constants.tick,
                                                  height: 12,),
                                              ):

                                              Expanded(
                                                flex:1,
                                                child: Image.asset(Constants.checkoff,
                                                  height: 12,),
                                              ),



                                            SizedBox(width: 14.0,),
                                            Expanded(
                                              flex:3,
                                              child: Container(

                                              child: Text(
                                                  'Dhuhr',
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 2
                                                          ? Colors.white
                                                          : Colors.white30,
                                                      fontSize: 12,
                                                      letterSpacing: 1,
                                                     ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 14.0,),
                                            Expanded(
                                              flex:4,
                                              child: Container(

                                              child: Text(
                                                  DateFormat.jm().format(widget.prayerTimes.dhuhr),
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 2
                                                          ? Colors.white
                                                          : Colors.white30,
                                                      fontSize: 12,
                                                      letterSpacing: 1,
                                                     ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex:5,
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Notification',
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 2
                                                          ? HexColor('#FDA32C')
                                                          : Colors.white30,
                                                      fontSize: 12,
                                                      letterSpacing: 1,
                                                     ),
                                                ),
                                              ),
                                            ),

                                            selected == 2?
                                           Expanded(
                                             flex: 1,
                                             child: Icon(
                                               Icons.notifications,
                                               color: Colors.white30,
                                               size: 14,
                                             ),
                                           ):

                                            Expanded(

                                              flex: 1,
                                              child: Icon(
                                                  Icons.notifications_off,
                                                color: Colors.white30,
                                                size: 14.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => AlarmPage(namazTime: widget.prayerTimes.asr, namazName: "Asr",)));

                                        setState(() {
                                          selected = 3;

                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        margin: EdgeInsets.only(top:10.0),
                                        height: 50,
                                        decoration: BoxDecoration(
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       color: Hexcolor('#F8E5BB'),
                                          //       spreadRadius: 2,
                                          //       blurRadius: 5)
                                          // ],
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10.0)),
                                            // gradient: LinearGradient(colors: [
                                            //   selected == 0
                                            //       ? HexColor('#055751')
                                            //       : Colors.transparent,
                                            //   selected == 0
                                            //       ? HexColor('#081D32')
                                            //       : Colors.transparent,
                                            // ])
                                            color: selected ==3 ? HexColor('#093E3A'):Colors.transparent
                                        ),
                                        width: MediaQuery.of(context).size.width,
                                        child: Row(
                                       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[

                                            selected == 3?
                                            Expanded(
                                              flex:1,
                                              child: Image.asset(Constants.tick,
                                                height: 12,),
                                            ):

                                            Expanded(
                                              flex:1,
                                              child: Image.asset(Constants.checkoff,
                                                height: 12,),
                                            ),



                                            SizedBox(width: 14.0,),
                                            Expanded(
                                              flex:3,
                                              child: Container(

                                              child: Text(
                                                  'Asr',
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 3
                                                          ? Colors.white
                                                          : Colors.white30,
                                                      fontSize: 12,
                                                      letterSpacing: 1,
                                                     ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 14.0,),
                                            Expanded(
                                              flex:4,
                                              child: Container(
                                                child: Text(
                                                  DateFormat.jm().format(widget.prayerTimes.asr),
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 3
                                                          ? Colors.white
                                                          : Colors.white30,
                                                     fontSize: 12,
                                                      letterSpacing: 1,
                                                     ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex:5,
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Mute',
                                                //  textAlign: TextAlign.left,
                                                  style: GoogleFonts.roboto(

                                                      color: selected == 3
                                                          ? HexColor('#FDA32C')
                                                          : Colors.white30,
                                                      fontSize: 12,
                                                      letterSpacing: 1,
                                                      )
                                                  ,
                                                ),
                                              ),
                                            ),

                                            selected == 3?
                                            Expanded(
                                              flex:1,
                                              child: Image.asset(Constants.volumn,
                                                height: 12,),
                                            ):

                                            Expanded(
                                              flex:1,
                                              child: Image.asset(Constants.volumnoff,
                                                height: 12,),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => AlarmPage(namazTime: widget.prayerTimes.maghrib, namazName: "Maghrib",)));

                                        setState(() {
                                          selected = 4;

                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        margin: EdgeInsets.only(top:10.0),
                                        height: 50,
                                        decoration: BoxDecoration(
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       color: Hexcolor('#F8E5BB'),
                                          //       spreadRadius: 2,
                                          //       blurRadius: 5)
                                          // ],
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10.0)),
                                            // gradient: LinearGradient(colors: [
                                            //   selected == 0
                                            //       ? HexColor('#055751')
                                            //       : Colors.transparent,
                                            //   selected == 0
                                            //       ? HexColor('#081D32')
                                            //       : Colors.transparent,
                                            // ])
                                            color: selected ==4 ? HexColor('#093E3A'):Colors.transparent
                                        ),
                                        width: MediaQuery.of(context).size.width,
                                        child: Row(
                                       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[

                                            selected == 4?
                                            Expanded(
                                              flex:1,
                                              child: Image.asset(Constants.tick,
                                                height: 12,),
                                            ):

                                            Expanded(
                                              flex:1,
                                              child: Image.asset(Constants.checkoff,
                                                height: 12,),
                                            ),

                                            SizedBox(width: 14.0,),
                                            Expanded(
                                              flex:3,
                                              child: Container(
//color: Colors.amberAccent,
                                              child: Text(
                                                  'Maghrib',
                                                  overflow: TextOverflow.fade,
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 4
                                                          ? Colors.white
                                                          : Colors.white30,
                                                      fontSize: 12,
                                                      letterSpacing: 0.4,
                                                     ),
                                                ),
                                              ),
                                            ),
                                           SizedBox(width: 14.0,),
                                            Expanded(
                                              flex:4,
                                              child: Container(
                                              //  color: Colors.pink,
                                                child: Text(
                                                  DateFormat.jm().format(widget.prayerTimes.maghrib),
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 4
                                                          ? Colors.white
                                                          : Colors.white30,
                                                     fontSize: 12,
                                                      letterSpacing: 1,
                                                     ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex:5,
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Mute',
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 4
                                                          ? HexColor('#FDA32C')
                                                          : Colors.white30,
                                                      fontSize: 12,
                                                      letterSpacing: 1,
                                                     ),
                                                ),
                                              ),
                                            ),

                                            selected == 4?
                                            Expanded(
                                              flex:1,
                                              child: Image.asset(Constants.volumn,
                                                height: 12,),
                                            ):

                                            Expanded(
                                              flex:1,
                                              child: Image.asset(Constants.volumnoff,
                                                height: 12,),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => AlarmPage(namazTime: widget.prayerTimes.isha, namazName: "Isha",)));

                                        setState(() {
                                          selected = 5;

                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        margin: EdgeInsets.only(top:10.0),
                                        height: 50,
                                        decoration: BoxDecoration(
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       color: Hexcolor('#F8E5BB'),
                                          //       spreadRadius: 2,
                                          //       blurRadius: 5)
                                          // ],
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10.0)),
                                            // gradient: LinearGradient(colors: [
                                            //   selected == 0
                                            //       ? HexColor('#055751')
                                            //       : Colors.transparent,
                                            //   selected == 0
                                            //       ? HexColor('#081D32')
                                            //       : Colors.transparent,
                                            // ])
                                            color: selected ==5 ? HexColor('#093E3A'):Colors.transparent
                                        ),
                                        width: MediaQuery.of(context).size.width,
                                        child: Row(
                                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[

                                            selected == 5?
                                            Expanded(
                                              flex:1,
                                              child: Image.asset(Constants.tick,
                                                height: 12,),
                                            ):

                                            Expanded(
                                              flex:1,
                                              child: Image.asset(Constants.checkoff,
                                                height: 12,),
                                            ),
                                            SizedBox(width: 14.0,),
                                            Expanded(
                                              flex:3,
                                              child: Container(

                                                child: Text(
                                                  'Isha',
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 5
                                                          ? Colors.white
                                                          : Colors.white30,
                                                      fontSize: 12,
                                                      letterSpacing: 1,
                                                     ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 14.0,),
                                            Expanded(
                                              flex:4,
                                              child: Container(
                                                child: Text(
                                                  DateFormat.jm().format(widget.prayerTimes.isha),
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 5
                                                          ? Colors.white
                                                          : Colors.white30,
                                                      fontSize: 12,
                                                      letterSpacing: 1,
                                                     ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex:5,
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Mute',
                                                  style: GoogleFonts.roboto(
                                                      color: selected == 5
                                                          ? HexColor('#FDA32C')
                                                          : Colors.white30,
                                                      fontSize: 12,
                                                      letterSpacing: 1,
                                                     ),
                                                ),
                                              ),
                                            ),

                                            selected == 5?
                                            Expanded(
                                              flex:1,
                                              child: Image.asset(Constants.volumn,
                                                height: 12,),
                                            ):
                                            Expanded(
                                              flex:1,
                                              child: Image.asset(Constants.volumnoff,
                                                height: 12,),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            )


                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
