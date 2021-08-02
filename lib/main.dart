import 'package:azmas/Model/Event/index.dart';
import 'package:azmas/Model/Community/index.dart';
import 'package:azmas/Model/CommunityMember/index.dart';
import 'package:azmas/Model/Settings/index.dart';
import 'package:azmas/Model/Ticket/index.dart';
import 'package:azmas/Model/User/index.dart';
import 'package:azmas/Providers/calender/getEvent.dart';
import 'package:azmas/Providers/calender/index.dart';
import 'package:azmas/Providers/community/index.dart';
import 'package:azmas/Providers/countDown/index.dart';
import 'package:azmas/Providers/event/index.dart';
import 'package:azmas/Providers/event/selected.dart';
import 'package:azmas/Providers/images/index.dart';
import 'package:azmas/Providers/interaction/communityScreen.dart';
import 'package:azmas/Providers/interaction/eventScreen.dart';
import 'package:azmas/Providers/interaction/index.dart';
import 'package:azmas/Providers/navbar/index.dart';
import 'package:azmas/Providers/navbar/navbar.dart';
import 'package:azmas/Providers/interaction/qrScan.dart';
import 'package:azmas/Providers/interaction/setting.dart';
import 'package:azmas/Providers/lang/index.dart';
import 'package:azmas/Providers/upload/index.dart';
import 'package:azmas/Providers/user/index.dart';
import 'package:azmas/Providers/user/profile.dart';
import 'package:azmas/Screens/Customer/Account/EditProfile/index.dart';
import 'package:azmas/Screens/Customer/Account/Ticket/index.dart';
import 'package:azmas/Screens/Customer/Community/index.dart';
import 'Screens/Customer/Account/Auth/Login/index.dart';
import 'Screens/Customer/Account/Auth/Signup/index.dart';
import 'package:azmas/Screens/Customer/Event/EventDetail.dart';
import 'package:azmas/Screens/Error/index.dart';
import 'package:azmas/Screens/Loading/index.dart';
import 'package:azmas/Screens/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(SettingModelAdapter());
  Hive.registerAdapter(CommunityModelAdapter());
  Hive.registerAdapter(CommunityMemberModelAdapter());
  Hive.registerAdapter(EventModelAdapter());
  Hive.registerAdapter(TicketModelAdapter());
  await Hive.openBox<UserModel>('users');
  await Hive.openBox<SettingModel>('settings');
  await Hive.openBox<List<EventModel>>('events');
  await Hive.openBox<List<TicketModel>>('tickets');
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
      LoginScreen.routeName: (ctx) => LoginScreen(),
      SignUpScreen.routeName: (ctx) => SignUpScreen(),
      SettingScreen.routeName: (ctx) => SettingScreen(),
      CommunityScreen.routeName: (ctx) => CommunityScreen(),
      TicketScreen.routeName: (ctx) => TicketScreen(),
    };
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: NavBarProvider(),
        ),
        ChangeNotifierProvider.value(
          value: NavBarDataProvider(),
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
          value: CommunityProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CalenderEventProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SettingInteractionProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CountDownProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UploadProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UserProfileProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CommunityInteractionProvider(),
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
