import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:io' show Platform;

class login extends StatefulWidget {
  bool swichsign;

  login({this.swichsign});

  @override
  _loginState createState() => _loginState(swichsign);
}

class _loginState extends State<login> {
  bool swichsign;

  _loginState(this.swichsign);

  final emailcontrol = TextEditingController();

  // final numberController = TextEditingController();
  String password = '';
  String email = '';
  String number;

  String address;

  String username;
  bool bpassword;

  @override
  Widget buildtextfield(IconData icon, String hintText, bool bpassword,
      bool bemail, bool bnumber, bool baddress, bool paswordverfiy) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
          validator: MultiValidator(
            [
              RequiredValidator(errorText: "required*"),
              bemail ? EmailValidator(errorText: "enter a valid email") : null,
              bpassword
                  ? MinLengthValidator(7, errorText: " at least 7 character ")
                  : null,
            ],
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: bemail ? emailcontrol : null,
          textInputAction: TextInputAction.done,
          obscureText: bpassword,
          //onChanged: ,
          keyboardType:
              bemail ? TextInputType.emailAddress : TextInputType.text,
          autofillHints: [AutofillHints.email],
          decoration: InputDecoration(
              prefixIcon: Icon(icon),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              contentPadding: EdgeInsets.all(10),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey))),
    );
  }

  Container bsign() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          //buildtextfield(Icons.person, 'User Name', false, false, false, false, false),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  Pattern pattern = r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
                  RegExp regex = new RegExp(pattern); //check for asking
                  if (value.isEmpty)
                    return 'required*';
                  else if (!regex.hasMatch(value))
                    return 'Invalid username';
                  else
                    return null;
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'User Name',
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey))),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: MultiValidator([
                  RequiredValidator(
                    errorText: "required*",
                  ),
                  EmailValidator(errorText: "enter a valid email")
                ]),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline_sharp),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey))),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: RequiredValidator(errorText: 'required*'),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.home),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Address',
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey))),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                validator: RequiredValidator(errorText: 'required*'),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'phone number',
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey))),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:MultiValidator(
                    [        RequiredValidator(errorText: "required*"),
                                MinLengthValidator(7, errorText: " at least 7 character ")

                        ]),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'password',
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey))),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  Pattern pattern = r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
                  RegExp regex = new RegExp(pattern); //check for asking
                  if (value.isEmpty)
                    return 'required';
                  else if (!regex.hasMatch(value))
                    return 'Invalid username';
                  else
                    return null;
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'verify your Password',
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey))),
          ),

          // Text('$bpassword'),
          //Text('$password'),
          //Text('$address')
        ],
      ),
    );
  }

  Container blogin() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildtextfield(Icons.mail_outline_sharp, 'Email', false, true, false,
              false, false),
          buildtextfield(Icons.lock_outline, '************', true, false, false,
              false, false)
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/slider.png'),
                      fit: BoxFit.fill)),
            ),
          ),
          AnimatedPositioned(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              top: swichsign ? 200 : 230,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 700),
                curve: Curves.bounceInOut,
                height: swichsign ? 500 : 300,
                width: MediaQuery.of(context).size.width - 40,
                //explain test case
                margin: EdgeInsets.symmetric(horizontal: 20),
                //explain test case
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.black.withOpacity(0.3), //explain test case
                        blurRadius: 15, //explain test case
                        spreadRadius: 5, //explain test case
                      ),
                    ]),
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  swichsign = false;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: !swichsign
                                          ? Colors.indigo
                                          : Colors.grey,
                                    ),
                                  ),
                                  if (!swichsign)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  swichsign = true;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    'SIGNUP',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: swichsign
                                          ? Colors.indigo
                                          : Colors.grey,
                                    ),
                                  ),
                                  if (swichsign)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            )
                          ],
                        ),
                        if (swichsign) bsign(),
                        /* if(!swichsign)
                          blogin(),*/
                        Container(
                            width: 200,
                            margin: EdgeInsets.only(top: 20),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text:
                                      swichsign ? "have an account ? " : "or ",
                                  style: TextStyle(color: Colors.grey),
                                  children: [
                                    TextSpan(
                                      //recognizer: ,
                                      text: swichsign ? "login" : "sign up",
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  ]),
                            ))
                      ],
                    ),
                  ),
                ),
              )),
          AnimatedPositioned(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              top: swichsign ? 650 : 460,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  height: 90,
                  width: 90,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.tealAccent, Colors.blue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      child: Center(
                          child: Text(
                        swichsign ? 'sign up' : 'login',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
