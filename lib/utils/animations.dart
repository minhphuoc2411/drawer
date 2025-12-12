import 'package:flutter/animation.dart';

Animation<double> createScaleAnimation(AnimationController controller) {
  return Tween<double>(begin: 0.95, end: 1.0).animate(
    CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutCubic,
    ),
  );
}

Animation<double> createFadeAnimation(AnimationController controller) {
  return Tween<double>(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ),
  );
}

Animation<Offset> createSlideAnimation(AnimationController controller) {
  return Tween<Offset>(
    begin: const Offset(0, 0.1),
    end: Offset.zero,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutCubic,
    ),
  );
}