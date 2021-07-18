import 'package:azmas/Db/moorDatabase.dart';
import 'package:azmas/Model/Settings/index.dart';
import 'package:azmas/Model/User/index.dart';
import 'package:azmas/Providers/calender/getEvent.dart';
import 'package:azmas/Providers/calender/index.dart';
import 'package:azmas/Providers/event/index.dart';
import 'package:azmas/Providers/event/selected.dart';
import 'package:azmas/Providers/group/index.dart';
import 'package:azmas/Providers/images/index.dart';
import 'package:azmas/Providers/interaction/eventScreen.dart';
import 'package:azmas/Providers/interaction/index.dart';
import 'package:azmas/Providers/interaction/navbar.dart';
import 'package:azmas/Providers/interaction/qrScan.dart';
import 'package:azmas/Providers/lang/index.dart';
import 'package:azmas/Providers/user/index.dart';
import 'package:azmas/Screens/Customer/Event/EventDetail.dart';
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
import 'package:hive_flutter/hive_flutter.dart';

late AppDatabase database;

void main() async {
  database = AppDatabase();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(SettingModelAdapter());
  await Hive.openBox<UserModel>('users');
  await Hive.openBox<SettingModel>('settings');
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
      EventDetailScreen.routeName: (ctx) => EventDetailScreen(),
    };
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: NavBarProvider(),
        ),
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
          value: QRScanPropsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: EventInteractionProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CalenderProvider(),
        ),
        ChangeNotifierProvider.value(
          value: GetImageProvider(),
        ),
        ChangeNotifierProvider.value(
          value: EventSelectedProvider(),
        ),
        ChangeNotifierProvider.value(
          value: EventProvider(),
        ),
        ChangeNotifierProvider.value(
          value: GroupProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CalenderEventProvider(),
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
            debugShowCheckedModeBanner: false,
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
