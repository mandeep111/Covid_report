import 'package:covidreport/service/api_covid.dart';
import 'package:flutter/material.dart';

class SelectCountry extends StatefulWidget {
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  List<CovidReport> countries = [
  CovidReport(country: 'italy'),
  CovidReport(country: 'france'),
  CovidReport(country: 'germany'),
  CovidReport(country: 'norway'),
  CovidReport(country: 'korea'),
  CovidReport(country: 'japan'),
  CovidReport(country: 'spain'),
  CovidReport(country: 'nepal'),
  CovidReport(country: 'india'),
  ];

  void updateReport(index) async {
    CovidReport instance = countries[index];
    await instance.getReport();
    Navigator.pop(context, {
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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Country'),
        backgroundColor: Colors.green,
        elevation: 0.5,
      ),
      body: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateReport(index);
                  },
                  title: Text(
                    countries[index].country.toUpperCase(),
                    style: TextStyle(
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
