import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cognition_package_demo_app/cognition_page.dart';

/// A page for collecting demographics data from test users.
///
/// Only used when this app is used for cognitive testing. Not part
/// of the demo app.
class UserDemographicsPage extends StatefulWidget {
  @override
  UserDemographicsPageState createState() => UserDemographicsPageState();
}

class UserDemographicsPageState extends State<UserDemographicsPage> {
  int? age;
  String? gender;
  String? name;
  String? location;
  final DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 60, right: 60, top: 40),
                  child: Text(
                    'Please enter your details before starting the survey',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 25, bottom: 10, top: 20),
                    child: Row(children: <Widget>[
                      Text(
                        'Full name',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      )
                    ])),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                    child: TextField(
                      onChanged: (text) {
                        name = text;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your name'),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 25, bottom: 10, top: 20),
                    child: Row(children: <Widget>[
                      Text(
                        'Age',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      )
                    ])),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                    child: TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(signed: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (ageNum) {
                        age = int.parse(ageNum);
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your age'),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 25, bottom: 10, top: 20),
                    child: Row(children: <Widget>[
                      Text(
                        'Location',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      )
                    ])),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                    child: TextField(
                      onChanged: (loc) {
                        location = loc;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter place of survey & city'),
                    )),
                Container(height: 50),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffC32C39),
                  fixedSize: const Size(300, 60),
                ),
                child: Text(
                  'Continue to Survey',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<dynamic>(
                      builder: (context) => CognitionPage(
                          age: age,
                          name: name,
                          location: location,
                          date: today)));
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 25, right: 25),
                child: Column(
                  children: <Widget>[
                    Text(
                      'By continuing I confirm that I have read and agree to this',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(height: 5),
                    Text(
                      'informed consent',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16, decoration: TextDecoration.underline),
                    ),
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
