import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/consts/path.dart';
import '../../../../core/shared/gap.dart';

class LessonPage extends StatefulWidget {
  final String idLesson;

  const LessonPage({super.key, required this.idLesson});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://api.kontenbase.com/upload/file/storage/65a0e330fac3f5febba7f7f8/Otter Voice Meeting Notes - Otter.ai - Google Chrome 2024-12-05 10-00-12-BdhXjUFW.mp4'))
      ..initialize().then((_) {
        setState(() {});
      })
      ..addListener(() {
        setState(() {
          _isPlaying = _controller.value.isPlaying;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Lesson"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(_controller),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    colors: const VideoProgressColors(
                      playedColor: Colors.red,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 50,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const Gap.v(h: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Lesson 1",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap.v(h: 8),
                const Text(
                  "Get Started with ChatGPT",
                  style: TextStyle(fontSize: 18),
                ),
                const Gap.v(h: 8),
                Row(
                  children: [
                    const Text(
                      "Created by Diego Davila",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Spacer(),
                    ClipOval(
                      child: Image.asset(
                        PathConst.defaultFlag,
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Gap.h(w: 8),
                    Text(
                      'in English',
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
              ],
            ),
          ),
          const Gap.v(h: 16),
          Expanded(
            child: Container(
              color: Colors.grey[850],
              child: ListView(
                children: [
                  _buildContentCard(
                    "Lesson 1",
                    "Welcome to 23 Ways of Earning Money with AI",
                    "02:30",
                    'https://www.worldtesolacademy.com/wp-content/uploads/online-lessons-banner.jpg',
                  ),
                  _buildContentCard(
                    "PDF",
                    "The ChatGPT Prompts Guide",
                    "15:00",
                    'https://www.worldtesolacademy.com/wp-content/uploads/online-lessons-banner.jpg',
                  ),
                  _buildContentCard(
                    "Lesson 2",
                    "Get Started with ChatGPT",
                    "18:00",
                    'https://www.worldtesolacademy.com/wp-content/uploads/online-lessons-banner.jpg',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentCard(
      String title, String subtitle, String duration, String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: 120,
              height: 80,
            ),
          ),
          const Gap.h(w: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const Gap.v(h: 8),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Gap.v(h: 8),
                Text(
                  duration,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
