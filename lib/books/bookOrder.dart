import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islam_app/Video/video.dart';
import 'package:islam_app/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islam_app/dashboard/dashboard.dart';
import 'package:islam_app/order.dart';

import 'package:islam_app/zakat/zakat_silver.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {


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
                                "Order",
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none,
                                    ),
                              ))),
                      GestureDetector(
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
                              Constants.cart_yellow,
                              height: 25.0,
                            )),
                      ),

                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 4),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                           height: MediaQuery.of(context).size.width / 6,
                           width: MediaQuery.of(context).size.width,
                           margin: EdgeInsets.only(top: 10.0, bottom: 8.0) ,
                           padding:EdgeInsets.all(12.0) ,

                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(8.0)),
                             color: HexColor("#eb9c34"),
                           ),
                           child: Row(
                             children: [
                               Text("Total Payment", style: GoogleFonts.roboto(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w700),),
                               Spacer(),
                               Text("500 / Pkr",style: GoogleFonts.roboto(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w700), textAlign: TextAlign.right,),
                             ],
                           ),
                         ),
                        SizedBox(
                          height: 20.0,
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
                           child:  SingleChildScrollView(
                             scrollDirection: Axis.vertical,
                             child: Column(
                               //  direction: Axis.vertical,
                               children: [
                                 Center(child: Text("Payment Details", style: GoogleFonts.roboto(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold))),

                                 Container(
                                   padding: EdgeInsets.only(top:20),
                                   child: TextField(

                                     //   autofocus: true,
                                     style: GoogleFonts.roboto(color: Colors.white, fontSize: 16.0),
                                     cursorColor: HexColor("#eb9c34"),

                                     decoration: InputDecoration(
                                       filled: true,
                                       fillColor: Colors.white12,
                                       focusedBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: HexColor("#eb9c34"), width: 1.0),
                                       ),
                                       enabledBorder: OutlineInputBorder(

                                         borderSide: BorderSide(

                                             color: Colors.white12, width: 0.5),
                                         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                       ),
                                       contentPadding: EdgeInsets.only(top:8, bottom: 8.0, left: 15),

                                       // focusedBorder: UnderlineInputBorder(
                                       //   borderSide: BorderSide(
                                       //       color: Colors.blue, width: 1.0),
                                       // ),
                                       hintText: "Name on Card ",
                                       hintStyle: GoogleFonts.roboto(color: Colors.white54),
                                     ),
                                   ),
                                 ),
                                 Container(
                                   padding: EdgeInsets.only(top:20),
                                   child: TextField(

                                     //   autofocus: true,
                                     style: GoogleFonts.roboto(color: Colors.white, fontSize: 16.0),
                                     cursorColor: HexColor("#eb9c34"),

                                     decoration: InputDecoration(
                                       filled: true,
                                       fillColor: Colors.white12,
                                       focusedBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: HexColor("#eb9c34"), width: 1.0),
                                       ),
                                       enabledBorder: OutlineInputBorder(

                                         borderSide: BorderSide(

                                             color: Colors.white12, width: 0.5),
                                         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                       ),
                                       contentPadding: EdgeInsets.only(top:8, bottom: 8.0, left: 15),

                                       // focusedBorder: UnderlineInputBorder(
                                       //   borderSide: BorderSide(
                                       //       color: Colors.blue, width: 1.0),
                                       // ),
                                       hintText: "Card Number ",
                                       hintStyle: GoogleFonts.roboto(color: Colors.white54),
                                     ),
                                   ),
                                 ),
                                 Row(
                                   children: [
                                     Container(
                                       width:  MediaQuery.of(context).size.width/2.5,
                                       child: Container(
                                         padding: EdgeInsets.only(top:20),
                                         child: TextField(

                                           //   autofocus: true,
                                           style: GoogleFonts.roboto(color: Colors.white, fontSize: 16.0),
                                           cursorColor: HexColor("#eb9c34"),

                                           decoration: InputDecoration(
                                             filled: true,
                                             fillColor: Colors.white12,
                                             focusedBorder: OutlineInputBorder(
                                               borderSide: BorderSide(color: HexColor("#eb9c34"), width: 1.0),
                                             ),
                                             enabledBorder: OutlineInputBorder(

                                               borderSide: BorderSide(

                                                   color: Colors.white12, width: 0.5),
                                               borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                             ),
                                             contentPadding: EdgeInsets.only(top:8, bottom: 8.0, left: 15),

                                             // focusedBorder: UnderlineInputBorder(
                                             //   borderSide: BorderSide(
                                             //       color: Colors.blue, width: 1.0),
                                             // ),
                                             hintText: "MM",
                                             hintStyle: GoogleFonts.roboto(color: Colors.white54),
                                           ),
                                         ),
                                       ),
                                     ),
                                     Spacer(),
                                     Container(
                                       width:  MediaQuery.of(context).size.width/2.5,
                                       child:Container(
                                         padding: EdgeInsets.only(top:20),
                                         child: TextField(

                                           //   autofocus: true,
                                           style: GoogleFonts.roboto(color: Colors.white, fontSize: 16.0),
                                           cursorColor: HexColor("#eb9c34"),

                                           decoration: InputDecoration(
                                             filled: true,
                                             fillColor: Colors.white12,
                                             focusedBorder: OutlineInputBorder(
                                               borderSide: BorderSide(color: HexColor("#eb9c34"), width: 1.0),
                                             ),
                                             enabledBorder: OutlineInputBorder(

                                               borderSide: BorderSide(

                                                   color: Colors.white12, width: 0.5),
                                               borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                             ),
                                             contentPadding: EdgeInsets.only(top:8, bottom: 8.0, left: 15),

                                             // focusedBorder: UnderlineInputBorder(
                                             //   borderSide: BorderSide(
                                             //       color: Colors.blue, width: 1.0),
                                             // ),
                                             hintText: "YY ",
                                             hintStyle: GoogleFonts.roboto(color: Colors.white54),
                                           ),
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                                 Container(
                                   padding: EdgeInsets.only(top:20),
                                   child: TextField(

                                     //   autofocus: true,
                                     style: GoogleFonts.roboto(color: Colors.white, fontSize: 16.0),
                                     cursorColor: HexColor("#eb9c34"),

                                     decoration: InputDecoration(
                                       filled: true,
                                       fillColor: Colors.white12,
                                       focusedBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: HexColor("#eb9c34"), width: 1.0),
                                       ),
                                       enabledBorder: OutlineInputBorder(

                                         borderSide: BorderSide(

                                             color: Colors.white12, width: 0.5),
                                         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                       ),
                                       contentPadding: EdgeInsets.only(top:8, bottom: 8.0, left: 15),

                                       // focusedBorder: UnderlineInputBorder(
                                       //   borderSide: BorderSide(
                                       //       color: Colors.blue, width: 1.0),
                                       // ),
                                       hintText: "Security Code",
                                       hintStyle: GoogleFonts.roboto(color: Colors.white54),
                                     ),
                                   ),
                                 ),
                                 Container(
                                   padding: EdgeInsets.only(top:20),
                                   child: TextField(

                                     //   autofocus: true,
                                     style: GoogleFonts.roboto(color: Colors.white, fontSize: 16.0),
                                     cursorColor: HexColor("#eb9c34"),

                                     decoration: InputDecoration(
                                       filled: true,
                                       fillColor: Colors.white12,
                                       focusedBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: HexColor("#eb9c34"), width: 1.0),
                                       ),
                                       enabledBorder: OutlineInputBorder(

                                         borderSide: BorderSide(

                                             color: Colors.white12, width: 0.5),
                                         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                       ),
                                       contentPadding: EdgeInsets.only(top:8, bottom: 8.0, left: 15),

                                       // focusedBorder: UnderlineInputBorder(
                                       //   borderSide: BorderSide(
                                       //       color: Colors.blue, width: 1.0),
                                       // ),
                                       hintText: "Zip/ Postal Code ",
                                       hintStyle: GoogleFonts.roboto(color: Colors.white54),
                                     ),
                                   ),
                                 ),
                                 SizedBox(height: 5.0,),
                                 Container(
                                   margin: EdgeInsets.only(bottom: 30.0),
                                   padding: EdgeInsets.only(top:20.0),
                                   child: MaterialButton(
                                     minWidth: MediaQuery.of(context).size.width, //  400.0,
                                     height: 40.0,
                                     color: HexColor("#eb9c34"),
                                   //  elevation: 15.0,
                                     child: Text("PAY",
                                       style: GoogleFonts.roboto(
                                         color: Colors.white,
                                         fontSize: 18.0,
                                       ),
                                     ),
                                     shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(8.0)),
                                     // side: BorderSide(color: Colors.red)),
                                     onPressed: () {
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPlacedScreen()));
                                     },
                                   ),
                                 ),


                               ],
                             ),
                          ),
                        )
                        )],
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
