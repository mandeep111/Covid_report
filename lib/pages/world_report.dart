import 'package:flutter/material.dart';

class World extends StatefulWidget {
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute
        .of(context)
        .settings
        .arguments;
//    print(data);

    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text('World Report'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(70, 60, 0, 10),
              child: Column(
                children: <Widget>[
                  Text(
                    'Total Confirmed',
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    data['confirmed'].toString(),
                    style: TextStyle(
                      fontSize: 35.0,
                      letterSpacing: 2.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    'Total Deaths',
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    data['deaths'].toString(),
                    style: TextStyle(
                      fontSize: 35.0,
                      letterSpacing: 2.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    'New Deaths',
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.0,),

                  Text(
                    data['newDeaths'].toString(),
                    style: TextStyle(
                      fontSize: 35.0,
                      letterSpacing: 2.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    'Total Recovered',
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    data['recovered'].toString(),
                    style: TextStyle(
                      fontSize: 35.0,
                      letterSpacing: 2.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                ],
              ),
              ),
            ),
          ),
    );
  }
}

