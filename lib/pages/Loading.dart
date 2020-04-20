import 'package:flutter/material.dart';
import 'package:covidreport/service/api_covid.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupReport() async {
    CovidReport instance = CovidReport(country: 'Nepal');
    await instance.getReport();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'country': instance.country,
      'confirmed': instance.confirmed,
      'deaths': instance.deaths,
      'active': instance.active,
      'date': instance.date
    });
  }
  @override
  void initState() {
    super.initState();
    setupReport();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.redAccent,
          size: 40.0,
        ),
      ),
    );
  }
}
