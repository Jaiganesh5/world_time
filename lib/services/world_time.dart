import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';



class WorldTime {
  String location; //location name for the ui
  String time; //the time in the location
  String flag; //url to the asset flag icon
  String url; //
  bool isDaytime;//true or false day time or not
  WorldTime({this.location, this.flag, this.url});

 Future <void> getTime() async {
   try{
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    //print(data);
    //get properties of data

    String dateTime = data['datetime'];
    String offset1 = data['utc_offset'].substring(0,3);
    int convoffset1 =int.parse(offset1);
    String offset2 = data['utc_offset'].substring(4,6);
    int convoffset2 =int.parse(offset2);
    // print(dateTime);
    //print('$offset1');
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours:convoffset1));
    now = now.add(Duration(minutes:convoffset2));

    // print(now);
    isDaytime = now.hour > 6 && now.hour < 19 ? true : false ;
    //set the time property
    time = DateFormat.jm().format(now);
 }
 catch(e){
    print('caught error: $e');
    time='could not get time data';
 }
  }
}







