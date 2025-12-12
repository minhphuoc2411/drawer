import 'package:flutter/material.dart';
import '../models/lesson_model.dart';

class ThumbnailList extends StatelessWidget {
  final Lesson lesson;
  final List<String> images;
  final int selectedImageIndex;
  final Function(int) onImageSelected;

  const ThumbnailList({
    required this.lesson,
    required this.images,
    required this.selectedImageIndex,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onImageSelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.only(
                right: 12,
                left: index == 0 ? 4 : 0,
              ),
              width: selectedImageIndex == index ? 120 : 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: selectedImageIndex == index
                      ? lesson.iconColor
                      : Colors.transparent,
                  width: selectedImageIndex == index ? 3 : 0,
                ),
                boxShadow: [
                  if (selectedImageIndex == index)
                    BoxShadow(
                      color: lesson.iconColor.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    )
                  else
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade100,
                      child: Center(
                        child: Icon(
                          Icons.broken_image_rounded,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}