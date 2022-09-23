import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map ;
    print(data); //4 things are stored here.  (1) 'flag_of_loading', (2) 'isDaytime_of_loading', (3) 'time_of_loading', (4) 'location_of_loading'
    //on line45 , we are actually updating values of These same Map(variables).
    String bgImage = data['isDaytime_of_loading'] ? 'day.jpg':'night.jpg';

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("World Time Clock"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body:  SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  FlatButton.icon(
                      onPressed: () async{
                        dynamic result = await Navigator.pushNamed(context, '/locations');
                        setState(() {
                          data = {
                            'location_of_loading': result['location__of_locations'],
                            'time_of_loading': result['time__of_locations'],
                            'flag_of_loading': result['flag__of_locations'],
                            'isDaytime_of_loading': result['isDaytime__of_locations'],
                          } ;
                        });
                      },
                      label: Text(
                        "goto Locations Screen",
                        style: TextStyle(
                          color: Colors.red[700],
                        ),
                      ),
                      icon:  Icon(
                        Icons.edit_location,
                        color: Colors.red[400],
                      ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data['location_of_loading'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.yellow,
                      ),),
                    ],
                  ),
                  SizedBox(height: 18,),
                  Text(data['time_of_loading'],
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.amber,
                  ),),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
