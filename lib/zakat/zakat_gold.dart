import 'package:adhan/adhan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:islam_app/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islam_app/dashboard/dashboard.dart';
import 'package:islam_app/prayernew.dart';
import 'package:islam_app/zakat/zakat_silver.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Zakat_Gold extends StatefulWidget {
  @override
  _Zakat_GoldState createState() => _Zakat_GoldState();
}

class _Zakat_GoldState extends State<Zakat_Gold>
    with SingleTickerProviderStateMixin {
  TextEditingController gold = TextEditingController();
  TextEditingController silver = TextEditingController();
  TextEditingController cash = TextEditingController();
  TextEditingController savings = TextEditingController();
  TextEditingController lended = TextEditingController();
  TextEditingController loan = TextEditingController();
  List<String> _selectedValue = ['Gold', 'Silver']; // Option 2
  String _selectedDropDownValue = 'Gold';
  double payable = 0;
  double total = 0;
  Animation<double> animation;
  AnimationController animController;

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

  void initState() {
    getDate();
    // TODO: implement initState
    super.initState();
    animController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    final curvedAnimation =
        CurvedAnimation(parent: animController, curve: Curves.easeOutExpo);
    animation = Tween<double>(begin: 0, end: 210).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    _determinePosition().then((value) => {
          if (value != null)
            {
              setState(() {
                final myCoordinates = Coordinates(
                    value.latitude,
                    value
                        .longitude); // Replace with your own location lat, lng.
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
    return Scaffold(
      backgroundColor: HexColor("#145451"),
      body: Hero(
        tag: "Hero",
        child: SingleChildScrollView(
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
                //color: Colors.green,
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
                          "Zakat",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18.0,
                            decoration: TextDecoration.none,
                          ),
                        ))),
                        GestureDetector(
                          onTap: () {
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Dashboard()),
                            );*/
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
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        //  color: Colors.white,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 8),
                        child: Center(
                            child: Text(
                          "(Next)",
                          style: GoogleFonts.roboto(
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
                      prayerTimes == null
                          ? ""
                          : getPrayerName(prayerTimes.nextPrayer()),
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ))),
                    SizedBox(
                      height: 20.0,
                    ),

                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        //padding: EdgeInsets.all(20.0),
                        child: Column(
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Descriptions",
                                style: GoogleFonts.roboto(
                                    decoration: TextDecoration.none,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor("#eb9c34")),
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin aliquet arcu nulla, sed aliquam lorem dapibus ut Fusce venenatis eget libero vel ultrices. Proin sagittis urna eget nisi lacinia lacinia. Morbi tincidunt orci non iaculis aliquam. Aliquam erat volutpat. Nam efficitur ",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none,
                                    fontSize: 12,
                                    color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.black26,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Gold (Grams)",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Arial",
                                      color: HexColor("#eb9c34")),
                                ),
                              ),
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 10.0, bottom: 0.0),
                                  child: Row(
                                    children: [
                                      // Container(
                                      //   height: 50.0,
                                      //   width: MediaQuery.of(context).size.width/2,
                                      //   child: TextField(
                                      //     style: TextStyle(color: Colors.black, fontSize: 16.0),
                                      //     cursorColor: HexColor("#eb9c34"),
                                      //     showCursor: true,
                                      //     decoration: InputDecoration(
                                      //       border: InputBorder.none,
                                      //       fillColor: Colors.white,
                                      //       filled: true,
                                      //       hintText: "Enter Amount here..",
                                      //       hintStyle: TextStyle(color: Colors.white54),
                                      //       enabledBorder: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                      //         borderSide: BorderSide(color: Colors.white),
                                      //       ),
                                      //       focusedBorder: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                      //         borderSide: BorderSide(color: Colors.white),
                                      //       ),
                                      //
                                      //
                                      //     ),
                                      //   ),
                                      // ),

                                      //

                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.50,
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white12,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            )),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: TextField(
                                            controller: gold,
                                            keyboardType: TextInputType.number,
                                            style: TextStyle(
                                                color: Colors.white70),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: ' Enter Gold in grams',
                                            ),
                                            autofocus: false,
                                            onChanged: (newValue) {
                                              if (gold.value.text == '') {
                                                gold.text = "0";
                                              }
                                              if (silver.value.text == '') {
                                                silver.text = "0";
                                              }
                                              if (cash.value.text == '') {
                                                cash.text = "0";
                                              }
                                              if (savings.value.text == '') {
                                                savings.text = "0";
                                              }
                                              if (lended.value.text == '') {
                                                lended.text = "0";
                                              }
                                              if (loan.value.text == '') {
                                                loan.text = "0";
                                              }

                                              total = (double.parse(gold.value.text) * 9270.94) +
                                                      (double.parse(silver.value.text) * 134.20) +
                                                      (double.parse(cash.value.text)) +
                                                      (double.parse(savings.value.text)) -
                                                      (double.parse(lended.value.text) +
                                                      double.parse(loan.value.text));
                                              print('printing total $total');

                                              if (total < 811021.8312) {
                                                print(total);
                                                payable = 0;
                                                //showAlertDialog(context);
                                              } else
                                                payable = total * 0.025;
                                              print("$payable payable amount");
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        "(1 Toula = 11.66 grams)",
                                        style: GoogleFonts.roboto(
                                            decoration: TextDecoration.none,
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                            color: HexColor("#eb9c34")),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Silver (Grams)",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Arial",
                                      color: HexColor("#eb9c34")),
                                ),
                              ),
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 10.0, bottom: 0.0),
                                  child: Row(
                                    children: [
                                      // Container(
                                      //   height: 50.0,
                                      //   width: MediaQuery.of(context).size.width/2,
                                      //   child: TextField(
                                      //     style: TextStyle(color: Colors.black, fontSize: 16.0),
                                      //     cursorColor: HexColor("#eb9c34"),
                                      //     showCursor: true,
                                      //     decoration: InputDecoration(
                                      //       border: InputBorder.none,
                                      //       fillColor: Colors.white,
                                      //       filled: true,
                                      //       hintText: "Enter Amount here..",
                                      //       hintStyle: TextStyle(color: Colors.white54),
                                      //       enabledBorder: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                      //         borderSide: BorderSide(color: Colors.white),
                                      //       ),
                                      //       focusedBorder: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                      //         borderSide: BorderSide(color: Colors.white),
                                      //       ),
                                      //
                                      //
                                      //     ),
                                      //   ),
                                      // ),

                                      //

                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.50,
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white12,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            )),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: TextField(
                                            controller: silver,
                                            keyboardType: TextInputType.number,
                                            style: TextStyle(
                                                color: Colors.white70),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  ' Enter Silver in grams',
                                            ),
                                            autofocus: false,
                                            onChanged: (newValue) {
                                              if (gold.value.text == '') {
                                                gold.text = "0";
                                              }
                                              if (silver.value.text == '') {
                                                silver.text = "0";
                                              }
                                              if (cash.value.text == '') {
                                                cash.text = "0";
                                              }
                                              if (savings.value.text == '') {
                                                savings.text = "0";
                                              }
                                              if (lended.value.text == '') {
                                                lended.text = "0";
                                              }
                                              if (loan.value.text == '') {
                                                loan.text = "0";
                                              }

                                              total = (double.parse(
                                                          gold.value.text) *
                                                      9270.94) +
                                                  (double.parse(
                                                          silver.value.text) *
                                                      134.20) +
                                                  (double.parse(
                                                      cash.value.text)) +
                                                  (double.parse(
                                                      savings.value.text)) -
                                                  (double.parse(
                                                          lended.value.text) +
                                                      double.parse(
                                                          loan.value.text));

                                              if (total < 811021.8312) {
                                                print(total);
                                                payable = 0;
                                                //showAlertDialog(context);
                                              } else
                                                payable = total * 0.025;
                                              print("$payable payable amount");
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        "(1 Toula = 11.66 grams)",
                                        style: GoogleFonts.roboto(
                                            decoration: TextDecoration.none,
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                            color: HexColor("#eb9c34")),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Cash",
                                  style: GoogleFonts.roboto(
                                      decoration: TextDecoration.none,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#eb9c34")),
                                ),
                              ),
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 10.0, bottom: 0.0),
                                  child: Row(
                                    children: [
                                      // Container(
                                      //   height: 50.0,
                                      //   width: MediaQuery.of(context).size.width/2,
                                      //   child: TextField(
                                      //     style: TextStyle(color: Colors.black, fontSize: 16.0),
                                      //     cursorColor: HexColor("#eb9c34"),
                                      //     showCursor: true,
                                      //     decoration: InputDecoration(
                                      //       border: InputBorder.none,
                                      //       fillColor: Colors.white,
                                      //       filled: true,
                                      //       hintText: "Enter Amount here..",
                                      //       hintStyle: TextStyle(color: Colors.white54),
                                      //       enabledBorder: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                      //         borderSide: BorderSide(color: Colors.white),
                                      //       ),
                                      //       focusedBorder: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                      //         borderSide: BorderSide(color: Colors.white),
                                      //       ),
                                      //
                                      //
                                      //     ),
                                      //   ),
                                      // ),

                                      //

                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.50,
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white12,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            )),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: TextField(
                                            controller: cash,
                                            keyboardType: TextInputType.number,
                                            style: GoogleFonts.roboto(
                                                color: Colors.white70),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: ' Enter amount in pkr',
                                            ),
                                            autofocus: false,
                                            onChanged: (newValue) {
                                              if (gold.value.text == '') {
                                                gold.text = "0";
                                              }
                                              if (silver.value.text == '') {
                                                silver.text = "0";
                                              }
                                              if (cash.value.text == '') {
                                                cash.text = "0";
                                              }
                                              if (savings.value.text == '') {
                                                savings.text = "0";
                                              }
                                              if (lended.value.text == '') {
                                                lended.text = "0";
                                              }
                                              if (loan.value.text == '') {
                                                loan.text = "0";
                                              }

                                              total = (double.parse(
                                                          gold.value.text) *
                                                      9270.94) +
                                                  (double.parse(
                                                          silver.value.text) *
                                                      134.20) +
                                                  (double.parse(
                                                      cash.value.text)) +
                                                  (double.parse(
                                                      savings.value.text)) -
                                                  (double.parse(
                                                          lended.value.text) +
                                                      double.parse(
                                                          loan.value.text));

                                              if (total < 811021.8312) {
                                                print(total);
                                                payable = 0;
                                                //showAlertDialog(context);
                                              } else
                                                payable = total * 0.025;
                                              print("$payable payable amount");
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        "(1 USD = 157.52 pkr)",
                                        style: GoogleFonts.roboto(
                                            decoration: TextDecoration.none,
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.orange),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Savings",
                                  style: GoogleFonts.roboto(
                                      decoration: TextDecoration.none,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#eb9c34")),
                                ),
                              ),
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 10.0, bottom: 0.0),
                                  child: Row(
                                    children: [
                                      // Container(
                                      //   height: 50.0,
                                      //   width: MediaQuery.of(context).size.width/2,
                                      //   child: TextField(
                                      //     style: TextStyle(color: Colors.black, fontSize: 16.0),
                                      //     cursorColor: HexColor("#eb9c34"),
                                      //     showCursor: true,
                                      //     decoration: InputDecoration(
                                      //       border: InputBorder.none,
                                      //       fillColor: Colors.white,
                                      //       filled: true,
                                      //       hintText: "Enter Amount here..",
                                      //       hintStyle: TextStyle(color: Colors.white54),
                                      //       enabledBorder: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                      //         borderSide: BorderSide(color: Colors.white),
                                      //       ),
                                      //       focusedBorder: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                      //         borderSide: BorderSide(color: Colors.white),
                                      //       ),
                                      //
                                      //
                                      //     ),
                                      //   ),
                                      // ),

                                      //

                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.50,
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white12,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            )),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: TextField(
                                            controller: savings,
                                            keyboardType: TextInputType.number,
                                            style: GoogleFonts.roboto(
                                                color: Colors.white70),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: ' Enter savings in pkr',
                                            ),
                                            autofocus: false,
                                            onChanged: (newValue) {
                                              if (gold.value.text == '') {
                                                gold.text = "0";
                                              }
                                              if (silver.value.text == '') {
                                                silver.text = "0";
                                              }
                                              if (cash.value.text == '') {
                                                cash.text = "0";
                                              }
                                              if (savings.value.text == '') {
                                                savings.text = "0";
                                              }
                                              if (lended.value.text == '') {
                                                lended.text = "0";
                                              }
                                              if (loan.value.text == '') {
                                                loan.text = "0";
                                              }

                                              total = (double.parse(
                                                          gold.value.text) *
                                                      9270.94) +
                                                  (double.parse(
                                                          silver.value.text) *
                                                      134.20) +
                                                  (double.parse(
                                                      cash.value.text)) +
                                                  (double.parse(
                                                      savings.value.text)) -
                                                  (double.parse(
                                                          lended.value.text) +
                                                      double.parse(
                                                          loan.value.text));

                                              if (total < 811021.8312) {
                                                print(total);
                                                payable = 0;
                                                //showAlertDialog(context);
                                              } else
                                                payable = total * 0.025;
                                              print("$payable payable amount");
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        "(1 USD = 157.52 pkr)",
                                        style: GoogleFonts.roboto(
                                            decoration: TextDecoration.none,
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                            color: HexColor("#eb9c34")),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Lended Money",
                                  style: GoogleFonts.roboto(
                                      decoration: TextDecoration.none,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#eb9c34")),
                                ),
                              ),
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 10.0, bottom: 0.0),
                                  child: Row(
                                    children: [
                                      // Container(
                                      //   height: 50.0,
                                      //   width: MediaQuery.of(context).size.width/2,
                                      //   child: TextField(
                                      //     style: TextStyle(color: Colors.black, fontSize: 16.0),
                                      //     cursorColor: HexColor("#eb9c34"),
                                      //     showCursor: true,
                                      //     decoration: InputDecoration(
                                      //       border: InputBorder.none,
                                      //       fillColor: Colors.white,
                                      //       filled: true,
                                      //       hintText: "Enter Amount here..",
                                      //       hintStyle: TextStyle(color: Colors.white54),
                                      //       enabledBorder: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                      //         borderSide: BorderSide(color: Colors.white),
                                      //       ),
                                      //       focusedBorder: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                      //         borderSide: BorderSide(color: Colors.white),
                                      //       ),
                                      //
                                      //
                                      //     ),
                                      //   ),
                                      // ),

                                      //

                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.50,
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white12,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            )),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: TextField(
                                            controller: lended,
                                            keyboardType: TextInputType.number,
                                            style: GoogleFonts.roboto(
                                                color: Colors.white70),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: ' Enter amount in pkr',
                                            ),
                                            onChanged: (newValue) {
                                              if (gold.value.text == '') {
                                                gold.text = "0";
                                              }
                                              if (silver.value.text == '') {
                                                silver.text = "0";
                                              }
                                              if (cash.value.text == '') {
                                                cash.text = "0";
                                              }
                                              if (savings.value.text == '') {
                                                savings.text = "0";
                                              }
                                              if (lended.value.text == '') {
                                                lended.text = "0";
                                              }
                                              if (loan.value.text == '') {
                                                loan.text = "0";
                                              }

                                              total = (double.parse(
                                                          gold.value.text) *
                                                      9270.94) +
                                                  (double.parse(
                                                          silver.value.text) *
                                                      134.20) +
                                                  (double.parse(
                                                      cash.value.text)) +
                                                  (double.parse(
                                                      savings.value.text)) -
                                                  (double.parse(
                                                          lended.value.text) +
                                                      double.parse(
                                                          loan.value.text));

                                              if (total < 811021.8312) {
                                                print(total);
                                                payable = 0;
                                                // showAlertDialog(context);
                                              } else
                                                payable = total * 0.025;
                                              print("$payable payable amount");
                                              setState(() {});
                                            },
                                            autofocus: false,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        "(1 USD = 157.52 pkr)",
                                        style: GoogleFonts.roboto(
                                            decoration: TextDecoration.none,
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                            color: HexColor("#eb9c34")),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Loan Amount",
                                  style: GoogleFonts.roboto(
                                      decoration: TextDecoration.none,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#eb9c34")),
                                ),
                              ),
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 10.0, bottom: 0.0),
                                  child: Row(
                                    children: [
                                      // Container(
                                      //   height: 50.0,
                                      //   width: MediaQuery.of(context).size.width/2,
                                      //   child: TextField(
                                      //     style: TextStyle(color: Colors.black, fontSize: 16.0),
                                      //     cursorColor: HexColor("#eb9c34"),
                                      //     showCursor: true,
                                      //     decoration: InputDecoration(
                                      //       border: InputBorder.none,
                                      //       fillColor: Colors.white,
                                      //       filled: true,
                                      //       hintText: "Enter Amount here..",
                                      //       hintStyle: TextStyle(color: Colors.white54),
                                      //       enabledBorder: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                      //         borderSide: BorderSide(color: Colors.white),
                                      //       ),
                                      //       focusedBorder: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                      //         borderSide: BorderSide(color: Colors.white),
                                      //       ),
                                      //
                                      //
                                      //     ),
                                      //   ),
                                      // ),

                                      //

                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.50,
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white12,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            )),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: TextField(
                                            controller: loan,
                                            keyboardType: TextInputType.number,
                                            style: GoogleFonts.roboto(
                                                color: Colors.white70),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: ' Enter amount in pkr',
                                            ),
                                            autofocus: false,
                                            onChanged: (newValue) {
                                              if (gold.value.text == '') {
                                                gold.text = "0";
                                              }
                                              if (silver.value.text == '') {
                                                silver.text = "0";
                                              }
                                              if (cash.value.text == '') {
                                                cash.text = "0";
                                              }
                                              if (savings.value.text == '') {
                                                savings.text = "0";
                                              }
                                              if (lended.value.text == '') {
                                                lended.text = "0";
                                              }
                                              if (loan.value.text == '') {
                                                loan.text = "0";
                                              }

                                              total = (double.parse(
                                                          gold.value.text) *
                                                      9270.94) +
                                                  (double.parse(
                                                          silver.value.text) *
                                                      134.20) +
                                                  (double.parse(
                                                      cash.value.text)) +
                                                  (double.parse(
                                                      savings.value.text)) -
                                                  (double.parse(
                                                          lended.value.text) +
                                                      double.parse(
                                                          loan.value.text));

                                              if (total < 811021.8312) {
                                                print(total);
                                                payable = 0;
                                                // showAlertDialog(context);
                                              }

                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        "(1 USD = 157.52 pkr)",
                                        style: GoogleFonts.roboto(
                                            decoration: TextDecoration.none,
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                            color: HexColor("#eb9c34")),
                                      ),
                                    ],
                                  )),

                              /*GestureDetector(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 20.0),
                                    height: 45.0,
                                    width: 80.0,
                                    decoration: BoxDecoration(
                                        color: HexColor("#eb9c34"),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                                    ),
                                    // color: HexColor("#0070BF"),
                                    child:  ButtonTheme(
                                      minWidth: 100.0,
                                      height: 40.0,
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            side: BorderSide(
                                                color:HexColor("#eb9c34"))),
                                        color: HexColor("#eb9c34"),
                                        textColor: Colors.white,
                                        disabledColor: Colors.black26,
                                        disabledTextColor: Colors.white30,
                                        padding: EdgeInsets.all(4.0),
                                        splashColor: Colors.blueAccent,
                                        onPressed: () {
                                          total=(double.parse(gold.value.text)*9270.94) */ /*+ (double.parse(silver.value.text)* 134.20) */ /*+ (double.parse(cash.value.text)) + (double.parse(savings.value.text)) -(double.parse(lended.value.text) + double.parse(loan.value.text));

                                          if(total < 105241.02 ){
                                            print(total);
                                            payable = 0;
                                            showAlertDialog(context);
                                          }
                                          else
                                            payable = total*0.025;
                                          print("$payable payable amount");
                                          setState(() {

                                          });

                                        },
                                        child: AutoSizeText(
                                          "Calculate",
                                          maxFontSize: 13.0,
                                          minFontSize: 13.0 ,
                                          overflow: TextOverflow.ellipsis ,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: (){
                                    //code here
                                  },
                                ),*/
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                height: 150.0,
                                width: 300.0,
                                color: Colors.transparent,
                                child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    alignment: Alignment.topLeft,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        border:
                                            Border.all(color: Colors.white54)),
                                    child: new Text(
                                      "Your zakat is ${payable.toInt()} pkr",
                                      style: GoogleFonts.roboto(
                                          color: Colors.white70,
                                          fontSize: 16,
                                          decoration: TextDecoration.none),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

/*  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK",),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Attention", style: GoogleFonts.roboto(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24.0),),
      content: Text("Zakat is not applicable on you."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }*/
}
