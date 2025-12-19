import 'package:fitnestx/features/workout_tracker/model/how_to_step_model.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player/video_player.dart' as video_player;

class ExerciseDetailsController extends GetxController{
  late VideoPlayerController videoController;
  var isInitialized = false.obs;
  var isPlaying = false.obs;
  var position = Duration.zero.obs;
  var duration = Duration.zero.obs;
 

  RxList<HowToStepModel> stepsDataList = <HowToStepModel>[].obs;



  @override
  void onInit() {
    super.onInit();
    loadStepData();
    _initializeVideo();
  }

  void loadStepData(){
    stepsDataList.value = steps;
  }


  // video player method............
  Future<void> _initializeVideo() async {
    videoController = video_player.VideoPlayerController.networkUrl(
      Uri.parse('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
    );

    await videoController.initialize();
    isInitialized.value = true;
    duration.value = videoController.value.duration;

    videoController.addListener(() {
      isPlaying.value = videoController.value.isPlaying;
      position.value = videoController.value.position;
    });

    videoController.play();
  }

  void togglePlayPause() {
    if (videoController.value.isPlaying) {
      videoController.pause();
    } else {
      videoController.play();
    }
  }

  void seekForward() {
    final currentPosition = videoController.value.position;
    videoController.seekTo(currentPosition + const Duration(seconds: 10));
  }

  void seekBackward() {
    final currentPosition = videoController.value.position;
    videoController.seekTo(currentPosition - const Duration(seconds: 10));
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
    void onClose() {
      videoController.dispose();
      super.onClose();
    }
}