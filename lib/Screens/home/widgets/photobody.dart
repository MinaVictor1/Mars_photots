import 'package:basicapp/data/model/mars_photo/mars_photo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotosBody extends StatelessWidget {
  const PhotosBody({super.key, required this.photos});
  final List<MarsPhoto> photos;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photos[0].imgSrc!,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
