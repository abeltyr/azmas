import 'package:azmas/Model/numPad.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeyPadWidget extends StatelessWidget {
  final Function onNumberTap;
  final Function onDeleteTap;

  KeyPadWidget({
    required this.onNumberTap,
    required this.onDeleteTap,
  });

  Widget rowWidget(List<NumPadModel> rowData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowData.map((data) {
        if (data.space)
          return SizedBox(
            width: 10,
          );
        else if (data.delete)
          return GestureDetector(
            onTap: () {
              onDeleteTap();
            },
            child: Container(
              width: 100,
              height: 65,
              color: Colors.transparent,
              child: Icon(
                CupertinoIcons.delete_left,
                color: PlatformTheme.white,
              ),
            ),
          );
        else if (data.empty)
          return Container(
            width: 100,
            height: 50,
            color: Colors.transparent,
          );
        else
          return GestureDetector(
            onTap: () {
              onNumberTap(data.value);
            },
            child: Container(
              width: 100,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: PlatformTheme.secondaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                "${data.value}",
                style: GoogleFonts.lora(
                  color: PlatformTheme.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
            ),
          );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<NumPadModel> firstRow = [
      NumPadModel(value: "1"),
      NumPadModel(space: true),
      NumPadModel(value: "2"),
      NumPadModel(space: true),
      NumPadModel(value: "3"),
    ];
    List<NumPadModel> secondRow = [
      NumPadModel(value: "4"),
      NumPadModel(space: true),
      NumPadModel(value: "5"),
      NumPadModel(space: true),
      NumPadModel(value: "6"),
    ];
    List<NumPadModel> thirdRow = [
      NumPadModel(value: "7"),
      NumPadModel(space: true),
      NumPadModel(value: "8"),
      NumPadModel(space: true),
      NumPadModel(value: "9"),
    ];
    List<NumPadModel> fourthRow = [
      NumPadModel(empty: true),
      NumPadModel(space: true),
      NumPadModel(value: "0"),
      NumPadModel(space: true),
      NumPadModel(delete: true),
    ];
    return Column(
      children: [
        rowWidget(firstRow),
        SizedBox(
          height: 10,
        ),
        rowWidget(secondRow),
        SizedBox(
          height: 10,
        ),
        rowWidget(thirdRow),
        SizedBox(
          height: 10,
        ),
        rowWidget(fourthRow),
      ],
    );
  }
}
