import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islam_app/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islam_app/dashboard/dashboard.dart';
import 'package:islam_app/prayernew.dart';
import 'package:islam_app/zakat/zakat_gold.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Zakat_Silver extends StatefulWidget {

  @override
  _Zakat_SilverState createState() => _Zakat_SilverState();
}

class _Zakat_SilverState extends State<Zakat_Silver> {
  TextEditingController silver = TextEditingController();
  TextEditingController gold = TextEditingController();

  TextEditingController cash = TextEditingController();
  TextEditingController savings = TextEditingController();
  TextEditingController lended = TextEditingController();
  TextEditingController loan = TextEditingController();

  double payable = 0;
  double total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#145451"),
      body: SingleChildScrollView(
        child
            : Stack(
          children: [
            SafeArea(
              child: Container(
                //  height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(Constants.dome_bg,fit: BoxFit.fill,),
              ),
            ),
            Container(
              //color: Colors.green,
              margin: EdgeInsets.only(top:50.0, left:15.0, right:15.0, bottom: 40.0),
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
                          child:  Container(
                              padding: EdgeInsets.only(left:10.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                //  color: Colors.white70,
                              ),
                              child: Image.asset(Constants.transparent_back, height: 30.0,)),),
                      ),
                      Expanded(child: Center(child: Text("Zakat", style: GoogleFonts.roboto(color: Colors.white, fontSize: 18.0, decoration: TextDecoration.none, ),))),
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
                            child: Image.asset(Constants.share, height: 25.0,)),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PrayerNewScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 30, bottom: 60.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            //  color: Colors.white,
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 12),
                              child: Center(
                                  child: Text(
                                    "(Now)",
                                    style: GoogleFonts.roboto(
                                      color: HexColor("#eb9c34"),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                    ),
                                  ))),
                          Container(
                              child: Center(
                                  child: Text(
                                    "Pray Maghrib",
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.0,
                                    ),
                                  ))),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top:30.0),
                    //  padding: EdgeInsets.only(left: 25.0),
                    child: Row(
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: 100.0,
                          height: 40.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                    color: Colors.black12)),
                            color: Colors.white12,
                            textColor: Colors.white,
                            disabledColor: Colors.black26,
                            disabledTextColor: Colors.white30,
                            padding: EdgeInsets.all(4.0),
                            splashColor: Colors.blueAccent,
                            onPressed: () { setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Zakat_Gold()),
                              );
                            });},
                            child: AutoSizeText(
                              "Gold",
                              style: GoogleFonts.roboto(color: Colors.white70  ,),maxFontSize: 15.0,
                              minFontSize: 10.0 ,
                              overflow: TextOverflow.ellipsis ,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        ButtonTheme(
                          minWidth: 100.0,
                          height: 40.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                    color:HexColor("#eb9c34"))),
                            color: HexColor("#eb9c34"),
                            textColor: Colors.black54,
                            disabledColor: Colors.black26,
                            disabledTextColor: Colors.white30,
                            padding: EdgeInsets.all(4.0),
                            splashColor: Colors.blueAccent,
                            onPressed: () {
                              /*...*/
                            },
                            child: AutoSizeText(
                              "Silver",
                              maxFontSize: 15.0,
                              minFontSize: 10.0 ,
                              overflow: TextOverflow.ellipsis ,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 20.0,),
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
                        Text("Descriptions", style: GoogleFonts.roboto(decoration: TextDecoration.none, fontSize: 16, fontWeight: FontWeight.bold, color: HexColor("#eb9c34")),),
                        SizedBox(height: 3.0,),
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin aliquet arcu nulla, sed aliquam lorem dapibus ut Fusce venenatis eget libero vel ultrices. Proin sagittis urna eget nisi lacinia lacinia. Morbi tincidunt orci non iaculis aliquam. Aliquam erat volutpat. Nam efficitur ", style: GoogleFonts.roboto(fontWeight: FontWeight.w500,decoration: TextDecoration.none, fontSize: 12,  color: Colors.white70),),

                      ],
                    ),
                  ),
                  SizedBox(height: 20.0,),
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
                       /* Text("Gold (Grams)", style: TextStyle(decoration: TextDecoration.none, fontSize: 14, fontWeight: FontWeight.bold,fontFamily: "Arial", color: HexColor("#eb9c34")),),

                        Container(
                            margin: EdgeInsets.only(top:10.0,bottom: 0.0),
                            child:Row(
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

                                Container( width: MediaQuery.of(context).size.width*0.50,
                                  padding: const EdgeInsets.only(left: 12.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                  ), child: Material(
                                    color: Colors.transparent,
                                    child: TextField(
                                      controller: gold,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(color: Colors.white70),
                                      decoration: InputDecoration(
                                        border:InputBorder.none,
                                        hintText: ' Enter Gold in Toula',
                                      ),
                                      autofocus: false,
                                    ),
                                  ),),
                                SizedBox(width: 5.0,),
                                Text("(1 Toula = 11.66 grams)", style: TextStyle(decoration: TextDecoration.none, fontSize: 10, fontWeight: FontWeight.normal,fontFamily: "Arial", color: HexColor("#eb9c34")),),


                              ],
                            )
                        ),*/



                        Text("Silver (Grams)", style: GoogleFonts.roboto(decoration: TextDecoration.none, fontSize: 14, fontWeight: FontWeight.bold, color: HexColor("#eb9c34")),),

                        Container(
                            margin: EdgeInsets.only(top:10.0,bottom: 0.0),
                            child:Row(
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

                                Container( width: MediaQuery.of(context).size.width*0.50,
                                  padding: const EdgeInsets.only(left: 12.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                  ), child: Material(
                                    color: Colors.transparent,
                                    child: TextField(
                                      controller: silver,
                                      keyboardType: TextInputType.number,
                                      style: GoogleFonts.roboto(color: Colors.white70),
                                      decoration: InputDecoration(
                                        border:InputBorder.none,
                                        hintText: ' Enter Silver in grams',
                                      ),
                                      autofocus: false,
                                    ),
                                  ),),
                                SizedBox(width: 5.0,),

                                Text("(1 Toula = 11.66 grams)", style: GoogleFonts.roboto(decoration: TextDecoration.none, fontSize: 10, fontWeight: FontWeight.normal, color: HexColor("#eb9c34")),),



                              ],
                            )
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text("Cash", style: GoogleFonts.roboto(decoration: TextDecoration.none, fontSize: 14, fontWeight: FontWeight.bold, color: HexColor("#eb9c34")),),
                        ),

                        Container(
                            margin: EdgeInsets.only(top:10.0,bottom: 0.0),
                            child:Row(
                              children: [


                                Container( width: MediaQuery.of(context).size.width*0.50,
                                  padding: const EdgeInsets.only(left: 12.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                  ), child: Material(
                                    color: Colors.transparent,
                                    child: TextField(
                                      controller: cash,
                                      keyboardType: TextInputType.number,
                                      style: GoogleFonts.roboto(color: Colors.white70),
                                      decoration: InputDecoration(
                                        border:InputBorder.none,
                                        hintText: ' Enter amount in pkr',
                                      ),
                                      autofocus: false,
                                    ),
                                  ),),
                                SizedBox(width: 5.0,),
                                Text("(1 USD = 157.52 pkr)", style: GoogleFonts.roboto(decoration: TextDecoration.none, fontSize: 10, fontWeight: FontWeight.normal, color: HexColor("#eb9c34")),),



                              ],
                            )
                        ),




                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text("Savings", style: GoogleFonts.roboto(decoration: TextDecoration.none, fontSize: 14, fontWeight: FontWeight.bold, color: HexColor("#eb9c34")),),
                        ),

                        Container(
                            margin: EdgeInsets.only(top:10.0,bottom: 0.0),
                            child:Row(
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

                                Container( width: MediaQuery.of(context).size.width*0.50,
                                  padding: const EdgeInsets.only(left: 12.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                  ), child: Material(
                                    color: Colors.transparent,
                                    child: TextField(
                                      controller: savings,
                                      keyboardType: TextInputType.number,
                                      style: GoogleFonts.roboto(color: Colors.white70),
                                      decoration: InputDecoration(
                                        border:InputBorder.none,
                                        hintText: ' Enter savings in pkr',
                                      ),
                                      autofocus: false,
                                    ),
                                  ),),
                                SizedBox(width: 5.0,),
                                Text("(1 USD = 157.52 pkr)", style: GoogleFonts.roboto(decoration: TextDecoration.none, fontSize: 10, fontWeight: FontWeight.normal, color: HexColor("#eb9c34")),),


                              ],
                            )
                        ),




                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text("Lended Money", style: GoogleFonts.roboto(decoration: TextDecoration.none, fontSize: 14, fontWeight: FontWeight.bold, color: HexColor("#eb9c34")),),
                        ),

                        Container(
                            margin: EdgeInsets.only(top:10.0,bottom: 0.0),
                            child:Row(
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

                                Container( width: MediaQuery.of(context).size.width*0.50,
                                  padding: const EdgeInsets.only(left: 12.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                  ), child: Material(
                                    color: Colors.transparent,
                                    child: TextField(
                                      controller: lended,
                                      keyboardType: TextInputType.number,
                                      style: GoogleFonts.roboto(color: Colors.white70),
                                      decoration: InputDecoration(
                                        border:InputBorder.none,
                                        hintText: ' Enter amount in pkr',
                                      ),
                                      autofocus: false,
                                    ),
                                  ),),
                                SizedBox(width: 5.0,),
                                Text("(1 USD = 157.52 pkr)", style: GoogleFonts.roboto(decoration: TextDecoration.none, fontSize: 10, fontWeight: FontWeight.normal, color: HexColor("#eb9c34")),),


                              ],
                            )
                        ),




                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text("Loan Amount", style: GoogleFonts.roboto(decoration: TextDecoration.none, fontSize: 14, fontWeight: FontWeight.bold, color: HexColor("#eb9c34")),),
                        ),

                        Container(
                            margin: EdgeInsets.only(top:10.0,bottom: 0.0),
                            child:Row(
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

                                Container( width: MediaQuery.of(context).size.width*0.50,
                                  padding: const EdgeInsets.only(left: 12.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                  ), child: Material(
                                    color: Colors.transparent,
                                    child: TextField(
                                      controller: loan,
                                      keyboardType: TextInputType.number,
                                      style: GoogleFonts.roboto(color: Colors.white70),
                                      decoration: InputDecoration(
                                        border:InputBorder.none,
                                        hintText: ' Enter amount in pkr',
                                      ),
                                      autofocus: false,
                                    ),
                                  ),),
                                SizedBox(width: 5.0,),
                                Text("(1 USD = 157.52 pkr)", style: GoogleFonts.roboto(decoration: TextDecoration.none, fontSize: 10, fontWeight: FontWeight.normal, color: HexColor("#eb9c34")),),


                              ],
                            )
                        ),



                        GestureDetector(
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
                                  total=(double.parse(silver.value.text)*130.73) + (double.parse(cash.value.text)) + (double.parse(savings.value.text)) -(double.parse(lended.value.text) + double.parse(loan.value.text));

                                  if(total < 80000.325 ){
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
                                  borderRadius: BorderRadius.all(Radius.circular(10.0), ),
                                  border: Border.all(color: Colors.white54)),
                              child: new Text("Your zakat is ${payable.toInt()} pkr",
                                style: GoogleFonts.roboto(color: Colors.white70, fontSize: 16, decoration: TextDecoration.none),
                                textAlign: TextAlign.center,)),
                        ),


                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Attention", style: GoogleFonts.roboto(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24.0),),
      content: Text("Zakat is only applicable if you have worth of silver 52.5 or more than 52.5 Tolas."),
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
  }
}
