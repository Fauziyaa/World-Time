import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


  class WorldTime
  {

    String location; //location for ui
    String time; // time in that location
    String flag; // url to an assets Country flags icon
    String url; // location url for api endpoint
    bool isDayNight;	


    WorldTime({this.location, this.flag, this.url});


  Future<void> getTime() async {

   try{
     //make the request to get data
     Response response = await get('https://worldtimeapi.org/api/timezone/$url');
     Map data = jsonDecode(response.body);
//    print(data);

     //get properties from data
     String datetime = data['datetime'];
     String offset_hours = data['utc_offset'].substring(1, 3);
     String offset_min = data['utc_offset'].substring(4);

//    print(datetime);
//    print(offset_hours);
//    print(offset_min);

     // create datetime object
     DateTime now = DateTime.parse(datetime);
     now = now.add(Duration(
         hours: int.parse(offset_hours), minutes: int.parse(offset_min)));


     isDayNight = now.hour > 6 && now.hour<20 ? true : false;

     time = DateFormat.jm().format(now); //set time and covert into string

   }

   catch(e){
     print("Error: $e");
     time = " Could not get date and time";
   }

    }




  }
