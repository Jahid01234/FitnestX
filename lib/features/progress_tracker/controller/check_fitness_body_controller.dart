import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CheckFitnessBodyController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxList<File> galleryImages = <File>[].obs;

  /// Camera
  Future<void> pickFromCamera() async {
    final XFile? image =
    await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  /// Gallery
  Future<void> pickFromGallery() async {
    final XFile? image =
    await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final file = File(image.path);
      galleryImages.add(file);
      selectedImage.value = file;
    }
  }

  void selectFromList(File image) {
    selectedImage.value = image;
  }
}
