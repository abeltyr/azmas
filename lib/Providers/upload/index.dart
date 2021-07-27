import 'dart:async';
import 'dart:io';
import 'package:azmas/Graphql/user/index.dart';
import 'package:graphql/client.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:azmas/Graphql/upload/index.dart';
import '../../client.dart';
import 'package:http_parser/http_parser.dart';

class UploadProvider with ChangeNotifier {
  Future<void> uploadImage({required File file}) async {
    final byteData = file.readAsBytesSync();
    final multipartFile = MultipartFile.fromBytes(
      'photo',
      byteData,
      filename: '${DateTime.now().microsecondsSinceEpoch}.png',
      contentType: MediaType("image", "png"),
    );
    final QueryResult result = await Config.initializeClient().mutate(
      MutationOptions(
        document: gql(Upload.singleUpload),
        variables: {
          'file': multipartFile,
        },
      ),
    );

    // final QueryResult result =
    //     await Config.initializeClient().query(QueryOptions(
    //   document: gql(User.users),
    //   variables: {
    //     'usersFilter': {},
    //   },
    // ));

    if (result.hasException) {
      print("exception");
      print(result.exception!.graphqlErrors.toString());
      print(result.exception!.linkException.toString());
      throw FormatException(result.exception.toString());
    } else {
      print(result.data);
    }
  }
}
