import 'package:azmas/Model/transaction.dart';
import 'package:azmas/Model/user.dart';
import 'package:azmas/Providers/transfer/index.dart';
import 'package:azmas/Providers/transfer/transferUsers.dart';
import 'package:azmas/Providers/transfer/transferuser.dart';
import 'package:azmas/Providers/user/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/card/peopleCard.dart';
import 'package:azmas/Widgets/keypad/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class TransferScreen extends StatelessWidget {
  static const routeName = "/transfer";

  Widget userList(transferUsersProvider, BuildContext context, UserModel user) {
    List<UserModel> users = [...transferUsersProvider.transferUser];
    users.remove(user);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: users.length / 3 < 2 ? 125 : 250,
      padding: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 15,
      ),
      margin: EdgeInsets.only(
        top: 85,
        left: 35,
        right: 35,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
        color: PlatformTheme.white,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
        ),
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Provider.of<TransferUserProvider>(context, listen: false)
                  .setTransctionUser(
                userData: users[index],
              );
            },
            child: PeopleCardWidget(
              title: "${users[index].firstName}",
              imageLocation: users[index].avatar,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat('#,###,000');
    final usersProvider = Provider.of<UserProvider>(context, listen: false);
    final transferUsersProvider =
        Provider.of<TransferUsersProvider>(context, listen: true);
    final transactionProvider =
        Provider.of<TransferProvider>(context, listen: true);
    final transferUserProvider =
        Provider.of<TransferUserProvider>(context, listen: true);
    UserModel user = transferUserProvider.transferUser;
    String transfer = transferUsersProvider.transfer;
    int innerTransfer = transferUsersProvider.innerTransfer;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Transfer"),
        leading: GestureDetector(
          child: Container(
            width: 50,
            height: 50,
            color: Colors.transparent,
            child: Icon(
              CupertinoIcons.left_chevron,
              size: 25,
            ),
          ),
          onTap: () {
            transferUsersProvider.updateShowUser(false);
            transferUsersProvider.resetData();
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              transferUsersProvider.updateShowUser(false);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: PlatformTheme.primaryColor,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      transferUsersProvider.updateShowUser(true);
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              user.avatar,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2.5),
                            decoration: BoxDecoration(
                              color: PlatformTheme.secondaryColorOpticLight,
                            ),
                            child: Text(
                              "${user.account}",
                              style: GoogleFonts.lora(
                                color: PlatformTheme.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${user.firstName} ${user.lastName}",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text(
                      "$transfer ETB",
                      style: GoogleFonts.lora(
                        color: PlatformTheme.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Balance",
                              style: GoogleFonts.lora(
                                color: PlatformTheme.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "${numberFormat.format(usersProvider.currentUser.balance)} ETB",
                              style: GoogleFonts.lora(
                                color: PlatformTheme.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2.5),
                          decoration: BoxDecoration(
                            color: PlatformTheme.accentColorOptic,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "**${usersProvider.currentUser.account.substring(12, 16)}",
                            style: GoogleFonts.lora(
                              color: PlatformTheme.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (transferUsersProvider.showUser)
            userList(transferUsersProvider, context, user),
          Positioned(
            bottom: 300,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 50),
              child: CupertinoButton(
                color: PlatformTheme.positive,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text("Send $transfer ETB",
                      style: GoogleFonts.lora(
                        color: PlatformTheme.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      )),
                ),
                onPressed: transfer == "0"
                    ? null
                    : () async {
                        showCupertinoModalBottomSheet(
                          context: context,
                          builder: (context) => Container(),
                        );
                      },
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 1,
            right: 1,
            child: Container(
              child: KeyPadWidget(
                onDeleteTap: () {
                  transferUsersProvider.removeTransfer();
                },
                onNumberTap: (data) {
                  if (transfer.length < 8)
                    transferUsersProvider.updateTransfer(data);

                  //TODO: setup a notification here
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
