import 'package:azmas/Model/navbar.dart';
import 'package:azmas/Screens/Customer/Account/index.dart';
import 'package:azmas/Screens/Customer/Community/index.dart';
import 'package:azmas/Screens/Customer/Event/index.dart';
import 'package:flutter/foundation.dart';

class NavBarDataProvider with ChangeNotifier {
  List<NavbarModel> _navBar = [
    NavbarModel(
      bold: "assets/Icons/Bold/Calendar.svg",
      broken: "assets/Icons/Broken/Calendar.svg",
      screen: EventScreen(),
    ),
    NavbarModel(
      bold: "assets/Icons/Bold/Community.svg",
      broken: "assets/Icons/Broken/Community.svg",
      screen: CommunityScreen(),
    ),
    NavbarModel(
      bold: "assets/Icons/Bold/Profile.svg",
      broken: "assets/Icons/Broken/Profile.svg",
      screen: AccountScreen(),
    ),
  ];

  List<NavbarModel> get navBar {
    return _navBar;
  }

  void updateNavbar(List<NavbarModel> data) {
    //TODO: the nav bar update code
  }
}
