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

  static List<CourseModel> details = [
    CourseModel(
      title: "Player 1",
      caption: "3rd Year || Information Technology",
      color: const Color(0xFF6E6AE8),
      //image: 'assets/images/1_boy.webp',
    ),
    CourseModel(
      title: "Player 2",
      caption: "4th Year || Computer Science",
      color: const Color(0xFF6E6AE8),
      //image: 'assets/images/1_boy.webp',
    ),
    CourseModel(
      title: "Player 3",
      caption: "3rd Year || Mechanical ",
      color: const Color(0xFF6E6AE8),
      //image: 'assets/images/1_boy.webp',
    ),
    CourseModel(
      title: "Player 4",
      caption: "2nd Year || C",
      color: const Color(0xFF6E6AE8),
     // image: 'assets/images/1_boy.webp',
    ),
     CourseModel(
      title: "Player 5",
      caption: "2nd Year || C",
      color: const Color(0xFF6E6AE8),
     // image: 'assets/images/1_boy.webp',
    ),
     CourseModel(
      title: "Player 6",
      caption: "2nd Year || C",
      color: const Color(0xFF6E6AE8),
     // image: 'assets/images/1_boy.webp',
    ),
     CourseModel(
      title: "Player 7",
      caption: "2nd Year || C",
      color: const Color(0xFF6E6AE8),
     // image: 'assets/images/1_boy.webp',
    ),
     CourseModel(
      title: "Player 8",
      caption: "2nd Year || C",
      color: const Color(0xFF6E6AE8),
     // image: 'assets/images/1_boy.webp',
    ),
  ];
}
