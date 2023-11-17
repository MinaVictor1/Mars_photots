import 'package:basicapp/data/model/mars_photo/mars_photo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({super.key, required this.marsPhoto});

  final MarsPhoto marsPhoto;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: marsPhoto.imgSrc ?? "",
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Center(child: Text("SOL: ${marsPhoto.sol}")),
          Center(
              child: Text(
            "Earth Date: ${DateFormat.yMMMMd().format(marsPhoto.earthDate!)}",
          )),
          Center(child: Text("Camera Name: ${marsPhoto.camera!.name}")),
        ],
      ),
    );
  }
}
