import 'package:azmas/Model/countDown.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventTopWidget extends StatelessWidget {
  final String image;
  final List<CountDownModel> countDown;
  const EventTopWidget({required this.image, required this.countDown});

  @override
  Widget build(BuildContext context) {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: countDown
                  .map((CountDownModel data) => Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${data.title}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lora(
                                color: PlatformTheme.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                wordSpacing: 1,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${data.value}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lora(
                                color: PlatformTheme.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                wordSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
