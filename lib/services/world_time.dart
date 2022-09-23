import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String url = '';
  String time = '12 baj k 12 mint'; // gave a fake value. for testnig.
  String location = '';
  String flag = '';
  bool isDaytime = true;

  WorldTime({required this.location, required this.url, required this.flag});

  Future<void> getTime() async {
    try{
      //make the http request
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$url')); //Asia/Karachi
      Map data = jsonDecode(response.body);
      print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'];

      //convert above strings into DateTime object
      DateTime now = DateTime.parse(datetime);
      offset = offset.substring(1, 3);

      //show accurate time
      now.add(Duration(hours: int.parse(offset)));
      print('\n\'now\' is non-destructive ::            raw value:    $now');
      now = now.add(Duration(hours: int.parse(offset)));
      print('\'now\', now is not non-destructed ::     new value:    $now');

      //set time variable
      isDaytime = now.hour > 5 && now.hour < 18 ? true:false;
      time = DateFormat.jm().format(now) ;
      print(time);
    }
    catch(e){
      print('you caught an error: $e');
      time = 'could not get time value';
    }
  }
}