import 'package:covidreport/pages/Loading.dart';
import 'package:covidreport/pages/SelectCountry.dart';
import 'package:flutter/material.dart';
import 'package:covidreport/pages/Home.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/country': (context) => SelectCountry(),
  },
));







