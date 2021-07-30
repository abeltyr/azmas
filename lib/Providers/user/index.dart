import 'dart:convert';
import 'dart:io';

import 'package:azmas/Graphql/user/index.dart';
import 'package:azmas/Model/User/index.dart';
import 'package:azmas/client.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:device_info_plus/device_info_plus.dart';

class UserProvider with ChangeNotifier {
  var userProfile = Hive.box<UserModel>('users');
  UserModel? _currentUser = Hive.box<UserModel>('users').get("currentUser");

  UserModel? get currentUser {
    return _currentUser;
  }

  Future<String> deviceData() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print('Running on ${androidInfo.model}');
      return androidInfo.toString();
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return {
        "machine": iosInfo.utsname.machine,
        "isPhysicalDevice": iosInfo.isPhysicalDevice,
        "nodename": iosInfo.utsname.nodename,
        "release": iosInfo.utsname.release,
        "identifierForVendor": iosInfo.identifierForVendor,
        "systemVersion": iosInfo.systemVersion,
        "systemName": iosInfo.systemName,
      }.toString();
    }
  }

  Future<void> login({
    required String password,
    required String userName,
  }) async {
    String device = await deviceData();
    final QueryResult result = await Config.initializeClient().mutate(
      MutationOptions(
        document: gql(User.login),
        variables: {
          'loginData': {
            "userName": userName,
            "password": password,
            "device": device,
          },
        },
      ),
    );
    if (result.hasException) {
      throw (result.exception!.graphqlErrors[0].message.toString());
    } else {
      setupUser(result.data!["login"]);
    }
  }

  Future<void> signUp({
    required String userName,
    required String fullName,
    required String email,
    required String phoneNumber,
    required DateTime birthDate,
    required String gender,
    required String instagram,
    required String twitter,
    required String telegram,
    required String facebook,
    required bool verified,
    required bool activated,
    required String password,
  }) async {
    String device = await deviceData();
    final QueryResult result = await Config.initializeClient().mutate(
      MutationOptions(
        document: gql(User.signUp),
        variables: {
          'signUpData': {
            "phoneNumber": phoneNumber,
            "email": email,
            "userName": userName,
            "birthDate": birthDate.toIso8601String(),
            "instagram": instagram,
            "facebook": facebook,
            "twitter": twitter,
            "telegram": telegram,
            "fullName": fullName,
            "gender": gender,
            "device": device,
            "password": password,
          },
        },
      ),
    );
    if (result.hasException) {
      print(result.exception!);
      throw (result.exception!.graphqlErrors[0].message.toString());
    } else {
      setupUser(result.data!["signUp"]);
    }
  }

  void setupUser(dynamic res) async {
    UserModel userData = UserModel(
      id: res["id"],
      phoneNumber: res["phoneNumber"],
      email: res["email"],
      userName: res["userName"],
      avatar: res["avatar"]["url"],
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
      token: res["token"],
      createdAt: DateTime.parse(res["createdAt"]),
      updatedAt: DateTime.parse(res["updatedAt"]),
    );
    userProfile.put(
      "currentUser",
      userData,
    );
  }

  Future<bool> personalDataUpdate({
    required String fullName,
    required DateTime birthDate,
    required String gender,
    required String bio,
  }) async {
    final QueryResult result = await Config.initializeClient().mutate(
      MutationOptions(
        document: gql(User.personalDataUpdate),
        variables: {
          'personalDataUpdateData': {
            "birthDate": birthDate.toIso8601String(),
            "fullName": fullName,
            "gender": gender,
            "bio": bio,
          },
        },
      ),
    );
    if (result.hasException) {
      print(result.exception!);
      throw (result.exception!.graphqlErrors[0].message.toString());
    } else if (result.data!["personalDataUpdate"]) {
      return result.data!["personalDataUpdate"];
    }
    return false;
  }

  Future<bool> accountDataUpdate({
    required String email,
    required String phoneNumber,
    required String userName,
  }) async {
    print(email);
    final QueryResult result = await Config.initializeClient().mutate(
      MutationOptions(
        document: gql(User.accountDataUpdate),
        variables: {
          'accountDataUpdateData': {
            "email": email,
            "phoneNumber": phoneNumber,
            "userName": userName,
          },
        },
      ),
    );
    if (result.hasException) {
      print(result.exception!);
      throw (result.exception!.graphqlErrors[0].message.toString());
    } else if (result.data!["accountDataUpdate"]) {
      return result.data!["accountDataUpdate"];
    }
    return false;
  }

  Future<bool> socailDataUpdate({
    required String instagram,
    required String twitter,
    required String telegram,
    required String facebook,
  }) async {
    final QueryResult result = await Config.initializeClient().mutate(
      MutationOptions(
        document: gql(User.socailDataUpdate),
        variables: {
          'socailDataUpdateData': {
            "instagram": instagram,
            "twitter": twitter,
            "telegram": telegram,
            "facebook": facebook,
          },
        },
      ),
    );
    if (result.hasException) {
      print(result.exception!);
      throw (result.exception!.graphqlErrors[0].message.toString());
    } else if (result.data!["socailDataUpdate"]) {
      return result.data!["socailDataUpdate"];
    }
    return false;
  }

  Future<void> securityDataUpdate({
    required String oldPassword,
    required String password,
  }) async {
    String device = await deviceData();
    final QueryResult result = await Config.initializeClient().mutate(
      MutationOptions(
        document: gql(User.securityDataUpdate),
        variables: {
          'securityDataUpdateData': {
            "oldPassword": oldPassword,
            "password": password,
            "device": device,
          },
        },
      ),
    );
    if (result.hasException) {
      print(result.exception!);
      throw (result.exception!.graphqlErrors[0].message.toString());
    } else {
      setupUser(result.data!["securityDataUpdate"]);
    }
  }

  Future<bool> profileUpdate({
    required String uploadFileId,
    required String password,
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
    } else if (result.data!["socailDataUpdate"]) {
      return result.data!["socailDataUpdate"];
    }
    return false;
  }

  void logout() {
    userProfile.delete("currentUser");
  }
}
