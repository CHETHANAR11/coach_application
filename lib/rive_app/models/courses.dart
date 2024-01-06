import 'package:flutter/material.dart';

class CourseModel {
  CourseModel({
    this.id,
    this.title = "",
    this.subtitle = "",
    this.caption = "",
    this.color = Colors.white,
    this.image = "",
  });

  UniqueKey? id = UniqueKey();
  String title, caption, image;
  String? subtitle;
  Color color;

  static List<CourseModel> courses = [
    CourseModel(
      title: "Football Basics",
      subtitle:
          "Learn the fundamentals of football, including rules, techniques, and strategies.",
      caption: "20 sections - 3 hours",
      color: const Color(0xFF7850F0),
      image: 'assets/images/soo.jpg',
    ),
    CourseModel(
      title: "Basketball Drills",
      subtitle:
          "Improve your basketball skills with a series of effective drills and exercises.",
      caption: "15 sections - 2.5 hours",
      color: const Color(0xFF7850F0),
      image: 'assets/images/soo2.jpg',
    ),
    CourseModel(
      title: "Soccer Techniques",
      subtitle:
          "Master the essential techniques of soccer, from passing to scoring goals.",
      caption: "25 sections - 4 hours",
      color: const Color(0xFF7850F0),
      image: 'assets/images/soo2.jpg',
    ),
  ];

  static List<CourseModel> details = [
    CourseModel(
      title: "Football",
      caption: "Watch in-depth analyses of exciting football matches.",
      color: const Color(0xFF6E6AE8),
      //image: 'assets/images/1_boy.webp',
    ),
    CourseModel(
      title: "Basketball",
      caption: "Enjoy highlights from thrilling basketball championships.",
      color: const Color(0xFF6E6AE8),
      //image: 'assets/images/1_boy.webp',
    ),
    CourseModel(
      title: "Soccer",
      caption: "Explore the intersection of soccer and machine learning.",
      color: const Color(0xFF6E6AE8),
      //image: 'assets/images/1_boy.webp',
    ),
    CourseModel(
      title: "Volleyball",
      caption: "Get insights into the training routines of top athletes.",
      color: const Color(0xFF6E6AE8),
     // image: 'assets/images/1_boy.webp',
    ),
  ];
}
