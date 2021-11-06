import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islam_app/books/bookOrder.dart';
import 'package:islam_app/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islam_app/dashboard/dashboard.dart';
import 'package:islam_app/prayernew.dart';
import 'package:islam_app/zakat/zakat_silver.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:auto_size_text/auto_size_text.dart';

class BooksCategory extends StatefulWidget {
  @override
  _BooksCategoryState createState() => _BooksCategoryState();
}

class _BooksCategoryState extends State<BooksCategory> {
  List<String> Book_titles = [
    "Book Name",
    "Book Name",
    "Book Name",
    "Book Name",
  ];
  List<String> Book_pic = [
    Constants.book_pic,
    Constants.book_pic,
    Constants.book_pic,
    Constants.book_pic
  ];
  List<String> Book_desc = [
    Constants.desc,
    Constants.desc,
    Constants.desc,
    Constants.desc,
  ];
  String _isSelected = 'Islamic';
  String _color = '#8c8c8c';
  String _textColor = '#1a1919';
  String _getButtonColor(String color){
    if(  color== '#eb9c34'){
      _color= '#8c8c8c';

    }
    else {
      _color = '#eb9c34';
    }
    return _color;
  }
  String _getTextColor(String color){
    if(  color== '#1a1919'){
      _textColor= '#f5f2f2';

    }
    else {
      _textColor = '#1a1919';
    }
    return _textColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                     ),
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Order()),
                            );
                          },
                          child: Container(
                              alignment: Alignment.topRight,
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
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
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
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width - 120,
                                        padding: const EdgeInsets.only(left: 12.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            )),
                                        child: TextField(
                                          style: GoogleFonts.roboto(color: Colors.white),
                                          decoration: InputDecoration(
                                            icon: new Icon(Icons.search),
                                            border: InputBorder.none,
                                            hintText: 'Enter Books here..',
                                          ),
                                          autofocus: false,
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
                                              /*...*/
                                            },
                                            child: Image.asset(
                                              Constants.filter,
                                              width: 25,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        //code here
                                      },
                                    ),

                                  ],
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 16.0),
                                    child: Row(
                                      children: [
                                        Container(
                                            child: Text("Select Category", style: GoogleFonts.roboto(color: HexColor("#eb9c34"), fontSize: 14, fontWeight: FontWeight.bold  ))
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              _isSelected = 'Islamic';
                                            });
                                          },
                                          child: Container(
                                              child: Text("Reset", style: GoogleFonts.roboto(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500  ))
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 72.0,
                                      child: RaisedButton(

                                        color: HexColor(_color),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), ),
                                        onPressed: () {
                                          setState(() {
                                            _isSelected = 'Islamic';
                                            _color=_getButtonColor(_color);
                                            _textColor = _getTextColor(_textColor);
                                          });
                                        },
                                        child: Text("Islamic", style: GoogleFonts.roboto(color: HexColor(_textColor), fontSize: 12),),
                                      ),
                                    ),
                                    Container(
                                        height: 30.0,
                                        width: 72.0,
                                        child: RaisedButton(

                                          color: HexColor(_color),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), ),
                                          onPressed: () {
                                            setState(() {
                                              _isSelected = 'History';
                                              _color=_getButtonColor(_color);
                                              _textColor = _getTextColor(_textColor);
                                            });
                                          },
                                          child: Text("History", style: GoogleFonts.roboto(color: HexColor(_textColor), fontSize: 12),),
                                        )
                                    ),
                                    Container(
                                        height: 30.0,
                                        width: 72.0,
                                        child: RaisedButton(

                                          color: HexColor(_color),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), ),
                                          onPressed: () {
                                            setState(() {
                                              _isSelected = 'Hades';
                                              _color=_getButtonColor(_color);
                                              _textColor = _getTextColor(_textColor);
                                            });
                                          },
                                          child: Text("Hades", style: GoogleFonts.roboto(color: HexColor(_textColor), fontSize: 12),),
                                        )
                                    ),
                                    Container(
                                        height: 30.0,
                                        width: 72.0,
                                        child: RaisedButton(

                                          color: HexColor(_color),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), ),
                                          onPressed: () {
                                            setState(() {
                                              _isSelected = 'Islamic';
                                              _color=_getButtonColor(_color);
                                              _textColor = _getTextColor(_textColor);
                                            });
                                          },
                                          child: Text("Islamic", style: GoogleFonts.roboto(color: HexColor(_textColor), fontSize: 12),),
                                        )
                                    ),


                                  ],),
                                SizedBox(height: 10.0,),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 72.0,
                                      child: RaisedButton(

                                        color: HexColor(_color),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), ),
                                        onPressed: () {
                                          setState(() {
                                            _isSelected = 'Islamic';
                                            _color=_getButtonColor(_color);
                                            _textColor = _getTextColor(_textColor);
                                          });
                                        },
                                        child: Text("Islamic", style: GoogleFonts.roboto(color: HexColor(_textColor), fontSize: 12),),
                                      ),
                                    ),
                                    Container(
                                        height: 30.0,
                                        width: 72.0,
                                        child: RaisedButton(

                                          color: HexColor(_color),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), ),
                                          onPressed: () {
                                            setState(() {
                                              _isSelected = 'History';
                                              _color=_getButtonColor(_color);
                                              _textColor = _getTextColor(_textColor);
                                            });
                                          },
                                          child: Text("History", style: GoogleFonts.roboto(color: HexColor(_textColor), fontSize: 12),),
                                        )
                                    ),
                                    Container(
                                        height: 30.0,
                                        width: 72.0,
                                        child: RaisedButton(

                                          color: HexColor(_color),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), ),
                                          onPressed: () {
                                            setState(() {
                                              _isSelected = 'Hades';
                                              _color=_getButtonColor(_color);
                                              _textColor = _getTextColor(_textColor);
                                            });
                                          },
                                          child: Text("Hades", style: GoogleFonts.roboto(color: HexColor(_textColor), fontSize: 12),),
                                        )
                                    ),
                                    Container(
                                        height: 30.0,
                                        width: 72.0,
                                        child: RaisedButton(

                                          color: HexColor(_color),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), ),
                                          onPressed: () {
                                            setState(() {
                                              _isSelected = 'Islamic';
                                              _color=_getButtonColor(_color);
                                              _textColor = _getTextColor(_textColor);
                                            });
                                          },
                                          child: Text("Islamic", style: GoogleFonts.roboto(color: HexColor(_textColor), fontSize: 12),),
                                        )
                                    ),


                                  ],),


                                SizedBox(height: 20.0,),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [

                                    Container(
                                        height: 30.0,
                                        width: 80.0,
                                        child: RaisedButton(

                                          color: Colors.black87.withOpacity(0.4),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), ),
                                          onPressed: () {
                                            setState(() {

                                            });
                                          },
                                          child: Text("Cancel", style: GoogleFonts.roboto(color: Colors.white, fontSize: 12),),
                                        )
                                    ),
                                    SizedBox(width: 10.0,),
                                    Container(
                                        height: 30.0,
                                        width: 80.0,
                                        child: RaisedButton(

                                          color: HexColor('#08c217'),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), ),
                                          onPressed: () {
                                            setState(() {

                                            });
                                          },
                                          child: Text("Apply", style: GoogleFonts.roboto(color: Colors.white, fontSize: 12),),
                                        )
                                    ),


                                  ],),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Expanded(
                            child: Container(
                              //   height: 400,
                              padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 12),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                color: Colors.black26,
                              ),
                              child: Container(
                                padding: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white24,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  color: Colors.transparent,
                                ),
                                child: ListView.builder(
                                    physics: AlwaysScrollableScrollPhysics(),
                                    reverse: true,
                                    itemCount: Book_titles.length ,
                                    itemBuilder: (BuildContext ctxt, int index) {
                                      return GestureDetector(
                                        onTap: (){
                                          /* Navigator.push(context, MaterialPageRoute(builder: (context)=> Video()));*/
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
                                                    top: 8.0,
                                                    right: 5.0,
                                                    left: 5.0,
                                                    bottom: 8),
                                                alignment: Alignment.topLeft,
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Container(

                                                      margin: EdgeInsets.only(
                                                          right: 5.0 ),
                                                      decoration: BoxDecoration(

                                                        borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8.0)),
                                                        //  border: Border.all(),
                                                        image: new DecorationImage(
                                                          image: new AssetImage(
                                                              Book_pic[index]),
                                                          fit: BoxFit.fill
                                                          ,
                                                        ),
                                                        color: Colors.white12,
                                                      ),
                                                      height: 100.0,
                                                      width: 80.0,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(Book_titles[index],
                                                                  style: GoogleFonts.roboto(
                                                                      color: HexColor(
                                                                          "#eb9c34"),
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                              SizedBox(width: 8.0,),
                                                              GestureDetector(

                                                                onTap: (){

                                                                },
                                                                child: Container(
                                                                  height: 12.0,
                                                                  width: 40.0,
                                                                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                                                                  decoration: BoxDecoration(
                                                                      color: HexColor("#32a89e"),
                                                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                                                  ),
                                                                  child: Center(child: Text("Read book", style: GoogleFonts.roboto(color: Colors.white, fontSize: 7),)),
                                                                ),
                                                              ),
                                                              Spacer(),
                                                              GestureDetector(
                                                                  onTap: (){
                                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Order()));

                                                                  },
                                                                  child: Image.asset(Constants.cart, width: 25.0,))
                                                            ],
                                                          ),
                                                          Container(
                                                              margin: EdgeInsets.only(
                                                                  top: 2.0,
                                                                  bottom: 2.0),
                                                              child: Text(
                                                                  Book_desc[index],
                                                                  style: GoogleFonts.roboto(
                                                                      color:
                                                                      Colors.white70,
                                                                      fontSize: 11
                                                                  ))),
                                                          Row(
                                                            children: [
                                                              Image.asset(Constants.star, width: 16.0,),
                                                              SizedBox(width: 2.0,),
                                                              Text("4.8 (120+)", style: GoogleFonts.roboto(color:Colors.white, decoration: TextDecoration.none, fontSize: 10.0),),
                                                              Spacer(),
                                                              GestureDetector(

                                                                onTap: (){

                                                                },
                                                                child: Container(
                                                                  height: 18.0,
                                                                  width: 46.0,
                                                                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                                                                  decoration: BoxDecoration(
                                                                      color: Colors.transparent,
                                                                      border: Border.all(color: Colors.white, width: 1.5),
                                                                      borderRadius: BorderRadius.all(Radius.circular(20),)
                                                                  ),
                                                                  child: Center(child: Text("500/Pkr", style: GoogleFonts.roboto(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w500 ),)),
                                                                ),
                                                              ),
                                                              SizedBox(width: 5.0,),
                                                              GestureDetector(

                                                                onTap: (){
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Order()));
                                                                },
                                                                child: Container(
                                                                  height: 18.0,
                                                                  width: 46.0,
                                                                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                                                                  decoration: BoxDecoration(
                                                                      color: HexColor('#08c217'),
                                                                      //border: Border.all(color: Colors.white, width: 1.5),
                                                                      borderRadius: BorderRadius.all(Radius.circular(20),)
                                                                  ),
                                                                  child: Center(child: Text("Buy Now", style: GoogleFonts.roboto(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w500 ),)),
                                                                ),
                                                              ),

                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      );
                                    }),
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
      ),
    );
  }
}
