import 'package:azmas/Providers/interaction/setting.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SettingTabs extends StatefulWidget {
  @override
  _SettingTabsState createState() => _SettingTabsState();
}

class _SettingTabsState extends State<SettingTabs>
    with TickerProviderStateMixin {
  late final AnimationController _firstController;
  late final AnimationController _secondController;
  late final AnimationController _thirdController;
  late final AnimationController _fourthController;

  @override
  void initState() {
    super.initState();
    _firstController = AnimationController(vsync: this);
    _secondController = AnimationController(vsync: this);
    _thirdController = AnimationController(vsync: this);
    _fourthController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settingInteractionProvider =
        Provider.of<SettingInteractionProvider>(context, listen: true);
    final totalWidth = MediaQuery.of(context).size.width;
    Widget tab({
      required String icon,
      required AnimationController controller,
      required Function onClick,
    }) {
      return GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          height: 30,
          width: 30,
          child: Lottie.asset(
            icon,
            controller: controller,
            onLoaded: (composition) {
              // Configure the AnimationController with the duration of the
              // Lottie file and start the animation.
              controller.duration = Duration(
                milliseconds: 350,
              );
              if (icon.contains("Edit")) {
                controller.forward();
              }
            },
          ),
        ),
      );
    }

    return Stack(
      children: [
        Container(
          height: 50,
          width: totalWidth,
          child: Row(
            children: [
              Expanded(
                child: tab(
                  icon: 'assets/Animations/Edit.json',
                  controller: _firstController,
                  onClick: () {
                    _firstController.forward();
                    _secondController.reset();
                    _thirdController.reset();
                    _fourthController.reset();
                    settingInteractionProvider.updateSelectedTap(0);
                  },
                ),
              ),
              Expanded(
                child: tab(
                  icon: 'assets/Animations/Mail.json',
                  controller: _secondController,
                  onClick: () {
                    _firstController.reset();
                    _secondController.forward();
                    _thirdController.reset();
                    _fourthController.reset();
                    settingInteractionProvider.updateSelectedTap(1);
                  },
                ),
              ),
              Expanded(
                child: tab(
                  icon: 'assets/Animations/Explore.json',
                  controller: _thirdController,
                  onClick: () {
                    _firstController.reset();
                    _secondController.reset();
                    _thirdController.forward();
                    _fourthController.reset();
                    settingInteractionProvider.updateSelectedTap(2);
                  },
                ),
              ),
              Expanded(
                child: tab(
                  icon: 'assets/Animations/Lock.json',
                  controller: _fourthController,
                  onClick: () {
                    _firstController.reset();
                    _secondController.reset();
                    _thirdController.reset();
                    _fourthController.forward();
                    settingInteractionProvider.updateSelectedTap(3);
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: AnimatedContainer(
            duration: Duration(
              milliseconds: 250,
            ),
            decoration: BoxDecoration(
              color: PlatformTheme.secondaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            height: 5,
            margin: EdgeInsets.only(
              left: settingInteractionProvider.selectedTab * totalWidth / 4,
            ),
            width: totalWidth / 4,
          ),
        ),
      ],
    );
  }
}
