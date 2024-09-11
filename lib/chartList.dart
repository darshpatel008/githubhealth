import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:health/colors1.dart';
import 'package:health/json.dart';

class ChartList extends StatefulWidget {
  const ChartList({super.key});

  @override
  State<ChartList> createState() => _ChartListState();
}

class _ChartListState extends State<ChartList> {
  // List<bool> _expandedStateList = List.generate(5, (index) => false);
  List<modelclass> listofvalue = [];
  late SharedPreferences sharedPreferences;


  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ActivityCard(
                icon: Icons.directions_walk,
                activity: 'Walking',
                value: '9857 steps',
                recordText: 'Today\'s Record',
                backgroundColor: Colors.lightGreen.shade100,
              ),
              ActivityCard(
                icon: Icons.bloodtype,
                activity: 'blood-pressure',
                value: '70(bps)',
                recordText: 'Today\'s Record',
                backgroundColor: Colors.orange.shade100,
              ),
              ActivityCard(
                icon: Icons.nightlight_round,
                activity: 'sleep',
                value: '8 hour',
                recordText: 'Today\'s Record',
                backgroundColor: Color.fromRGBO(136, 179, 255, 100)
              ),
              ActivityCard(
                icon: Icons.monitor_heart,
                activity: 'heart-rate',
                value: '90(bpm)',
                recordText: 'Today\'s Record',
                backgroundColor: Colors.red.shade100,
              ),
              ActivityCard(
                icon: Icons.directions_bike,
                activity: 'Cycling',
                value: '17 km',
                recordText: 'Today\'s Record',
                backgroundColor: Colors.blue.shade100,
              ),
              ActivityCard(
                icon: Icons.directions_run,
                activity: 'Running',
                value: '230 calories',
                recordText: 'Today\'s Record',
                backgroundColor: Colors.amber.shade100,
              ),
              ActivityCard(
                icon: Icons.fitness_center,
                activity: 'Workout',
                value: '45 minutes',
                recordText: 'Today\'s Workout',
                backgroundColor: Colors.pink.shade100,
              ),
            ],
          ),
        ),

    );
  }
}

class ActivityCard extends StatelessWidget {
  final IconData icon;
  final String activity;
  final String value;
  final String recordText;
  final Color backgroundColor;

  ActivityCard({
    required this.icon,
    required this.activity,
    required this.value,
    required this.recordText,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityScreen()));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.grey[700]),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                ],
              ),
              Spacer(),
              Text(
                recordText,
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}