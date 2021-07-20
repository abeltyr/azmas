import 'package:azmas/Utils/inputTheme.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BirthDateInput extends StatefulWidget {
  final TextEditingController birthDateController;
  BirthDateInput({required this.birthDateController});
  @override
  _BirthDateInputState createState() => _BirthDateInputState();
}

class _BirthDateInputState extends State<BirthDateInput> {
  DateTime initialDate = DateTime.now().subtract(Duration(days: 4745));
  void _showDatePicker(ctx) {
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => Container(
        height: 300,
        color: PlatformTheme.white,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(ctx);
                },
                child: Container(
                  height: 35,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Text(
                    "Done",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.textColor1,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      wordSpacing: 1,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: initialDate,
                  maximumDate: DateTime.now().subtract(Duration(days: 4740)),
                  onDateTimeChanged: (val) {
                    widget.birthDateController.text = DateFormat.yMd().format(
                      DateTime.parse(
                        val.toString(),
                      ),
                    );

                    print(widget.birthDateController.text);
                    initialDate = val;
                  }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDatePicker(context);
      },
      child: AbsorbPointer(
        absorbing: true,
        child: TextFormField(
          controller: widget.birthDateController,
          keyboardType: TextInputType.datetime,
          // enabled: false,
          textInputAction: TextInputAction.next,
          maxLines: 1,
          enableSuggestions: false,
          autocorrect: false,
          style: GoogleFonts.lora(
            color: PlatformTheme.textColor1,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            wordSpacing: 0.1,
          ),
          cursorColor: PlatformTheme.accentColorDark,
          decoration: InputTheme().textInputDecoration(label: "Birth Date"),
          validator: (value) {
            if (value!.isEmpty) {
              return 'This is a required field';
            }
            // if (value.length < 8) {
            //   return 'The password is to short';
            // }
            return null;
          },
        ),
      ),
    );
  }
}
