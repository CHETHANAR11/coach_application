import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  final String gameName;
  final String gameTime;

  const Time({
    Key? key,
    required this.gameName,
    required this.gameTime,
  }) : super(key: key);

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 110),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 126, 79, 159),
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
                   widget.gameName,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Poppins",
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.gameTime,
                    style: TextStyle(fontFamily: "Inter", color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: VerticalDivider(
                thickness: 0.8,
                width: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
