import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_clock/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance_valueToConstructor = WorldTime(location: 'Lahore', url: 'Asia/Karachi', flag: 'pak.png');
    await instance_valueToConstructor.getTime();
    /*print (instance_valueToConstructor.time);                 // w/out the 'await',  'time'  was  null, and yet no error. ==>> it was not null. i had set    'time' = "";   in  world_time.dart
    setState(() {
      time = instance_valueToConstructor.time;
    });*/
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location_of_loading': instance_valueToConstructor.location, //try commenting
      'time_of_loading': instance_valueToConstructor.time,
      'flag_of_loading': instance_valueToConstructor.flag,
      'isDaytime_of_loading': instance_valueToConstructor.isDaytime,
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
      backgroundColor: Colors.white,
/*      appBar: AppBar(
        title: Text("Loading"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Text(time),*/
      body: Center(
        child: SpinKitFadingCube(
        color: Colors.blue[800] ,
        size: 120.0,
      ),),
    );
  }
}
