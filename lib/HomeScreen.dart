import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/RadioTap.dart';
import 'package:islami/SebhaTap.dart';
import 'package:islami/SettingsTap.dart';
import 'package:islami/hadethSection/HadethTap.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/quraanSection/QuranTap.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home-screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItem = 0;
  List<Widget> taps = [
    RadioTap(),
    SebhaTap(),
    HadethTap(),
    QuranTap(),
    SettingsTap()
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.isDarkMode()
              ? "assets/images/dark_bg.png"
              : "assets/images/default_bg.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.islami,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
                currentIndex: selectedItem,
                onTap: (index) {
                  selectedItem = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                    label: AppLocalizations.of(context)!.radio,
                  ),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                      label: AppLocalizations.of(context)!.sebha),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                          AssetImage("assets/images/icon_hadeth.png")),
                      label: AppLocalizations.of(context)!.hadeth),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage("assets/images/icon_quran.png")),
                      label: AppLocalizations.of(context)!.quran),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: AppLocalizations.of(context)!.settings),
                ]),
          ),
          body: taps[selectedItem],
        )
      ],
    );
  }
}
