import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:islam_app/dashboard/dashboard.dart';
import 'package:islam_app/sign_in.dart';

import 'package:shared_preferences/shared_preferences.dart';



class SignUpAsClient extends StatefulWidget {
  @override
  _Sign_in_as_clientState createState() => _Sign_in_as_clientState();
}

class _Sign_in_as_clientState extends State<SignUpAsClient> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController numbercontrolller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool obscureText = true;
  File image;
  String imProfileBase64;

  bool showLoader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldkey,
      body: Stack(
        children: [
          SizedBox.expand(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Stack(
                      children: <Widget>[
                      /*  Image(
                          image: AssetImage("assets/images/dome_background.png"),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.cover,
                        ),*/
                        Container(
                          color:  HexColor("#145451"),
                            padding: EdgeInsets.only(left: 25.0, right: 25.0),
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: MediaQuery.of(context).size.height*.08,),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 0.0,
                                      bottom: 0.0,
                                      left: 20.0,
                                      right: 20.0),
                                  height:
                                  MediaQuery.of(context).size.height / 5,
                                  width: MediaQuery.of(context).size.width,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Hero(
                                      tag: 'logo',
                                      child: Image(
                                        image: AssetImage("assets/logo.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  //     padding: EdgeInsets.only(left: 25.0),
                                  child: RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                          text: 'Sign',
                                          style: GoogleFonts.roboto(
                                              fontSize: 40,
                                              color: Colors.white),
                                          children: [
                                            TextSpan(
                                                text: ' Up',
                                                style: GoogleFonts.roboto(
                                                    fontSize: 40,
                                                    color:
                                                    Colors.orange),
                                                children: [

                                                ])
                                          ])),
                                ),

                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      // alignment: Alignment.topLeft,
                                      // padding: EdgeInsets.only(top: 0.0),
                                        child: Text(
                                          "Add profile Image",
                                          style: GoogleFonts.roboto(
                                              color: Colors.white,
                                              fontSize: 17.0),
                                        )),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: CircleAvatar(
                                        radius: 40.0,
                                        backgroundColor: Colors.orange,
                                        child: CircleAvatar(
                                          radius: 38.0,
                                          backgroundColor: Colors.black,
                                          child: GestureDetector(
                                            onTap: () {
                                              _getFromGalleryProfile();
                                            },
                                            child: ClipRRect(
                                              child: image != null
                                                  ? Image.file(
                                                File(image.path),
                                                fit: BoxFit.cover,
                                              )
                                                  : Image.asset(
                                                "assets/images/sign_up_profile_image.png",
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(34.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      "First Name",
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 17.0),
                                    )),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter First Name';
                                    }
                                    return null;
                                  },

                                  controller: firstNameController,
                                  //   autofocus: true,
                                  style: GoogleFonts.roboto(
                                      color: Colors.white, fontSize: 16.0),
                                  cursorColor: Colors.orange,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0),
                                    ),
                                    // focusedBorder: UnderlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //       color: Colors.blue, width: 1.0),
                                    // ),
                                    hintText: "Muhammad",
                                    hintStyle:
                                    GoogleFonts.roboto(color: Colors.white54),
                                    prefixIcon: Icon(Icons.person,
                                        size: 16.0,
                                        color: Colors.orange),
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: Text(
                                      "Last Name",
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 17.0),
                                    )),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please last name';
                                    }
                                    return null;
                                  },

                                  controller: lastNameController,
                                  //   autofocus: true,
                                  style: GoogleFonts.roboto(
                                      color: Colors.white, fontSize: 16.0),
                                  cursorColor: Colors.orange,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0),
                                    ),
                                    // focusedBorder: UnderlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //       color: Colors.blue, width: 1.0),
                                    // ),
                                    hintText: "Ali",
                                    hintStyle:
                                    GoogleFonts.roboto(color: Colors.white54),
                                    prefixIcon: Icon(Icons.person,
                                        size: 16.0,
                                        color: Colors.orange),
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: Text(
                                      "Email",
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 17.0),
                                    )),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter email';
                                    } else if (!EmailValidator.validate(
                                        value)) {
                                      return 'Please Enter a Valid email';
                                    }
                                    return null;
                                  },
                                  controller: emailcontroller,
                                  //  autofocus: true,
                                  style: GoogleFonts.roboto(
                                      color: Colors.white, fontSize: 16.0),
                                  cursorColor: Colors.orange,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0),
                                    ),
                                    // focusedBorder: UnderlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //       color: Colors.blue, width: 1.0),
                                    // ),
                                    //hintText: "••••••••••••••••••",
                                    hintText: "Muhammadali123@gmail.com",
                                    hintStyle:
                                    GoogleFonts.roboto(color: Colors.white54),
                                    // suffixIcon: Icon(Icons.visibility_off,
                                    //     size: 16.0, color: HexColor("#0070BF")),
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      size: 16.0,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: Text(
                                      "Number",
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 17.0),
                                    )),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your number';
                                    }
                                    return null;
                                  },
                                  controller: numbercontrolller,
                                  //   autofocus: true,
                                  style: GoogleFonts.roboto(
                                      color: Colors.white, fontSize: 16.0),
                                  cursorColor: Colors.orange,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0),
                                    ),
                                    // focusedBorder: UnderlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //       color: Colors.blue, width: 1.0),
                                    // ),
                                    hintText: "+92-312-5233215",
                                    hintStyle:
                                    GoogleFonts.roboto(color: Colors.white54),
                                    prefixIcon: Icon(Icons.phone_android,
                                        size: 16.0,
                                        color:Colors.orange),
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: Text(
                                      "Password",
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 17.0),
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
                                  style: GoogleFonts.roboto(
                                      color: Colors.white, fontSize: 16.0),
                                  cursorColor:Colors.orange,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0),
                                    ),
                                    // focusedBorder: UnderlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //       color: Colors.blue, width: 1.0),
                                    // ),
                                    hintText: "••••••••••••••••••",
                                    hintStyle:
                                    GoogleFonts.roboto(color: Colors.white54),
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
                                        child: Icon(Icons.visibility,
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
                                Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: Text(
                                      "Confirm Password",
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 17.0),
                                    )),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please Re-Enter New Password";
                                    } else if (value.length < 8) {
                                      return "Password must be atleast 8 characters long";
                                    } else if (value !=
                                        passwordcontroller.text) {
                                      return "Password must be same as above";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: obscureText,
                                  //  autofocus: true,
                                  style: GoogleFonts.roboto(
                                      color: Colors.white, fontSize: 16.0),
                                  cursorColor: Colors.orange,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0),
                                    ),
                                    // focusedBorder: UnderlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //       color: Colors.blue, width: 1.0),
                                    // ),
                                    hintText: "••••••••••••••••••",
                                    hintStyle:
                                    GoogleFonts.roboto(color: Colors.white54),
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
                                            color:Colors.orange),
                                      )
                                          : Container(
                                        width: 16.0,
                                        height: 16.0,
                                        child: Icon(Icons.visibility,
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
                                  height: 10.0,
                                ),
                                Container(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: MaterialButton(
                                      minWidth: 400.0,
                                      height: 40.0,
                                      color: Colors.orange,
                                      elevation: 15.0,
                                      child: Text(
                                        "SIGN UP",
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacement(context, MaterialPageRoute(
                                            builder: (context) =>
                                                Dashboard()
                                          // Speeches()
                                        )
                                        );
                                        String firstName =
                                            firstNameController.text;
                                        String lastName = lastNameController.text;
                                        String email = emailcontroller.text;
                                        String number =
                                            numbercontrolller.text;
                                        String password =
                                            passwordcontroller.text;
                                        if (_formKey.currentState
                                            .validate()) {
                                          setState(() {
                                            showLoader = true;
                                          });

                                       /*   _scaffoldkey.currentState
                                              .showSnackBar(new SnackBar(
                                              content: new Text(
                                                  "Processing Data")));
                                          registerUser(
                                              username,
                                              name,
                                              email,
                                              imProfileBase64,
                                              number,
                                              password)
                                              .then((value) => {
                                            if (value == null)
                                              {
                                                Scaffold.of(context)
                                                    .showSnackBar(
                                                    new SnackBar(
                                                        content:
                                                        new Text(
                                                            "Server Error")))
                                              }
                                            else if (value is String)
                                              {
                                                _scaffoldkey
                                                    .currentState
                                                    .showSnackBar(
                                                    new SnackBar(
                                                        content:
                                                        new Text(
                                                            value)))
                                              }
                                            else
                                              {
                                                GlobalValues.user =
                                                    value,
                                                *//*     SharedPreferences
                                                                .getInstance()
                                                            .then((prefs) {
                                                          prefs.setString(
                                                              'email', email);
                                                          prefs.setString(
                                                              'password',
                                                              password);
                                                        }),*//*
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ClientBottomBar(
                                                                user:
                                                                value))),
                                                Scaffold.of(context)
                                                    .showSnackBar(
                                                    new SnackBar(
                                                        content:
                                                        new Text(
                                                            "Registration successful")))
                                              },
                                            setState(() {
                                              showLoader = false;
                                            })
                                          });*/
                                        } /*else {
                                          _scaffoldkey.currentState
                                              .showSnackBar(new SnackBar(
                                              content: new Text(
                                                  "Please complete all fields")));
                                        }*/
                                      },
                                      //                      print(value.toJson())
                                    )),
                                Container(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.orange, width: 1)),
                                    minWidth: 400.0,
                                    height: 40.0,
                                    color: Colors.black,
                                    elevation: 15.0,
                                    child: RichText(
                                      text: TextSpan(
                                          text: "ALREADY HAVE AN ACCOUNT ",
                                          style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: Colors.white),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "LOGIN",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 14,
                                                  color: Colors.orange),
                                            ),
                                          ]),
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(context, MaterialPageRoute(
                                          builder: (context) =>
                                              SignInAsClient()
                                        // Speeches()
                                      )
                                      );
                                    /*  Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignInAsClient()),
                                      );*/
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                              ],
                            )),
                      ],
                    )),
              ),
            ),
          ),
          Visibility(
              visible: showLoader,
              child: SizedBox.expand(
                child: Container(
                  color: Colors.black26,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.transparent,
                        )),
                  ),
                ),
              ))
        ],
      ),
    );

  }

  _getFromGalleryProfile() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
        imProfileBase64 = base64Encode(image.readAsBytesSync());
        print(imProfileBase64);
      });
    }
  }
}
