import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/brokenLine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EventCardFlexLoading extends StatelessWidget {
  final mainColor = PlatformTheme.primaryColor;
  final secondColor = PlatformTheme.primaryColorDark.withOpacity(0.3);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, data) {
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
            margin: EdgeInsets.only(
              top: 160,
            ),
            padding: EdgeInsets.only(
              top: 35,
              left: 15,
              right: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
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
                    height: 22.5,
                    decoration: BoxDecoration(
                      color: PlatformTheme.primaryColorTransparent,
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
                        width: (data.maxWidth - 40) / 2,
                        decoration: BoxDecoration(
                          color: PlatformTheme.primaryColorTransparent,
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
                        width: (data.maxWidth - 40) / 2,
                        decoration: BoxDecoration(
                          color: PlatformTheme.primaryColorTransparent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
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
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: PlatformTheme.primaryColorTransparent,
                            borderRadius: BorderRadius.circular(5),
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
                          width: data.maxWidth - 52.5,
                          decoration: BoxDecoration(
                            color: PlatformTheme.primaryColorTransparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
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
                          width: 100,
                          height: 20,
                          decoration: BoxDecoration(
                            color: PlatformTheme.primaryColorTransparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      Container(
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
                                  color: PlatformTheme.primaryColorTransparent,
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
                                  color: PlatformTheme.primaryColorTransparent,
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
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    7.5,
                  ),
                ),
                child: Container(
                  color: PlatformTheme.primaryColor,
                  height: 30,
                  width: 30,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
