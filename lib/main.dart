import 'package:flutter/material.dart';
import 'package:world_time_clock/pages/home.dart';
import 'package:world_time_clock/pages/choose_locations.dart';
import 'package:world_time_clock/pages/loading.dart';

void main() => runApp(MaterialApp(
  // home: Home(),
  initialRoute: '/',
  routes: {
    '/' : (context) => Loading(),   //        '/'  isny chalna hi chalna hy - initialRoute wala isi k uper push hoga. automatically.
    '/home': (context) => Home(),
    '/locations' : (context) => ChooseLocation(),
  },
));
