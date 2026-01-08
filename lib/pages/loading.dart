import 'package:flutter/material.dart'; // matrial of flutter app it is use to build diff wigets like scaffold, appbar, and others
 // this package is use to convert the json file in dart readabel form especially like a map
import 'services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // loading spinning load buttons 


class Loading extends StatefulWidget {
  //const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // void getTime() async {
    
  //   Response response =  await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1')); // used json fack rest api for testing
  //  // print(response.body); // this will not return the map but it just a json file string
  // Map data= jsonDecode(response.body); // this will return the map as it converts the jsondecode to convert the json file to dart maps
  // print(data);
  // print(data['title']);
//   void getTime() async {
//   try {
//     Response response = await get(
//       Uri.parse('https://worldtimeapi.org/api/timezone/America/Argentina/Salta'),
//     );

//     Map<String, dynamic> data = jsonDecode(response.body);
//    // print(data);
//    //get properties from data

//    String datetime= data['datetime'];
//    String offset= data['utc_offset'].substring(1,3);
//     //print(datetime);
//    //print(offset);

//    // create datetime object
//    DateTime now= DateTime.parse(datetime);
//   now = now.add(Duration(hours: int.parse(offset)));
//    print(now);

//   } catch (e) {
//     print('Error: $e');
//   }
// }
  
 //String time= 'loading';
 void setupWorldtime() async{
  WorldTime instance = WorldTime(location: 'Kabul', flag: 'germany.png', url:'Asia/Kabul');
  await instance.getTime();
  //Navigator.pushNamed(context, '/home');
    Navigator.pushReplacementNamed(context, '/home', arguments:{
      'location': instance.location,
      'flag': instance.flag,
      ' time': instance.time,
    }); // so that this screen will not be underneath instead it will be replaced and shown home page

   //navigating from here to home
 // print(instance.time);
//   setState(() {
//     time = instance.time;
//   });
}

   
   @override
  void initState() { // use initstate() method to call API is a best practice
    super.initState();
    setupWorldtime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
  child: SpinKitFadingCube(
    color:Colors.white,
    size:80.0,
  ),
      ),
      
      
      );
    
  }
}