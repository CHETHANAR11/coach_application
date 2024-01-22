import 'package:bounce_fit_coach/rive_app/models/courses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hcard extends StatefulWidget {
  const Hcard({Key? key, required this.section,required this.selectedPlayers}) : super(key: key);

  final CourseModel section;
  final List<String> selectedPlayers; 

  @override
  State<Hcard> createState() => _HcardState();
}

class _HcardState extends State<Hcard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 110),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 66, 188, 199),
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
                  widget.section.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: "Poppins",
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.section.caption,
                  style:
                      const TextStyle(fontFamily: "Inter", color: Colors.white),
                )
              ],
            ),
          ),
          InkWell(
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                  if (isSelected) {
                    widget.selectedPlayers.add(widget.section.title);
                  }
                  else{
                    widget.selectedPlayers.remove(widget.section.title);

                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? Colors.black
                      : Color.fromARGB(255, 236, 230, 229),
                ),
              )),
          const Padding(
            padding: EdgeInsets.all(20),
            child: VerticalDivider(
              thickness: 0.8,
              width: 0,
            ),
          )
        ],
      ),
    );
  }
}
