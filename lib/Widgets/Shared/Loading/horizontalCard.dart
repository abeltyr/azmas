import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/brokenLine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HorizontalCardLoading extends StatelessWidget {
  final mainColor = PlatformTheme.primaryColor;
  final secondColor = PlatformTheme.primaryColorDark.withOpacity(0.3);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, data) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: PlatformTheme.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    7.5,
                  ),
                ),
              ),
              width: MediaQuery.of(context).size.width - 30,
              margin: EdgeInsets.only(
                top: 15,
              ),
              child: Column(
                children: [
                  Container(
                    // height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Shimmer.fromColors(
                          baseColor: mainColor,
                          highlightColor: secondColor,
                          direction: ShimmerDirection.ltr,
                          key: UniqueKey(),
                          period: Duration(
                            seconds: 2,
                          ),
                          enabled: true,
                          child: Container(
                            height: 80,
                            width: 85,
                            margin: EdgeInsets.symmetric(
                              horizontal: 7.5,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: PlatformTheme.primaryColorTransparent,
                              borderRadius: BorderRadius.circular(7.5),
                            ),
                          ),
                        ),
                        Container(
                          height: 90,
                          width: data.maxWidth - 100,
                          padding: EdgeInsets.only(right: 15, top: 7.5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor: mainColor,
                                highlightColor: secondColor,
                                direction: ShimmerDirection.ltr,
                                key: UniqueKey(),
                                period: Duration(
                                  seconds: 2,
                                ),
                                enabled: true,
                                child: Container(
                                  height: 22.5,
                                  width: data.maxWidth - 100,
                                  decoration: BoxDecoration(
                                    color:
                                        PlatformTheme.primaryColorTransparent,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: mainColor,
                                    highlightColor: secondColor,
                                    direction: ShimmerDirection.ltr,
                                    key: UniqueKey(),
                                    period: Duration(
                                      seconds: 2,
                                    ),
                                    enabled: true,
                                    child: Container(
                                      height: 18.5,
                                      width: (data.maxWidth - 125) / 2,
                                      decoration: BoxDecoration(
                                        color: PlatformTheme
                                            .primaryColorTransparent,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: mainColor,
                                    highlightColor: secondColor,
                                    direction: ShimmerDirection.ltr,
                                    key: UniqueKey(),
                                    period: Duration(
                                      seconds: 2,
                                    ),
                                    enabled: true,
                                    child: Container(
                                      height: 18.5,
                                      width: (data.maxWidth - 125) / 2,
                                      decoration: BoxDecoration(
                                        color: PlatformTheme
                                            .primaryColorTransparent,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 18,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor: mainColor,
                                      highlightColor: secondColor,
                                      direction: ShimmerDirection.ltr,
                                      key: UniqueKey(),
                                      period: Duration(
                                        seconds: 2,
                                      ),
                                      enabled: true,
                                      child: Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          color: PlatformTheme
                                              .primaryColorTransparent,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.5,
                                    ),
                                    Shimmer.fromColors(
                                      baseColor: mainColor,
                                      highlightColor: secondColor,
                                      direction: ShimmerDirection.ltr,
                                      key: UniqueKey(),
                                      period: Duration(
                                        seconds: 2,
                                      ),
                                      enabled: true,
                                      child: Container(
                                        width: data.maxWidth - 136,
                                        decoration: BoxDecoration(
                                          color: PlatformTheme
                                              .primaryColorTransparent,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  BrokenLine(
                    color: PlatformTheme.primaryColor,
                    size: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Shimmer.fromColors(
                          baseColor: mainColor,
                          highlightColor: secondColor,
                          direction: ShimmerDirection.ltr,
                          key: UniqueKey(),
                          period: Duration(
                            seconds: 2,
                          ),
                          enabled: true,
                          child: Container(
                            margin: EdgeInsets.only(left: 7.5),
                            width: 100,
                            height: 20,
                            decoration: BoxDecoration(
                              color: PlatformTheme.primaryColorTransparent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Row(
                            children: [
                              Shimmer.fromColors(
                                baseColor: mainColor,
                                highlightColor: secondColor,
                                direction: ShimmerDirection.ltr,
                                key: UniqueKey(),
                                period: Duration(
                                  seconds: 2,
                                ),
                                enabled: true,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color:
                                        PlatformTheme.primaryColorTransparent,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Shimmer.fromColors(
                                baseColor: mainColor,
                                highlightColor: secondColor,
                                direction: ShimmerDirection.ltr,
                                key: UniqueKey(),
                                period: Duration(
                                  seconds: 2,
                                ),
                                enabled: true,
                                child: Container(
                                  width: 120,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color:
                                        PlatformTheme.primaryColorTransparent,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   right: 0,
            //   child: Container(
            //     height: 25,
            //     width: !dateType ? 90 : 100,
            //     decoration: BoxDecoration(
            //       color: PlatformTheme.accentColorDark,
            //       borderRadius: BorderRadius.circular(
            //         7.5,
            //       ),
            //     ),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         dateType
            //             ? SvgPicture.asset(
            //                 "assets/Icons/Broken/Calendar.svg",
            //                 color: PlatformTheme.white,
            //                 height: 16,
            //                 width: 16,
            //               )
            //             : SvgPicture.asset(
            //                 "assets/Icons/Broken/Time.svg",
            //                 color: PlatformTheme.white,
            //                 height: 16,
            //                 width: 16,
            //               ),
            //         SizedBox(
            //           width: 7.5,
            //         ),
            //         Container(
            //           child: Text(
            //             "${dateType ? DateFormat.yMMMd().format(eventStartDate) : DateFormat.jm().format(eventStartDate)}",
            //             maxLines: 1,
            //             overflow: TextOverflow.ellipsis,
            //             style: GoogleFonts.lora(
            //               color: PlatformTheme.white,
            //               fontWeight: FontWeight.w400,
            //               fontSize: 12,
            //               fontStyle: FontStyle.italic,
            //               wordSpacing: 1,
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 2.5,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
