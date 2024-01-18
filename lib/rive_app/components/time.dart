import 'package:bounce_fit_coach/rive_app/theme.dart';
import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  Widget build(BuildContext context) {
     return Container(
      constraints: const BoxConstraints(maxHeight: 110),
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
       ),
       child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Baseball Time",
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: "Poppins",
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8,),
                Text(
                  "time given ",
                  style: const TextStyle(
                    fontFamily: "Inter",
                    color: Colors.white
                  ),
                )
              ],
            ),
          ),
       const Padding(padding: EdgeInsets.all(20),
       child: VerticalDivider(thickness: 0.8,width: 0,),
       )
        ],
       ),
    );
  }
}
