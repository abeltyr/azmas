import 'package:azmas/Providers/interaction/eventScreen.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Event/top/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideTap extends StatelessWidget {
  const SlideTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context, listen: false);
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 150,
      ),
      child: Opacity(
        opacity: !eventProvider.searchTap ? 1 : 0,
        child: Container(
          width: (MediaQuery.of(context).size.width - 30) * 2 / 3,
          height: !eventProvider.searchTap ? 55 : 0,
          decoration: BoxDecoration(
            color: PlatformTheme.white,
            borderRadius: BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                margin: EdgeInsets.only(
                  top: 7.5,
                  bottom: 7.5,
                  left: eventProvider.selectedTab == 0
                      ? 7.5
                      : (MediaQuery.of(context).size.width - 30) * 2 / 6 + 7.5,
                ),
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: PlatformTheme.secondaryColorLight,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      15,
                    ),
                  ),
                ),
                width: (MediaQuery.of(context).size.width - 30) * 2 / 6 - 15,
                duration: Duration(
                  milliseconds: 150,
                ),
              ),
              Row(
                children: [
                  EventTopButton(
                    numValue: 0,
                    title: "Events",
                  ),
                  EventTopButton(
                    numValue: 1,
                    title: "Calander",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
