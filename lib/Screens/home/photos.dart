import 'package:basicapp/Screens/home/widgets/photobody.dart';
import 'package:basicapp/data/model/mars_photo/mars_photo.dart';
import 'package:basicapp/data/repo/repo.dart';
import 'package:flutter/material.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key, required this.dateTime});
  final DateTime dateTime;

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  List<MarsPhoto>? photos;
  @override
  void initState() {
    loadPhotos();
    super.initState();
  }

  Future<void> loadPhotos() async {
    try {
      List<MarsPhoto> fetchedPhotos = await Repo().fetchPhotos(widget.dateTime);
      setState(() {
        photos = fetchedPhotos;
      });
    } catch (e) {
      // Handle any errors that may occur during the fetchPhotos operation
      print("Error fetching photos: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Photos'),
        ),
        body: photos == null
            ? const Center(
                child: CircularProgressIndicator(), // Show a loading indicator
              )
            : PhotosBody(photos: photos!),
      ),
    );
  }
}
