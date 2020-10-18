import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';



class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url:'Asia/Kolkata',location:'Chennai',flag:'india.webp'),
    WorldTime(url:'Europe/London',location:'London',flag:'uk.png'),
    WorldTime(url:'Europe/Berlin',location:'Athens',flag:'greece.jpg'),
    WorldTime(url:'America/New_York',location:'New york',flag:'us.png'),
    WorldTime(url:'Asia/Tokyo',location:'Tokyo',flag:'japan.png'),
    WorldTime(url:'Europe/Paris',location:'paris',flag:'france.png'),
    WorldTime(url:'Australia/Sydney',location:'Sydney',flag:'australia.png'),
    WorldTime(url:'Europe/Moscow',location:'Moscow',flag:'russia.jpg'),

  ];

  void updateTime(index) async{
    WorldTime instance =locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });

  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 5.0),
            child: Card(
              child: ListTile(

                onTap: () {
                 updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}

