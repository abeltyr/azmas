import 'dart:async';
import 'package:graphql/client.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:azmas/Graphql/upload/index.dart';
import 'package:image_picker/image_picker.dart';
import '../../client.dart';
import 'package:http_parser/http_parser.dart';

class UploadProvider with ChangeNotifier {
  Future<Map?> uploadImage({required XFile? file}) async {
    if (file != null) {
      var data = file.path.split(".");
      final byteData = await file.readAsBytes();
      final multipartFile = MultipartFile.fromBytes(
        'photo',
        byteData,
        filename:
            '${DateTime.now().microsecondsSinceEpoch}.${data[data.length - 1]}',
        contentType: MediaType("image", "${data[data.length - 1]}"),
      );
      final QueryResult result = await Config.initializeClient().mutate(
        MutationOptions(
          document: gql(Upload.singleUpload),
          variables: {
            'file': multipartFile,
          },
        ),
      );
      if (result.hasException) {
        print("exception");
        print(result.exception!.graphqlErrors.toString());
        print(result.exception!.linkException.toString());
        throw FormatException(result.exception.toString());
      } else {
        print(result.data!["singleUpload"]);
        return result.data!["singleUpload"];
      }
    }
    return null;
  }
}
