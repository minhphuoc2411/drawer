import 'package:flutter/material.dart';
import '../models/lesson_model.dart';
import 'drawer_item.dart';
import 'class_item.dart';

class CustomDrawer extends StatelessWidget {
  final List<Lesson> lessons;
  final int selectedIndex;
  final Function(int) onLessonSelected;

  const CustomDrawer({
    required this.lessons,
    required this.selectedIndex,
    required this.onLessonSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 320,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildHomeItem(),
              _buildDivider(),
              _buildLessonsTitle(),
              _buildLessonsList(),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.green.shade400,
                      Colors.green.shade600,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.school_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Minh Phước",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "22T1020331",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "App chứa kết quả bài tập",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DrawerItem(
        icon: Icons.home_rounded,
        text: "Trang chủ",
        isSelected: true,
        onTap: () {},
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Divider(
        color: Colors.grey.shade200,
        height: 1,
      ),
    );
  }

  Widget _buildLessonsTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 16, bottom: 8),
      child: Row(
        children: [
          const Icon(
            Icons.assignment_rounded,
            size: 16,
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(
            "BÀI TẬP",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Colors.grey.shade600,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonsList() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          return ClassItem(
            title: lesson.title,
            color: lesson.iconColor,
            icon: lesson.icon,
            imageCount: lesson.images.length,
            isSelected: index == selectedIndex,
            onTap: () => onLessonSelected(index),
          );
        },
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green.shade100,
                  Colors.blue.shade100,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_rounded,
              color: Colors.green,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Minh Phước",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  "22T1020331@husc.edu.vn",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.exit_to_app_rounded,
              color: Colors.grey.shade500,
              size: 20,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}