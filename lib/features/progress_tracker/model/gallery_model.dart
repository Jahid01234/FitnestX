import 'package:fitnestx/core/const/images_path.dart';

class GallerySectionModel {
  final String sectionTitle;
  final List<GalleryItemModel> items;

  GallerySectionModel({
    required this.sectionTitle,
    required this.items,
  });
}


class GalleryItemModel {
  final String image;

  GalleryItemModel({
    required this.image,
  });
}



final List<GallerySectionModel> gallerySectionsData = [
  GallerySectionModel(
    sectionTitle: "2 June",
    items: [
      GalleryItemModel(
        image: ImagePath.g1,
      ),
      GalleryItemModel(
        image: ImagePath.g2,
      ),
      GalleryItemModel(
        image: ImagePath.g3,
      ),
      GalleryItemModel(
        image: ImagePath.g4,
      ),
    ],
  ),

  GallerySectionModel(
    sectionTitle: "5 June",
    items: [
      GalleryItemModel(
        image: ImagePath.g5,
      ),
      GalleryItemModel(
        image: ImagePath.g6,
      ),
      GalleryItemModel(
        image: ImagePath.g7,
      ),
      GalleryItemModel(
        image: ImagePath.g8,
      ),
    ],
  ),

];

