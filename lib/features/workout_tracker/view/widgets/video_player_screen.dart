import 'package:fitnestx/features/workout_tracker/controller/exercise_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart' as video_player;

class VideoPlayerScreen extends StatelessWidget {
  VideoPlayerScreen({super.key});

  final  ExerciseDetailsController controller = Get.put(ExerciseDetailsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: video_player.VideoProgressIndicator(
            controller.videoController,
            allowScrubbing: true,
            colors: const video_player.VideoProgressColors(
              playedColor: Colors.blue,
              bufferedColor: Colors.grey,
              backgroundColor: Colors.black12,
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Time display
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(controller.formatDuration(controller.position.value)),
              Text(controller.formatDuration(controller.duration.value)),
            ],
          )),
        ),
        const SizedBox(height: 6),
        // Control buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.replay_10),
              iconSize: 30,
              onPressed: controller.seekBackward,
            ),
            const SizedBox(width: 20),
            Obx(() => IconButton(
              icon: Icon(
                controller.isPlaying.value
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_filled,
              ),
              color: Colors.grey,
              iconSize: 40,
              onPressed: controller.togglePlayPause,
            )),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.forward_10),
              iconSize: 30,
              onPressed: controller.seekForward,
            ),
          ],
        ),
      ],
    );
  }
}