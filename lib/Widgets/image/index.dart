import 'dart:io';
import 'package:azmas/Providers/images/index.dart';
import 'package:azmas/Widgets/Shared/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:slugify/slugify.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io' show Platform;

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
    if (Platform.isAndroid &&
        !await Permission.storage.isGranted &&
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
        } catch (e) {
          return null;
        }
      }
      return newFile;
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
          print("online");
          return Image.network(
            widget.imageUrl,
            cacheHeight: 720,
            cacheWidth: 720,
            fit: widget.fitData,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return AnimationWidget(
                assetData: 'assets/Animations/Loader-1.json',
                durationData: Duration(milliseconds: 2500),
              );
            },
            errorBuilder: (context, _, error) {
              return SvgPicture.asset(
                "assets/Images/Logo.svg",
                fit: widget.fitData,
              );
            },
          );
        } else if (fileData != null &&
            fileData.existsSync() &&
            dataSnap.connectionState == ConnectionState.done) {
          print("offline");
          imageCache?.evict(new FileImage(fileData));
          imageCache?.clear();
          return Image.file(
            fileData,
            cacheHeight: 1020,
            cacheWidth: 1020,
            fit: widget.fitData,
            errorBuilder: (context, _, error) {
              return SvgPicture.asset(
                "assets/Images/Logo.svg",
                fit: widget.fitData,
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
