import 'package:flutter/material.dart';

void main() {
  runApp(ClassroomApp());
}

class ClassroomApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài Tập - Minh Phước',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,
          primary: Colors.green,
          secondary: Colors.blue,
        ),
        scaffoldBackgroundColor: const Color(0xFFF9FAFB),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: false,
        ),
      ),
      home: ClassroomHome(),
    );
  }
}

class ClassroomHome extends StatefulWidget {
  @override
  _ClassroomHomeState createState() => _ClassroomHomeState();
}

class _ClassroomHomeState extends State<ClassroomHome>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  int selectedImageIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<Map<String, dynamic>> lessons = [
    {
      "title": "Bài tập 1:",
      "color": Colors.blue.shade50,
      "iconColor": Colors.blue.shade700,
      "icon": Icons.code_rounded,
      "images": ["assets/images/bt1.jpg"],
    },
    {
      "title": "Bài tập 2:",
      "color": Colors.green.shade50,
      "iconColor": Colors.green.shade700,
      "icon": Icons.phone_android_rounded,
      "images": ["assets/images/bt2.jpg"],
    },
    {
      "title": "Bài tập 3:",
      "color": Colors.orange.shade50,
      "iconColor": Colors.orange.shade700,
      "icon": Icons.language_rounded,
      "images": ["assets/images/bt3_1.jpg", "assets/images/bt3_2.jpg"],
    },
    {
      "title": "Bài tập 4:",
      "color": Colors.purple.shade50,
      "iconColor": Colors.purple.shade700,
      "icon": Icons.storage_rounded,
      "images": [
        "assets/images/bt4_1.png",
        "assets/images/bt4_2.png",
        "assets/images/bt4_3.png"
      ],
    },
    {
      "title": "Bài tập 5:",
      "color": Colors.teal.shade50,
      "iconColor": Colors.teal.shade700,
      "icon": Icons.api_rounded,
      "images": ["assets/images/bt5_1.jpg", "assets/images/bt5_2.jpg"],
    },
    {
      "title": "Bài tập 6:",
      "color": Colors.indigo.shade50,
      "iconColor": Colors.indigo.shade700,
      "icon": Icons.bug_report_rounded,
      "images": ["assets/images/bt6.png"],
    },
    {
      "title": "Bài tập 7:",
      "color": Colors.red.shade50,
      "iconColor": Colors.red.shade700,
      "icon": Icons.rocket_launch_rounded,
      "images": ["assets/images/bt7_1.png", "assets/images/bt7_2.png"],
    },
    {
      "title": "Bài tập 8:",
      "color": Colors.cyan.shade50,
      "iconColor": Colors.cyan.shade700,
      "icon": Icons.cloud_upload_rounded,
      "images": ["assets/images/bt8_1.png", "assets/images/bt8_2.png"],
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

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
    if (selectedImageIndex < lessons[selectedIndex]["images"].length - 1) {
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
    final images = currentLesson["images"] as List<String>;
    final hasMultipleImages = images.length > 1;

    return Scaffold(
      drawer: _buildDrawer(),
      appBar: _buildAppBar(),
      body: _buildBody(currentLesson, images, hasMultipleImages),
    );
  }

  // APP BAR KHÔNG CÓ GÌ CẢ
  AppBar _buildAppBar() {
    return AppBar(
      title: const SizedBox(), // KHÔNG HIỂN THỊ GÌ CẢ
      leading: Builder(
        builder: (context) => Container(
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.menu_rounded, color: Colors.black87),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(Icons.person_rounded, color: Colors.green.shade700),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildBody(
    Map<String, dynamic> currentLesson,
    List<String> images,
    bool hasMultipleImages,
  ) {
    return ScaleTransition(
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
                // HEADER HIỂN THỊ TÊN BÀI TẬP VÀ "ẢNH X/Y"
                _buildLessonHeader(currentLesson, images, hasMultipleImages),
                const SizedBox(height: 24),
                Expanded(
                  child: _buildImageContainer(currentLesson, images, hasMultipleImages),
                ),
                if (hasMultipleImages && images.length > 1) ...[
                  const SizedBox(height: 16),
                  _buildThumbnailList(currentLesson, images),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLessonHeader(
    Map<String, dynamic> currentLesson,
    List<String> images,
    bool hasMultipleImages,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: currentLesson["color"],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: currentLesson["iconColor"].withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              currentLesson["icon"],
              color: currentLesson["iconColor"],
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentLesson["title"],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          // KHÔI PHỤC "ẢNH X/Y" NHƯ CŨ
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: currentLesson["iconColor"].withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Ảnh ${selectedImageIndex + 1}/${images.length}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: currentLesson["iconColor"],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageContainer(
    Map<String, dynamic> currentLesson,
    List<String> images,
    bool hasMultipleImages,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            InteractiveViewer(
              panEnabled: true,
              scaleEnabled: true,
              minScale: 0.5,
              maxScale: 4.0,
              child: Image.asset(
                images[selectedImageIndex],
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: currentLesson["color"],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_not_supported_rounded,
                            size: 64,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Không tìm thấy ảnh",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            if (hasMultipleImages) ...[
              if (selectedImageIndex > 0)
                Positioned(
                  left: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.chevron_left_rounded,
                          color: Colors.black87,
                          size: 24,
                        ),
                        onPressed: _previousImage,
                      ),
                    ),
                  ),
                ),
              if (selectedImageIndex < images.length - 1)
                Positioned(
                  right: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.black87,
                          size: 24,
                        ),
                        onPressed: _nextImage,
                      ),
                    ),
                  ),
                ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        images.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedImageIndex = index;
                              _animationController.reset();
                              _animationController.forward();
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: selectedImageIndex == index ? 20 : 8,
                            height: 8,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: selectedImageIndex == index
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnailList(Map<String, dynamic> currentLesson, List<String> images) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedImageIndex = index;
                _animationController.reset();
                _animationController.forward();
              });
            },
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
                      ? currentLesson["iconColor"]
                      : Colors.transparent,
                  width: selectedImageIndex == index ? 3 : 0,
                ),
                boxShadow: [
                  if (selectedImageIndex == index)
                    BoxShadow(
                      color: currentLesson["iconColor"].withOpacity(0.3),
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

  Widget _buildDrawer() {
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
              // Header
              Padding(
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
              ),

              // Home Item
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _buildDrawerItem(
                  icon: Icons.home_rounded,
                  text: "Trang chủ",
                  isSelected: true,
                  onTap: () {},
                ),
              ),

              // Divider
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Divider(
                  color: Colors.grey.shade200,
                  height: 1,
                ),
              ),

              // Lessons Title
              Padding(
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
              ),

              // Lessons List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: lessons.length,
                  itemBuilder: (context, index) {
                    final lesson = lessons[index];
                    final images = lesson["images"] as List<String>;
                    return _buildClassItem(
                      title: lesson["title"],
                      color: lesson["iconColor"],
                      icon: lesson["icon"],
                      imageCount: images.length,
                      isSelected: index == selectedIndex,
                      onTap: () => _changeLesson(index),
                    );
                  },
                ),
              ),

              // Footer
              Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green.shade50 : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: isSelected
            ? Border.all(color: Colors.green.shade200, width: 1.5)
            : null,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(
                icon,
                size: 22,
                color: isSelected ? Colors.green.shade700 : Colors.grey.shade700,
              ),
              const SizedBox(width: 16),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? Colors.green.shade700 : Colors.grey.shade700,
                ),
              ),
              if (isSelected) ...[
                const Spacer(),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green.shade700,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClassItem({
    required String title,
    required Color color,
    required IconData icon,
    required int imageCount,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isSelected ? color.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: isSelected
            ? Border.all(color: color.withOpacity(0.3), width: 1.5)
            : Border.all(color: Colors.grey.shade100, width: 1),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                        color: isSelected ? color : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.photo_rounded,
                          size: 12,
                          color: Colors.grey.shade500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "$imageCount ảnh",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle_rounded,
                  color: color,
                  size: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}