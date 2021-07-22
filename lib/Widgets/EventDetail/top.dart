import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/countDown.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/material.dart';

class EventTopWidget extends StatelessWidget {
  final String image;
  final DateTime eventDate;
  const EventTopWidget({required this.image, required this.eventDate});

  @override
  Widget build(BuildContext context) {
    final toDayDate = DateTime.now();
    var difference = eventDate.difference(toDayDate);
    return Stack(
      children: [
        Container(
          height: 350,
          width: double.infinity,
          child: LoadedImageView(
            imageUrl: image,
            fitData: BoxFit.fill,
          ),
        ),
        if (eventDate.isAfter(toDayDate) && difference.inDays < 30)
          Positioned(
            bottom: 25,
            left: (MediaQuery.of(context).size.width - 300) / 2,
            child: Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                color: PlatformTheme.secondaryColorTransparent,
                borderRadius: BorderRadius.circular(7.5),
              ),
              child: CountDownWidget(
                onDone: () {},
                // showSecond: false,
                textColor: PlatformTheme.white,
                date: eventDate.toString(),
              ),
            ),
          )
      ],
    );
  }
}
