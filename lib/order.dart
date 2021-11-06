import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islam_app/constants/constants.dart';
import 'package:islam_app/dashboard/dashboard.dart';

class OrderPlacedScreen extends StatefulWidget {
  @override
  _OrderPlacedScreenState createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: SafeArea(
child: Scaffold(
  body: Stack(
    children: <Widget>[
      Container(
        //  color: Colors.green,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          Constants.dome_bg,
          fit: BoxFit.fill,
        ),
      ),


Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    SizedBox(
      height: 150,
    ),
        Container(
      decoration: BoxDecoration(
          color: HexColor('#15524E'),
          borderRadius: BorderRadius.all(Radius.circular(15.0))
      ),
      height: 300,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left:30.0, right: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Order Placed !',

                style: TextStyle(
                  color: HexColor('#FFE600'),
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text('Your Order is on Way...',

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('THANK',
                    style: TextStyle(
                      color: HexColor('#FDA32C'),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text('  YOU !',

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ],
              ),

            ],
          ),
    ),

  ],
),


      Align(
        alignment: Alignment.topCenter,

        child: Container(
          margin: EdgeInsets.only(top: 190 ),
          height: 150,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: HexColor('#2C726E'),width: 8),
color: Colors.transparent
          ),
child: Container(
  alignment: Alignment.center,
  // padding: EdgeInsets.all(20.0),
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(color: Colors.white,width: 8),
color: HexColor('#FDA32C')
  ),
  child: Icon(
    Icons.check,
    color: Colors.white,
    size: 50,

  )
),
        ),

      ),
      
      
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));

        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(

            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
height: 50,
            margin: EdgeInsets.only(left: 20, right: 20,bottom: 20),
            decoration: BoxDecoration(
                color: HexColor('#FDA32C'),
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            child: Text(
              'BACK TO HOME',
              style: TextStyle(
                color: Colors.white
              ),
            ),
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
