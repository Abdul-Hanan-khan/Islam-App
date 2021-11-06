import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islam_app/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islam_app/dashboard/dashboard.dart';
import 'package:islam_app/prayernew.dart';
import 'package:islam_app/zakat/zakat_silver.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tasbi extends StatefulWidget {

  @override
  _TasbiState createState() => _TasbiState();
}

class _TasbiState extends State<Tasbi> {
  int value;
  TextEditingController controller = TextEditingController();
   getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Return int
    int intValue= await prefs.getInt('intValue') ?? 0;
    this.value = intValue;
    return intValue;
  }
  addIntToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('intValue', value);
  }
  resetValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setInt("intValue", 0);
this.value=0;

  }
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefValue) => {
      setState(() {
        value = prefValue.getInt('intValue')?? 0;
      })
    });
    print("init $value");
    super.initState();

  }
  //color: HexColor("#eb9c34"),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
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
                Expanded(child: Center(child: Text("Tasbi", style: GoogleFonts.roboto(color: Colors.white, fontSize: 18.0, decoration: TextDecoration.none,),))),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
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
               // Navigator.push(context, MaterialPageRoute(builder: (context) => PrayerNewScreen()));
              },
              child: Container(
                margin: EdgeInsets.only(top: 60, bottom:20),
                child: Column(
                  children: <Widget>[
                    Container(
                      //  color: Colors.white,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 20),
                        child: Center(
                            child: Text(
                              "",
                              style: GoogleFonts.roboto(
                                color: HexColor("#eb9c34"),
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                              ),
                            ))),
                    Container(
                        child: Center(
                            child: Text(
                              "",
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
              //padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text("Darood", style: GoogleFonts.roboto(decoration: TextDecoration.none, fontSize: 28, fontWeight: FontWeight.w600, color: HexColor("#eb9c34")),),
                    Container(
                      margin: EdgeInsets.only(top: 8, bottom:50),
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.black26,
                      ),
                      child:   Text(value.toString(), style: GoogleFonts.roboto(decoration: TextDecoration.none, fontSize: 32, fontWeight: FontWeight.bold,color: HexColor("#eb9c34")),),

                    ),
                    /*SizedBox(height: 10.0,),*/
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(children: [
                    /*  GestureDetector(
                        onTap: (){
                          setState(() {
                           resetValues();
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom:20),
                          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                          decoration: BoxDecoration(

                            border: Border.all(
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: Colors.black26,
                          ),
                          child:   Row(
                            children: [
                              Icon(Icons.cancel, color: Colors.red, size:  14),
                              SizedBox(width: 10.0,),
                              Text("Reset", style: GoogleFonts.roboto(decoration: TextDecoration.none, fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white70),),
                            ],
                          ),

                        ),
                      ),*/

                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/3.2),
                        child: GestureDetector(
                          onTap: (){
                            showAlertDialog(context);
                          },
                          child: Container(

                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 10, bottom:20),
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                            decoration: BoxDecoration(

                              border: Border.all(
                                color: Colors.black26,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                              color: Colors.black26,
                            ),
                            child:   Row(
                              children: [
                                Icon(Icons.add_box, color: Colors.white, size:  14),
                                SizedBox(width: 10.0,),
                                Text("Add count", style: GoogleFonts.roboto(decoration: TextDecoration.none, fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white70),),
                              ],
                            ),

                          ),
                        ),
                      ),
                    ],),
                  ),
                    SizedBox(height: 20.0,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          if(value < 9999) {
                            value++;
                          }
                          else{
                            value=0;
                            resetValues();
                          }
                          addIntToSF();
                        });
                      },
                      child: CircleAvatar(
                        radius: 120,
                        backgroundColor: HexColor("#eb9c34").withOpacity(.30),
                        child: CircleAvatar(
                         backgroundColor: HexColor("#eb9c34").withOpacity(.50),
                          radius: 100,
                          child: CircleAvatar(
                              radius: 80,
                              backgroundColor: HexColor("#eb9c34").withOpacity(.75),
                              child: CircleAvatar(
                                backgroundColor: HexColor("#eb9c34").withOpacity(.1),
                                radius: 60,
                                child: Icon(Icons.add, size: 80, color: Colors.black54,),

                              ),
                      ),
                        )
                      ),
                    ),

                  ],
                )

            ),
          ],
        ),
      )
          ],
        ),
    );
  }


  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
    color: HexColor("#eb9c34"),
      child: Text("OK", style: GoogleFonts.roboto(color:Colors.white),),
      onPressed: () {

        (int.parse(controller.value.text)+value)>9999?this.value=(int.parse(controller.value.text)+value)-9999:this.value= int.parse(controller.value.text)+value;
      setState(() {
        addIntToSF();
      });
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Counter", style: GoogleFonts.roboto(color: Colors.black , fontWeight: FontWeight.bold, fontSize: 24.0),),
      content: Container(
        height: 150,
        child: Column(
          children: [
            Text("How much dareood count you want to enter at once."),
            SizedBox(height: 10.0,),
            TextField(
              onChanged: (value) { },
             controller: controller,
              maxLength: 4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "How much darood you read?"),
            ),
          ],
        ),
      ),
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
