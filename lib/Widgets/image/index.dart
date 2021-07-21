import 'dart:io';
import 'package:azmas/Providers/images/index.dart';
import 'package:azmas/Widgets/Shared/animation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:slugify/slugify.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadedImageView extends StatefulWidget {
  final String imageUrl;
  final BoxFit fitData;
  LoadedImageView({
    required this.imageUrl,
    this.fitData = BoxFit.fill,
  });

  @override
  _LoadedImageViewState createState() => _LoadedImageViewState();
}

class _LoadedImageViewState extends State<LoadedImageView> {
  bool error = false;
  Future<File?> download(BuildContext context) async {
    if (!await Permission.storage.isGranted &&
        !await Permission.storage.isPermanentlyDenied) {
      final res = await Permission.storage.request();
      if (res == PermissionStatus.granted)
        setState(() {
          error = false;
        });
    } else {
      final directory = await getApplicationDocumentsDirectory();
      final fileDirectory = directory.path;
      String filePath =
          "$fileDirectory/${slugify('Image-${widget.imageUrl}').toString() + ".png"}";
      File? newFile = new File(filePath);
      if (!newFile.existsSync()) {
        try {
          newFile = await Provider.of<GetImageProvider>(context, listen: false)
              .fetchImage(
            imageUrl: widget.imageUrl,
            filePath: filePath,
          );
          return newFile;
        } catch (e) {}
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: download(context),
      builder: (context, dataSnap) {
        File? fileData = dataSnap.data as File?;
        if (fileData == null &&
            dataSnap.connectionState == ConnectionState.done) {
          return Image.network(
            widget.imageUrl,
            cacheHeight: 1020,
            cacheWidth: 1020,
            fit: widget.fitData,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(child: Text("loading"));
              // return AnimationWidget(
              //   assetData: 'assets/Animations/Loader-1.json',
              //   durationData: Duration(milliseconds: 2500),
              // );
            },
            errorBuilder: (context, _, error) {
              return Container(child: Text("Error"));
            },
          );
        } else if (fileData != null &&
            fileData.existsSync() &&
            dataSnap.connectionState == ConnectionState.done) {
          imageCache?.evict(new FileImage(fileData));
          imageCache?.clear();
          return Image.file(
            fileData,
            cacheHeight: 1020,
            cacheWidth: 1020,
            fit: widget.fitData,
            errorBuilder: (context, _, error) {
              return Container(child: Text("Error"));
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
