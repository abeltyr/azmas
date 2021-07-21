import 'dart:math';

import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class GenderInput extends StatefulWidget {
  final TextEditingController genderController;
  const GenderInput({
    required this.genderController,
  });

  @override
  _GenderInputState createState() => _GenderInputState();
}

class _GenderInputState extends State<GenderInput>
    with TickerProviderStateMixin {
  late final AnimationController _maleController;
  late final AnimationController _femaleController;

  @override
  void initState() {
    super.initState();
    _maleController = AnimationController(vsync: this);
    _femaleController = AnimationController(vsync: this);
    _maleController.duration = Duration(milliseconds: 250);
    _femaleController.duration = Duration(milliseconds: 250);
    Random random = new Random();
    int randomNumber = random.nextInt(100);

    if (randomNumber % 2 == 0) {
      _maleController.forward();
      widget.genderController.text = "Male";
    } else {
      _femaleController.forward();
      widget.genderController.text = "Female";
    }
  }

  @override
  void dispose() {
    _maleController.dispose();
    _femaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthData = MediaQuery.of(context).size.width - 90;

    Widget checkBox({
      required Function onClick,
      required String title,
      required AnimationController controller,
    }) {
      return GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          width: widthData / 2,
          height: 50,
          child: Row(
            children: [
              Container(
                height: 35,
                width: 35,
                child: Lottie.asset(
                  'assets/Animations/CheckBox.json',
                  controller: controller,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "$title",
                style: GoogleFonts.lora(
                  color: PlatformTheme.textColor1,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  wordSpacing: 1,
                  height: 1.4,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      width: widthData,
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              checkBox(
                controller: _maleController,
                title: "Male",
                onClick: () {
                  _femaleController.reset();
                  _maleController.forward();
                  widget.genderController.text = "Male";
                },
              ),
              checkBox(
                controller: _femaleController,
                title: "Female",
                onClick: () {
                  _maleController.reset();
                  _femaleController.forward();
                  widget.genderController.text = "Female";
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
