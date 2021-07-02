import 'package:azmas/Providers/interaction/Transctions.dart';
import 'package:azmas/Providers/interaction/index.dart';
import 'package:azmas/Providers/interaction/qrScan.dart';
import 'package:azmas/Providers/lang/index.dart';
import 'package:azmas/Providers/transfer/index.dart';
import 'package:azmas/Providers/transfer/transferUsers.dart';
import 'package:azmas/Providers/transfer/transferuser.dart';
import 'package:azmas/Providers/user/inAppAuth.dart';
import 'package:azmas/Providers/user/index.dart';
import 'package:azmas/Screens/Custmer/QR/index.dart';
import 'package:azmas/Screens/Custmer/Transfer/index.dart';
import 'package:azmas/Screens/Custmer/transacrions/index.dart';
import 'package:azmas/Screens/Shared/Error/index.dart';
import 'package:azmas/Screens/Shared/Loading/index.dart';
import 'package:azmas/Screens/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String initialRoute = "/";
    final Map<String, Widget Function(BuildContext)> routes = {
      '/': (ctx) => IndexScreen(),
      LoadingScreen.routeName: (ctx) => LoadingScreen(),
      ErrorScreen.routeName: (ctx) => ErrorScreen(),
      TransferScreen.routeName: (ctx) => TransferScreen(),
      TransactionScreens.routeName: (ctx) => TransactionScreens(),
      QRScanScreen.routeName: (ctx) => QRScanScreen(),
    };
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: InteractionProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
        ChangeNotifierProvider.value(
          value: LanguageProvider(),
        ),
        ChangeNotifierProvider.value(
          value: TransferProvider(),
        ),
        ChangeNotifierProvider.value(
          value: TransferUsersProvider(),
        ),
        ChangeNotifierProvider.value(
          value: TransactionPropsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: QRScanPropsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: InAppAuthProvider(),
        ),
        ChangeNotifierProvider.value(
          value: TransferUserProvider(),
        ),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, _) {
          languageProvider.fetchLocale();
          return MaterialApp(
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: languageProvider.appLocal,
            supportedLocales: L10n.all,
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: PlatformTheme.primaryColor,
              primaryColorLight: PlatformTheme.primaryColorLight,
              primaryColorDark: PlatformTheme.primaryColorDark,
              accentColor: PlatformTheme.accentColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: initialRoute,
            routes: routes,
            onUnknownRoute: (settings) {
              return MaterialPageRoute(builder: (context) => ErrorScreen());
            },
          );
        },
      ),
    );
  }
}
