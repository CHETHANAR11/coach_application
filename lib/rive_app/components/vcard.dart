import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bounce_fit_coach/rive_app/models/courses.dart';

class Vcard extends StatefulWidget {
  const Vcard({Key? key, required this.course}) : super(key: key);

  final CourseModel course;

  @override
  State<Vcard> createState() => _VcardState();
}

class _VcardState extends State<Vcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300,maxHeight: 250),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
    image: AssetImage(widget.course.image),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(
      widget.course.color.withOpacity(0.5),
      BlendMode.overlay,
    ),
  ),
         boxShadow: [
          BoxShadow(
            color: widget.course.color.withOpacity(0.9),
            blurRadius: 2,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: widget.course.color.withOpacity(0.9),
            blurRadius: 2,
            offset: const Offset(0, 1),
          )
         ],
          borderRadius: BorderRadius.circular(30)
      ),
      child: Stack(
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              widget.course.title,
              
              style: const TextStyle(
                  fontSize: 24, fontFamily: "Poppins"),
            ),
            // const SizedBox(
            //   height: 8,
            // ),
            Text(
              widget.course.subtitle!,
              overflow: TextOverflow.ellipsis,
             maxLines: 2,
             softWrap: false,
              style: TextStyle(fontSize: 15),
            )
          ],
        ),]
      ),
    );
  }
}
