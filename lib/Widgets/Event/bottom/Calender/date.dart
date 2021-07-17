import 'package:azmas/Model/Group/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Card/eventCard2.dart';
import 'package:azmas/Widgets/shared/brokenLine.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalenderDate extends StatelessWidget {
  final List plans;
  final int day;
  CalenderDate({required this.plans, required this.day});
  final String imageData =
      "https://images.unsplash.com/photo-1552837418-bf0be889c178?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80";
  @override
  Widget build(BuildContext context) {
    //TODO: fetch the date event here and store it only here
    // not live reload just fecth on intial lode and display
    // it use future builder with loader
    int heightVariable = plans.length == 0 ? 1 : plans.length;
    double heightConstant = 160.0;
    double heightDate = heightConstant * heightVariable;
    return FutureBuilder(
        future: null,
        builder: (context, snapshot) {
          return LayoutBuilder(builder: (ctx, data) {
            return Container(
              height: plans.length == 0 ? 100 : heightDate + 30,
              width: MediaQuery.of(context).size.width - 30,
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: data.maxWidth,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Container(
                          width: 55,
                          child: Text(
                            "Day ${day - 1}",
                            style: GoogleFonts.lora(
                              color: PlatformTheme.secondaryColorLight,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              wordSpacing: 0.1,
                            ),
                          ),
                        ),
                        Container(
                          // alignment: Alignment.center,
                          height: 20,
                          width: data.maxWidth - 65,
                          child: Center(child: BrokenLine()),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          if (plans.length == 0)
                            Container(
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: PlatformTheme.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "No Activity",
                                style: GoogleFonts.lora(
                                  color: PlatformTheme.secondaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  wordSpacing: 0.1,
                                ),
                              ),
                            )
                          else
                            Container(
                              height: heightDate,
                              width: double.infinity,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: plans.length,
                                itemBuilder: (ctx, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: EventCardWidget2(
                                      dateType: false,
                                      title:
                                          "Title Lorem Ipsum is simply dummy text of the printing and typesetting industry. LoreLorem Ipsum is simply dummy text of the printing and typesetting industry. Lore",
                                      description:
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularized in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                      date: "2020-07-07",
                                      eventImage: imageData,
                                      group: GroupModal(
                                        id: "1",
                                        avatar: imageData,
                                        title: "Group Name",
                                      ),
                                      location: "Some Where in AASTU",
                                      onClick: () {},
                                    ),
                                  );
                                },
                              ),
                            )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          });
        });
  }
}
