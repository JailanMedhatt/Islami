import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/HomeScreen.dart';
import 'package:islami/MyTheme.dart';
import 'package:islami/hadethSection/HadethContent.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/quraanSection/SuraContent.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: ((context) => AppConfigProvider()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraContent.routeName: (context) => SuraContent(),
        HadethContent.routeName: (context) => HadethContent()
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.myTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: provider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.lan),
    );
  }
}
