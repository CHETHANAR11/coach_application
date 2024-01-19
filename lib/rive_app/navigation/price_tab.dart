import 'package:bounce_fit_coach/rive_app/components/price.dart';
import 'package:flutter/material.dart';
import 'package:bounce_fit_coach/rive_app/theme.dart';

class PriceTab extends StatefulWidget {
  const PriceTab({Key? key}) : super(key: key);

  @override
  _PriceTabState createState() => _PriceTabState();
}

class _PriceTabState extends State<PriceTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RiveAppTheme.background,
      appBar: AppBar(
        title: const  Padding(
          padding:  EdgeInsets.only(left: 40),
          child: Text('Awards')),),
        body: const Column(
          children: [
           Price(),
          ],
          )
    );
     }
}
