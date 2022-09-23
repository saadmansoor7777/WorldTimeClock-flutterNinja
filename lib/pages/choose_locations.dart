import 'package:flutter/material.dart';
import 'package:world_time_clock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0 ;


  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    // WorldTime instanceLocations = WorldTime(location: locations[index].location, url: locations[index].url, flag: locations[index].flag) ;
    WorldTime instanceLocations = locations[index] ;
    await instanceLocations.getTime();

    Navigator.pop(context, {
      'location__of_locations': instanceLocations.location,
      'time__of_locations': instanceLocations.time,
      'flag__of_locations': instanceLocations.flag,
      'isDaytime__of_locations': instanceLocations.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Locations"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: (){
                    setState( (){
                      counter++ ;
                    } );
                  },
                  child: Text('$counter')
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    itemCount: locations.length,
                    itemBuilder: (context, index){
                      return Card(
                        child: ListTile(
                          onTap: (){ updateTime(index) ; } ,
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/${locations[index].flag}'),
                          ),
                          title: Text(locations[index].location),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
