import 'package:bounce_fit_coach/rive_app/components/noti.dart';
import 'package:flutter/material.dart';
import 'package:bounce_fit_coach/rive_app/theme.dart';

class NotificationTab extends StatefulWidget {
  const NotificationTab({Key? key}) : super(key: key);

  @override
  _NotificationTabState createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RiveAppTheme.background,
      appBar: AppBar(
        title: const Padding(
          padding:  EdgeInsets.only(left: 40),
          child: Text('Assigned')),
        ),
        
        body: const Column(
          children: [
            Noti(),
            SizedBox(height: 10,),
         Noti(),
           
          ],
          )
    );
     }
}


























