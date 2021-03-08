import 'package:flutter/material.dart';
import 'package:worldtime/services/world_dart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'India', flag: 'india.png', url: 'Asia/Kolkata');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag':instance.flag,
      'time': instance.time,
      'isDayNight' : instance.isDayNight
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),

      ),
    );
  }
}
