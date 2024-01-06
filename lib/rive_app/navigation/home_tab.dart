import 'package:bounce_fit_coach/rive_app/components/vcard.dart';
import 'package:bounce_fit_coach/rive_app/components/hcard.dart';
import 'package:bounce_fit_coach/rive_app/models/courses.dart';
import 'package:bounce_fit_coach/rive_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<CourseModel> _courses = CourseModel.courses;
  final List<CourseModel> _details = CourseModel.details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RiveAppTheme.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+60,
        bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Courses",
                style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
              ),
            ),
            // Vcard(course: _courses[1])
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _courses
                    .map((course) => Padding(
                        key: course.id,
                        padding: const EdgeInsets.all(10),
                        child: Vcard(course: course)))
                    .toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                "Recent",
                style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
              ),
            ),
           ...List.generate(_details.length, (index) =>  Padding(
            key: _details[index].id,
            padding:const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Hcard(section: _details[index])),)
          ],
        ),
      ),
    );
  }
}
