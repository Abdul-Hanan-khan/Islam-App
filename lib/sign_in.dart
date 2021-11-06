import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islam_app/dashboard/dashboard.dart';
import 'package:islam_app/signup.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import'package:google_fonts/google_fonts.dart';

import 'api/userLoginApi.dart';
import 'global.dart';
import 'model/user.dart';


class SignInAsClient extends StatefulWidget {
  @override
  SignInAsClientState createState() => SignInAsClientState();
}

class SignInAsClientState extends State<SignInAsClient> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool obscureText = true;

  bool selected = true;
  bool showDialog = false;

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Scaffold(
        key: _scaffoldkey,
        body: Stack(
          children: [
            SizedBox.expand(
              child: Form(
                key: _formKey,
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: <Widget>[

                        Container(
                            padding: EdgeInsets.only(left: 25.0, right: 25.0),
                            alignment: Alignment.topLeft,
                            color:  HexColor("#145451"),
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 40.0,
                                        left: 20.0,
                                        right: 20.0,
                                        bottom: 30.0),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/4,
                                    // color: Colors.white,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Hero(
                                        tag: 'logo',
                                        child: Image(
                                          image: AssetImage("assets/logo.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        // color: Colors.pink,
                                        //  height: cheight/10,
                                        width: MediaQuery.of(context).size.width,

                                        margin: EdgeInsets.only(top: 10.0),
                                        alignment: Alignment.bottomLeft,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            AutoSizeText(
                                              'Sign',
                                              style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontSize: 35.0,
                                                letterSpacing: 2.0,
                                              ),
                                              maxFontSize: 50.0,
                                              minFontSize: 20.0,
                                            ),
                                            AutoSizeText(
                                              ' In',
                                              style: GoogleFonts.roboto(
                                                  color: Colors.orange,
                                                  letterSpacing: 2.0,
                                                  fontSize: 35.0),
                                              maxFontSize: 50.0,
                                              minFontSize: 20.0,
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Dashboard()));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.orange.withOpacity(0.30),
                                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                ),
                                                child: AutoSizeText(
                                                  "Skip",
                                                  style: GoogleFonts.roboto(
                                                    color: Colors.white,

                                                  ),
                                                  maxFontSize: 25.0,
                                                  minFontSize: 10.0,
                                                  overflow: TextOverflow.ellipsis,

                                                ),
                                              ),
                                            ),

                                            // Spacer(),
                                          ],
                                        ),
                                      ),

                                      Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.only(top: 20.0),
                                          child: AutoSizeText(
                                            "Email",
                                            style: GoogleFonts.roboto(
                                              color: Colors.white,
                                            ),
                                            maxFontSize: 17.0,
                                            minFontSize: 10.0,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                      TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter email';
                                          }
                                          return null;
                                        },
                                        controller: emailcontroller,

                                        //   autofocus: true,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0),
                                        cursorColor: Colors.orange,
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1.0),
                                          ),
                                          // focusedBorder: UnderlineInputBorder(
                                          //   borderSide: BorderSide(
                                          //       color: Colors.blue, width: 1.0),
                                          // ),
                                          hintText: "Muhammadali123@gmail.com",
                                          hintStyle:
                                          TextStyle(color: Colors.white54),
                                          prefixIcon: Icon(Icons.mail_outline,
                                              size: 16.0,
                                              color: Colors.orange),
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.only(top: 20.0),
                                          child: AutoSizeText(
                                            "Password",
                                            style: GoogleFonts.roboto(
                                              color: Colors.white,
                                            ),
                                            maxFontSize: 17.0,
                                            minFontSize: 10.0,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                      TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter password';
                                          }
                                          return null;
                                        },
                                        controller: passwordcontroller,
                                        obscureText: obscureText,
                                        //  autofocus: true,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0),
                                        cursorColor: Colors.white,
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1.0),
                                          ),
                                          // focusedBorder: UnderlineInputBorder(
                                          //   borderSide: BorderSide(
                                          //       color: Colors.blue, width: 1.0),
                                          // ),
                                          hintText: "••••••••••••••••••",
                                          hintStyle:
                                          TextStyle(color: Colors.white54),
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                obscureText = !obscureText;
                                              });
                                            },
                                            child: obscureText == true
                                                ? Container(
                                              width: 16.0,
                                              height: 16.0,
                                              child: Icon(
                                                  Icons.visibility_off,
                                                  size: 16.0,
                                                  color: Colors.orange),
                                            )
                                                : Container(
                                              width: 16.0,
                                              height: 16.0,
                                              child: Icon(
                                                  Icons.visibility,
                                                  size: 16.0,
                                                  color: Colors.orange),
                                            ),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            size: 16.0,
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                              height: 25,
                                              width: 25,
                                              /*  decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: HexColor(
                                                          '#0070BF'),
                                                      width: 1)),*/
                                              child: RoundCheckBox(
                                                checkedColor:
                                                Colors.orange,
                                                isChecked: selected,
                                                size: 25,
                                                uncheckedColor:
                                                Colors.transparent,
                                                onTap: (val) {
                                                  setState(() {
                                                    selected = !selected;
                                                  });
                                                },
                                              )),
                                          Expanded(
                                              flex: 8,
                                              child: GestureDetector(
                                                  child: AutoSizeText(
                                                      "  Remember Me",
                                                      style: GoogleFonts.roboto(
                                                        color: Colors.white,
                                                      ),
                                                      maxFontSize: 25.0,
                                                      minFontSize: 10.0,
                                                      overflow: TextOverflow
                                                          .ellipsis))),
                                          Spacer(flex: 2),
                                          Expanded(
                                            flex: 8,
                                            child: GestureDetector(
                                              onTap: () {
                                               /* Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ForgetPassword()));*/
                                              },
                                              child: AutoSizeText(
                                                "Forget Password?",
                                                style: GoogleFonts.roboto(
                                                  color: Colors.white,
                                                ),
                                                maxFontSize: 25.0,
                                                minFontSize: 10.0,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 20.0),
                                        child: MaterialButton(
                                          minWidth:
                                          MediaQuery.of(context).size.width,
                                          //  400.0,
                                          height: 40.0,
                                          color: Colors.orange,
                                          elevation: 15.0,
                                          child: AutoSizeText(
                                            "LOGIN",
                                            style: GoogleFonts.roboto(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxFontSize: 18.0,
                                            minFontSize: 10.0,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                         /*onPressed: (){
                                           Navigator.pushReplacement(context, MaterialPageRoute(
                                               builder: (context) =>
                                                   Dashboard()
                                             // Speeches()
                                           )
                                           );
                                         },*/
                                          onPressed: () {
                                            String email = emailcontroller.text;
                                            String password =
                                                passwordcontroller.text;

                                            if (_formKey.currentState
                                                .validate()) {
                                              setState(() {
                                                showDialog = true;
                                              });
                                              _scaffoldkey.currentState
                                                  .showSnackBar(new SnackBar(
                                                  content: new Text(
                                                      "Processing Data")));
                                              loginUser(email, password)
                                                  .then((value) {
                                                if (value == null) {
                                                  _scaffoldkey.currentState
                                                      .showSnackBar(new SnackBar(
                                                      content: new Text(
                                                          "wrong credentials")));
                                                } else if (value is String) {
                                                  _scaffoldkey.currentState
                                                      .showSnackBar(
                                                      new SnackBar(
                                                          content: new Text(
                                                              value)));
                                                } else {
                                                  if ((value as User).role ==
                                                      1) {
                                                    GlobalValues.user = value;
                                                    if (selected) {
                                                      SharedPreferences
                                                          .getInstance()
                                                          .then((prefs) {
                                                        prefs.setString(
                                                            'email', email);
                                                        prefs.setString(
                                                            'password',
                                                            password);
                                                      });
                                                    }

                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Dashboard(

                                                                )));
                                                  } else if ((value as User)
                                                      .role ==
                                                      2) {
                                                    GlobalValues.user = value;
                                                    if (selected) {
                                                      SharedPreferences
                                                          .getInstance()
                                                          .then((prefs) {
                                                        prefs.setString(
                                                            'email', email);
                                                        prefs.setString(
                                                            'password',
                                                            password);
                                                      });
                                                    }

                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                              return Dashboard(
                                                               // user: value,
                                                              );
                                                            }));
                                                  }
                                                }

                                                setState(() {
                                                  showDialog = false;
                                                });
                                              });
                                            } else {
                                              _scaffoldkey.currentState
                                                  .showSnackBar(new SnackBar(
                                                  content: new Text(
                                                      "Please complete all fields", style: GoogleFonts.roboto(color: Colors.redAccent),)));
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 4.0),
                                        child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Colors.orange,
                                                  width: 1)),
                                          minWidth:
                                          MediaQuery.of(context).size.width,
                                          height: 40.0,
                                          color: Colors.black,
                                          elevation: 15.0,
                                          child: AutoSizeText(
                                            "SIGN UP",
                                            style: GoogleFonts.roboto(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxFontSize: 18.0,
                                            minFontSize: 10.0,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignUpAsClient()));
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),

                                      /* Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 10,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(top: 12.0),
                                              child: MaterialButton(
                                                minWidth: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.4,
                                                height: 35.0,
                                                color: HexColor("#0070BF"),
                                                elevation: 15.0,
                                                child: AutoSizeText(
                                                  "Login With Facebook",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  maxFontSize: 12.0,
                                                  minFontSize: 8.0,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 10.0,
                                          // ),
                                          Spacer(flex: 1),
                                          Expanded(
                                            flex: 10,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(top: 12.0),
                                              child: MaterialButton(
                                                minWidth: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.4,
                                                //150.0,
                                                height: 37.0,

                                                color: HexColor("#E34133"),
                                                elevation: 15.0,
                                                child: AutoSizeText(
                                                  "Login With Google",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  maxFontSize: 12.0,
                                                  minFontSize: 8.0,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),*/
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        // FutureBuilder<login>(
                        //     future: futurelogin,
                        //     builder: (context, snapshot) {
                        //       if (snapshot.hasData) {
                        //         return Text(snapshot.data.name);
                        //       } else if (snapshot.hasError) {
                        //         return Text("${snapshot.error}");
                        //       }
                        //       return CircularProgressIndicator();
                        //     }
                        //     //}
                        //     )
                      ],
                    )),
              ),
            ),
            Visibility(
                visible: showDialog,
                child: SizedBox.expand(
                  child: Container(
                    color: Colors.black26,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.orange,
                          )),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
