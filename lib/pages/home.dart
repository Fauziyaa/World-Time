import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    //set background image
    String bgImage = data['isDayNight'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayNight'] ? Colors.blue : Colors.indigo[800];


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea
        (child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () async{
                  dynamic result = await Navigator.pushNamed(context, '/choose_location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location' : result['location'],
                      'isDayNight' : result['isDayNight'],
                      'flag' : result['flag']
                    };
                  });
                },
                icon: Icon(Icons.location_on,
                  color: Colors.grey[300],
                ),
                label: Text("Choose Location",
                  style: TextStyle(
                    color: Colors.grey[300]
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(data['location'],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 1.5,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              Text(data['time'],
                style: TextStyle(
                    fontSize: 66,
                    letterSpacing: 1.5,
                    color: Colors.white,
                ),
              ),
            ],
      ),
          ),
        )),
    );
  }
}
