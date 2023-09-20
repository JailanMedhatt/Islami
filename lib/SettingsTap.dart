import 'package:flutter/material.dart';
import 'package:islami/MyBottomSheet.dart';
import 'package:islami/MyLanguageBottomSheett.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTap extends StatefulWidget {
  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppLocalizations.of(context)!.theme,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        InkWell(
          onTap: () {
            ShowThemeBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            padding: EdgeInsets.all(10),
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  provider.isDarkMode()
                      ? AppLocalizations.of(context)!.dark
                      : AppLocalizations.of(context)!.light,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 25,
                )
              ],
            ),
          ),
        ),
        Text(
          AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        InkWell(
          onTap: () {
            ShowLanguageBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            padding: EdgeInsets.all(10),
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  provider.lan == "ar"
                      ? AppLocalizations.of(context)!.arabic
                      : AppLocalizations.of(context)!.english,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 25,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void ShowThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: ((context) => MyBottomSheet()));
  }

  void ShowLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => MyLanguageBottomSheett());
  }
}
