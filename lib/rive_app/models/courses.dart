import 'package:flutter/material.dart';

class CourseModel {
  CourseModel(
      {this.id,
      this.title = "",
      this.subtitle = "",
      this.caption = "",
      this.color = Colors.white,
      this.image = ""});

  UniqueKey? id = UniqueKey();
  String title, caption, image;
  String? subtitle;
  Color color;

  static List<CourseModel> courses = [
    CourseModel(
      title: " in SwiftUI",
      subtitle:
          "Coaching apps are designed to offer guidance, support, and resources to individuals seeking personal or professional development. These apps may cater to various niches such as life coaching, fitness coaching, career coaching, and more",
      caption: "20 sections - 3 hour",
      color: const Color(0xFF7850F0),
      image: 'assets/images/1_boy.webp',
    ),
    CourseModel(
      title: "Animations in ",
      subtitle:
          "Coaching apps are designed to offer guidance, support, and resources to individuals seeking personal or professional development. These apps may cater to various niches such as life coaching, fitness coaching, career coaching, and more",
      caption: "20 sections - 3 hour",
      color: const Color(0xFF7850F0),
      image: 'assets/images/1_boy.webp',
    ),
    CourseModel(
      title: "Animations in SwiftUI",
      subtitle:
          "Coaching apps are designed to offer guidance, support, and resources to individuals seeking personal or professional development. These apps may cater to various niches such as life coaching, fitness coaching, career coaching, and more",
      caption: "20 sections - 3 hour",
      color: const Color(0xFF7850F0),
      image: 'assets/images/1_boy.webp',
    )
  ];

  static List<CourseModel> details = [
    CourseModel(
        title: "Machien",
        caption: "wtch me",
        color: const Color(0xFF6E6AE8),
        image: 'assets/images/1_boy.webp'
        ),
    CourseModel(
        title: "Machien",
        caption: "wtch me",
        color: const Color(0xFF6E6AE8),
        image: 'assets/images/1_boy.webp'
        ),
    CourseModel(
        title: "Machien",
        caption: "wtch me",
        color: const Color(0xFF6E6AE8),
        image: 'assets/images/1_boy.webp'
        ),
    CourseModel(
        title: "Machien",
        caption: "wtch me",
        color: const Color(0xFF6E6AE8),
        image: 'assets/images/1_boy.webp'
        ),
  ];
}
