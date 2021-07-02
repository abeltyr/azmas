import 'package:azmas/Model/user.dart';
import 'package:azmas/Providers/transfer/index.dart';
import 'package:azmas/Providers/transfer/transferUsers.dart';
import 'package:azmas/Providers/transfer/transferuser.dart';
import 'package:azmas/Screens/Custmer/QR/index.dart';
import 'package:azmas/Screens/Custmer/Transfer/index.dart';
import 'package:azmas/Widgets/card/infoCard.dart';
import 'package:azmas/Widgets/card/peopleCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PeopleListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<UserModel> users = [
      ...Provider.of<TransferUsersProvider>(context, listen: true).transferUser
    ];
    if (users[0].person)
      users.insert(
        0,
        UserModel(
          firstName: AppLocalizations.of(context)!.scan,
          avatar: "assets/icons/Scan.svg",
          person: false,
        ),
      );
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: users.length,
          itemBuilder: (buildContext, index) {
            if (users[index].person)
              return GestureDetector(
                onTap: () {
                  Provider.of<TransferUserProvider>(context, listen: false)
                      .setTransctionUser(
                    userData: users[index],
                  );
                  Navigator.pushNamed(context, TransferScreen.routeName);
                },
                child: PeopleCardWidget(
                  title: "${users[index].firstName}",
                  imageLocation: users[index].avatar,
                ),
              );
            else
              return GestureDetector(
                onTap: () {
                  showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context) => QRScanScreen(),
                  );
                },
                child: InfoCardWidget(
                  title: "${users[index].firstName}",
                  svgLocation: users[index].avatar,
                ),
              );
          }),
    );
  }
}
