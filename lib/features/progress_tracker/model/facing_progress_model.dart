import 'package:fitnestx/core/const/images_path.dart';

class FacingProgressModel {
  final String title;
  final List<String> images;

  FacingProgressModel({
    required this.title,
    required this.images,
  });
}


final List<FacingProgressModel> facingData = [
  FacingProgressModel(
    title: "Front Facing",
    images: [
      ImagePath.g1,
      ImagePath.g2,
    ],
  ),
  FacingProgressModel(
    title: "Back Facing",
    images: [
      ImagePath.g3,
      ImagePath.g4,
    ],
  ),
  FacingProgressModel(
    title: "Left Facing",
    images: [
      ImagePath.g5,
      ImagePath.g6,
    ],
  ),
  FacingProgressModel(
    title: "Right Facing",
    images: [
      ImagePath.g7,
      ImagePath.g8,
    ],
  ),
];