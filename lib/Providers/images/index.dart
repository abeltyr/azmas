import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class GetImageProvider with ChangeNotifier {
  List<String> downloadedFiles = [];

  Future<File?> fetchImage({
    required String imageUrl,
    required String filePath,
  }) async {
    try {
      File? fileData = new File(filePath);
      if (!await fileData.exists()) {
        final ByteData imageData =
            await NetworkAssetBundle(Uri.parse(imageUrl)).load("");
        final Uint8List bytes = imageData.buffer.asUint8List();
        fileData = await fileData.writeAsBytes(bytes);
        return fileData;
      }
      return null;
    } catch (e) {
      print("Error");
      print(e);
      return null;
    }
  }
}
