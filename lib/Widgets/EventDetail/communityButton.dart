import 'package:azmas/Model/Event/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/material.dart';

class GroupButton extends StatelessWidget {
  final EventModel? event;
  const GroupButton({
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          7.5,
        ),
        color: PlatformTheme.secondaryColorTransparent,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(
                7.5,
              ),
            ),
            child: Container(
              color: PlatformTheme.primaryColorTransparent,
              height: 30,
              width: 30,
              child: LoadedImageView(
                fitData: BoxFit.fill,
                imageUrl: event!.community!.avatar,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
