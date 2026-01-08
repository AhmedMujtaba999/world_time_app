// TODO Implement this library.
import 'package:http/http.dart'; // used the http dependencies
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{
  String location; //location name for the ui
  String? time; // the time in that location
  String flag; // url to an flag icon
  String url; // location url for api endpoint
  

  WorldTime({required this.location,required this.flag,required this.url});


  Future<void> getTime() async {
  try {
    Response response = await get(
      Uri.parse('https://worldtimeapi.org/api/timezone/$url'),
    );

    Map<String, dynamic> data = jsonDecode(response.body);
   // print(data);
   //get properties from data

   String datetime= data['datetime'];
   String offset= data['utc_offset'].substring(1,3);
    //print(datetime);
   //print(offset);

   // create datetime object
   DateTime now= DateTime.parse(datetime);
  now = now.add(Duration(hours: int.parse(offset)));
  //time= now.toString(); // set the time property
  time = DateFormat.jm().format(now);

  } catch (e) {
    print('caught Error: $e');
    time='could not get time data';
  }
}

}
