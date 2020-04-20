import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute
        .of(context)
        .settings
        .arguments;
//    print(data);

    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 0, 10),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(
                        context, '/country');
                    if (result != null) {
                      setState(() {
                        data = {
                          'country': result['country'],
                          'confirmed': result['confirmed'],
                          'deaths': result['deaths'],
                          'active': result['active'],
                          'date': result['date']

                        };
                      });
                    }
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.amber,
                    size: 30.0,
                  ),
                  label: Text(
                    'Select Country',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 30.0
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                Text(
                  'Report Date',
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  data['date'],
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Country',
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  data['country'].toString().toUpperCase(),
                  style: TextStyle(
                    fontSize: 35.0,
                    letterSpacing: 2.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Confirmed Cases',
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  data['confirmed'].toString(),
                  style: TextStyle(
                    fontSize: 35.0,
                    letterSpacing: 2.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Deaths',
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  data['deaths'].toString(),
                  style: TextStyle(
                    fontSize: 35.0,
                    letterSpacing: 2.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Active',
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  data['active'].toString(),
                  style: TextStyle(
                    fontSize: 35.0,
                    letterSpacing: 2.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}