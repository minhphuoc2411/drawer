import 'package:flutter/material.dart';

class Lesson {
  final String title;
  final Color color;
  final Color iconColor;
  final IconData icon;
  final List<String> images;

  Lesson({
    required this.title,
    required this.color,
    required this.iconColor,
    required this.icon,
    required this.images,
  });

  // Factory method từ Map
  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      title: map['title'],
      color: map['color'],
      iconColor: map['iconColor'],
      icon: map['icon'],
      images: List<String>.from(map['images']),
    );
  }

  // Danh sách bài tập mẫu
  static List<Lesson> get sampleLessons {
    return [
      Lesson(
        title: "Bài tập 1:",
        color: Colors.blue.shade50,
        iconColor: Colors.blue.shade700,
        icon: Icons.code_rounded,
        images: ["assets/images/bt1.jpg"],
      ),
      Lesson(
        title: "Bài tập 2:",
        color: Colors.green.shade50,
        iconColor: Colors.green.shade700,
        icon: Icons.phone_android_rounded,
        images: ["assets/images/bt2.jpg"],
      ),
      Lesson(
        title: "Bài tập 3:",
        color: Colors.orange.shade50,
        iconColor: Colors.orange.shade700,
        icon: Icons.language_rounded,
        images: ["assets/images/bt3_1.jpg", "assets/images/bt3_2.jpg"],
      ),
      Lesson(
        title: "Bài tập 4:",
        color: Colors.purple.shade50,
        iconColor: Colors.purple.shade700,
        icon: Icons.storage_rounded,
        images: [
          "assets/images/bt4_1.png",
          "assets/images/bt4_2.png",
          "assets/images/bt4_3.png"
        ],
      ),
      Lesson(
        title: "Bài tập 5:",
        color: Colors.teal.shade50,
        iconColor: Colors.teal.shade700,
        icon: Icons.api_rounded,
        images: ["assets/images/bt5_1.jpg", "assets/images/bt5_2.jpg"],
      ),
      Lesson(
        title: "Bài tập 6:",
        color: Colors.indigo.shade50,
        iconColor: Colors.indigo.shade700,
        icon: Icons.bug_report_rounded,
        images: ["assets/images/bt6.png"],
      ),
      Lesson(
        title: "Bài tập 7:",
        color: Colors.red.shade50,
        iconColor: Colors.red.shade700,
        icon: Icons.rocket_launch_rounded,
        images: ["assets/images/bt7_1.png", "assets/images/bt7_2.png"],
      ),
      Lesson(
        title: "Bài tập 8:",
        color: Colors.cyan.shade50,
        iconColor: Colors.cyan.shade700,
        icon: Icons.cloud_upload_rounded,
        images: ["assets/images/bt8_1.png", "assets/images/bt8_2.png"],
      ),
    ];
  }
}