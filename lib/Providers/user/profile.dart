import 'package:azmas/Graphql/user/index.dart';
import 'package:azmas/client.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

class UserProfileProvider with ChangeNotifier {
  bool _loading = false;

  bool get loading {
    return _loading;
  }

  Future<bool> profileUpdate({
    required String uploadFileId,
  }) async {
    final QueryResult result = await Config.initializeClient().mutate(
      MutationOptions(
        document: gql(User.profileUpdate),
        variables: {
          'profileUpdateUploadFileId': uploadFileId,
        },
      ),
    );
    if (result.hasException) {
      print(result.exception!);
      throw (result.exception!.graphqlErrors[0].message.toString());
    } else if (result.data!["profileUpdate"]) {
      return result.data!["profileUpdate"];
    }
    return false;
  }

  void setloading(bool data) {
    _loading = data;
    notifyListeners();
  }
}
