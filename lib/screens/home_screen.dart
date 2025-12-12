import 'package:flutter/material.dart';
import '../models/lesson_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/lesson_header.dart';
import '../widgets/image_container.dart';
import '../widgets/thumbnail_list.dart';
import '../utils/animations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  int selectedImageIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<Lesson> lessons = Lesson.sampleLessons;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation = createScaleAnimation(_animationController);
    _fadeAnimation = createFadeAnimation(_animationController);
    _slideAnimation = createSlideAnimation(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _changeLesson(int index) {
    setState(() {
      selectedIndex = index;
      selectedImageIndex = 0;
      _animationController.reset();
      _animationController.forward();
    });
    Navigator.of(context).pop();
  }

  void _nextImage() {
    if (selectedImageIndex < lessons[selectedIndex].images.length - 1) {
      setState(() {
        selectedImageIndex++;
        _animationController.reset();
        _animationController.forward();
      });
    }
  }

  void _previousImage() {
    if (selectedImageIndex > 0) {
      setState(() {
        selectedImageIndex--;
        _animationController.reset();
        _animationController.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentLesson = lessons[selectedIndex];
    final images = currentLesson.images;
    final hasMultipleImages = images.length > 1;

    return Scaffold(
      drawer: CustomDrawer(
        lessons: lessons,
        selectedIndex: selectedIndex,
        onLessonSelected: _changeLesson,
      ),
      appBar: CustomAppBar(),
      body: ScaleTransition(
        scale: _scaleAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LessonHeader(
                    lesson: currentLesson,
                    selectedImageIndex: selectedImageIndex,
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ImageContainer(
                      lesson: currentLesson,
                      selectedImageIndex: selectedImageIndex,
                      hasMultipleImages: hasMultipleImages,
                      onPrevious: _previousImage,
                      onNext: _nextImage,
                      onImageSelected: (index) {
                        setState(() {
                          selectedImageIndex = index;
                          _animationController.reset();
                          _animationController.forward();
                        });
                      },
                    ),
                  ),
                  if (hasMultipleImages && images.length > 1) ...[
                    const SizedBox(height: 16),
                    ThumbnailList(
                      lesson: currentLesson,
                      images: images,
                      selectedImageIndex: selectedImageIndex,
                      onImageSelected: (index) {
                        setState(() {
                          selectedImageIndex = index;
                          _animationController.reset();
                          _animationController.forward();
                        });
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}