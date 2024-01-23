import 'package:bounce_fit_coach/rive_app/components/time.dart';
import 'package:flutter/material.dart';
import 'package:bounce_fit_coach/rive_app/theme.dart';

class TimerTab extends StatefulWidget {
  const TimerTab({Key? key}) : super(key: key);

  @override
  _TimerTabState createState() => _TimerTabState();
}

class _TimerTabState extends State<TimerTab> {
  String gameName = '';
  String gameTime = '';
  
  void updateTimer(String name, String time) {
    setState(() {
      gameName = name;
      gameTime = time;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: RiveAppTheme.background,
        appBar: AppBar(
          title: const Padding(
              padding: EdgeInsets.only(left: 40), child: Text('Time')),
        ),
        body: Column(
          children: [
            Time(gameName: gameName, gameTime: gameTime),
          ],
        ));
  }

  
}
