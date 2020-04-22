import 'package:http/http.dart';
import 'dart:convert';

class WorldReport {
  int confirmed;
  int deaths;
  int newDeaths;
  int recovered;
  WorldReport(
      {this.confirmed,
        this.deaths,
        this.newDeaths,
        this.recovered});

  Future<void> getReport() async {
    try {
      Response response = await get(
          'https://api.covid19api.com/summary');
      Map result = jsonDecode(response.body);
      Map map = result['Global'];
//      print(map);
      confirmed = map['TotalConfirmed'];
//      print(confirmed);
      deaths = map['TotalDeaths'];
      newDeaths = map['NewDeaths'];
      recovered = map['TotalRecovered'];
    } catch (e) {
      print(e);
      deaths = 0;
      confirmed = 0;
      newDeaths = 0;
      recovered = 0;
    }
  }
}
