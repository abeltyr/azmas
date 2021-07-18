import 'dart:io';
import 'package:azmas/Providers/images/index.dart';
import 'package:azmas/Widgets/Shared/animation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:slugify/slugify.dart';

class LoadedImageView extends StatelessWidget {
  final String imageUrl;
  final BoxFit fitData;
  LoadedImageView({
    required this.imageUrl,
    this.fitData = BoxFit.fill,
  });

  Future<File?> download(BuildContext context) async {
    final directory = await getApplicationDocumentsDirectory();
    final fileDirectory = directory.path;
    String filePath =
        "$fileDirectory/${slugify('Image-$imageUrl').toString() + ".png"}";
    File? newFile = new File(filePath);
    if (!newFile.existsSync()) {
      newFile = await Provider.of<GetImageProvider>(context, listen: false)
          .fetchImage(
        imageUrl: imageUrl,
        filePath: filePath,
      );
    }
    return newFile;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: download(context),
      builder: (context, dataSnap) {
        File? fileData = dataSnap.data as File?;
        if (fileData != null && fileData.existsSync()) {
          imageCache?.evict(new FileImage(fileData));
          imageCache?.clear();
          return Image.file(
            fileData,
            cacheHeight: 1020,
            cacheWidth: 1020,
            fit: fitData,
            errorBuilder: (context, _, error) {
              return AnimationWidget(
                assetData: 'assets/Animations/Loader-1.json',
                durationData: Duration(milliseconds: 2500),
              );
            },
          );
        }
        return AnimationWidget(
          assetData: 'assets/Animations/Loader-1.json',
          durationData: Duration(milliseconds: 2500),
        );
      },
    );
  }
}
