import 'package:fitnestx/core/const/images_path.dart';

class EquipmentModel {
  final String image;
  final String title;

  EquipmentModel({
    required this.image,
    required this.title,
  });
}


final List<EquipmentModel> equipmentData = [
  EquipmentModel(
      image: ImagePath.barbel,
      title: "Barbel",
  ),
  EquipmentModel(
    image: ImagePath.skippingRope,
    title: "Skipping Rope",
  ),
  EquipmentModel(
    image: ImagePath.waterBottle,
    title: "Bottle 1 Liters",
  ),
  EquipmentModel(
    image: ImagePath.barbel,
    title: "Barbel",
  ),
  EquipmentModel(
    image: ImagePath.skippingRope,
    title: "Skipping Rope",
  ),
];
