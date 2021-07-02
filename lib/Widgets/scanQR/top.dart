import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopWidget extends StatelessWidget {
  final Color iconColor;
  TopWidget({required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Container(),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 50,
              height: 50,
              color: Colors.transparent,
              child: Icon(
                CupertinoIcons.xmark_circle,
                color: iconColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
