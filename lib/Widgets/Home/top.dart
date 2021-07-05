import 'package:azmas/Providers/user/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class HomeScreenTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UserProvider>(context, listen: true);
    bool imageLoaded = false;
    return Container(
      height: 100,
      margin: EdgeInsets.only(top: 30),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              children: [],
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.only(
              right: 15,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  usersProvider.currentUser.avatar,
                  cacheWidth: 200,
                  cacheHeight: 200,
                  fit: BoxFit.fill,
                  loadingBuilder: (
                    BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress,
                  ) {
                    if (loadingProgress != null &&
                        loadingProgress.cumulativeBytesLoaded ==
                            loadingProgress.expectedTotalBytes)
                      imageLoaded = true;

                    if (!imageLoaded) {
                      return RiveAnimation.asset(
                          'assets/Animations/loading.riv');
                    } else if (!imageLoaded && loadingProgress == null) {
                      return RiveAnimation.asset(
                          'assets/Animations/loading.riv');
                    } else
                      return child;
                    // if(loadingProgress == ImageChunkEvent.)
                  },
                )),
          ),
        ],
      ),
    );
  }
}
