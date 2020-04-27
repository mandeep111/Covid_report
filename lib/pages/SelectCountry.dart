import 'package:covidreport/service/api_covid.dart';
import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';


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
    CovidReport(country: 'south-korea'),
    CovidReport(country: 'japan'),
    CovidReport(country: 'spain'),
    CovidReport(country: 'nepal'),
    CovidReport(country: 'india'),
    CovidReport(country: 'australia'),
    CovidReport(country: 'iran'),
    CovidReport(country: 'canada'),
    CovidReport(country: 'united-kingdom'),
    CovidReport(country: 'china'),
  ];
  ScrollController _semicircleController = ScrollController();

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
    countries.sort((a,b) {
      return a.country.compareTo(b.country);
    });
  }
  @override
  Widget build(BuildContext context) {
    final ScrollController controller = _semicircleController;
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Country'),
        elevation: 0.5,
        backgroundColor: Colors.deepOrange,
      ),
      body:  DraggableScrollbar.semicircle(
        labelTextBuilder: (offset) {
          final int currentItem = offset ~/ 40;
          var letter = currentItem <= countries.length - 1
              ? countries[currentItem].country.substring(0, 1)
              : countries.last.country.substring(0, 1);
          return Text(letter);
        },
         alwaysVisibleScrollThumb: true,
        labelConstraints: BoxConstraints.tightFor(width: 80.0, height: 30.0),
          controller: controller,
        child: ListView.builder(
          controller: controller,
            itemCount: countries.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 3.0),
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
      ),

    );
  }
}
