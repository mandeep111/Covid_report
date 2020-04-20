import 'package:http/http.dart';
import 'dart:convert';

class CovidReport {
  String country;
  int confirmed;
  int deaths;
  int recovered;
  int active;
  String date;

  CovidReport(
      {this.country,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.active,
      this.date});

  Future<void> getReport() async {
    try {
      Response global = await get('https://api.covid19api.com/summary');
      Map map = jsonDecode(global.body);
      print(map['Global']);
      Response response = await get(
          'https://api.covid19api.com/live/country/$country/status/confirmed');
      List list = jsonDecode(response.body);
      confirmed = list[list.length - 1]['Confirmed'];
      deaths = list[list.length - 1]['Deaths'];
      recovered = list[list.length - 1]['Recovered'];
      active = list[list.length - 1]['Active'];
      date = list[list.length - 1]['Date'];
//      print('Date: $date ,Confirmed cases: $confirmed, Deaths: $deaths, Recovered: $recovered,'
//          'Active: $active');
    } catch (e) {
      print(e);
      deaths = 0;
      confirmed = 0;
      recovered = 0;
      active = 0;
      date = null;
    }
  }
}
