import 'package:azmas/Graphql/user/index.dart';
import 'package:azmas/Model/User/index.dart';
import 'package:azmas/client.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserProvider with ChangeNotifier {
  var userProfile = Hive.box<UserModel>('users');
  UserModel? _currentUser = Hive.box<UserModel>('users').get("currentUser");

  UserModel? get currentUser {
    return _currentUser;
  }

  Future<void> login() async {}

  Future<void> signUp({
    required UserModel data,
    required String password,
  }) async {
    print(data.birthDate!.toString());
    final QueryResult result = await Config.initializeClient().mutate(
      MutationOptions(
        document: gql(User.createUser),
        variables: {
          'createUserData': {
            "phoneNumber": data.phoneNumber,
            "email": data.email,
            "userName": data.userName,
            "birthDate": data.birthDate!.toIso8601String(),
            "instagram": data.instagram,
            "facebook": data.facebook,
            "twitter": data.twitter,
            "telegram": data.telegram,
            "fullName": data.fullName,
            "gender": data.gender,
          },
        },
      ),
    );
    if (result.hasException) {
      print("exception");
      print(result.exception!.graphqlErrors.toString());
      print(result.exception!.linkException.toString());
      throw FormatException(result.exception.toString());
    } else {
      final res = result.data!["createUser"];
      print(res);
      setupUser(UserModel(
        id: res["id"],
        phoneNumber: res["phoneNumber"],
        email: res["email"],
        userName: res["userName"],
        avatar: "https://source.unsplash.com/random",
        // res["avatar"],
        birthDate: DateTime.parse(res["birthDate"]),
        instagram: res["instagram"],
        facebook: res["facebook"],
        twitter: res["twitter"],
        telegram: res["telegram"],
        fullName: res["fullName"],
        gender: res["gender"],
        bio: res["bio"],
        activated: res["activated"],
        verified: res["verified"],
        createdAt: DateTime.parse(res["createdAt"]),
        updatedAt: DateTime.parse(res["updatedAt"]),
      ));
    }
  }

  void setupUser(UserModel userData) async {
    userProfile.put(
      "currentUser",
      userData,
    );
  }

  void logout() {
    userProfile.delete("currentUser");
  }
}
