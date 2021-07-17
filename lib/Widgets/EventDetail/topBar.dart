import 'package:azmas/Model/Event/index.dart';
import 'package:azmas/Providers/event/selected.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventProvider =
        Provider.of<EventSelectedProvider>(context, listen: false);
    EventModel? event = eventProvider.event;
    return Container(
      margin: EdgeInsets.only(top: 35),
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 40,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: PlatformTheme.secondaryColorTransparent,
              ),
              child: Icon(
                CupertinoIcons.xmark,
                size: 25,
                color: PlatformTheme.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: PlatformTheme.primaryColorTransparent,
                border: Border.all(
                  width: 2,
                  color: PlatformTheme.primaryColorTransparent,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    50,
                  ),
                ),
                child: Container(
                  color: PlatformTheme.primaryColorTransparent,
                  height: 30,
                  width: 30,
                  child: LoadedImageView(
                    fitData: BoxFit.fill,
                    imageUrl: event!.group!.avatar,
                  ),
                ),
              ),
            ),
          ),
          // GroupButton(
          //   event: event,
          // )
        ],
      ),
    );
  }
}
