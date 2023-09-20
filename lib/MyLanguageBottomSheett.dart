import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyLanguageBottomSheett extends StatefulWidget {
  @override
  State<MyLanguageBottomSheett> createState() => _MyLanguageBottomSheetState();
}

class _MyLanguageBottomSheetState extends State<MyLanguageBottomSheett> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
            onTap: () {
              provider.changeappLanuage("en");
            },
            child: provider.lan == "ar"
                ? getUnselectedItem(AppLocalizations.of(context)!.english)
                : getSelectedItem(AppLocalizations.of(context)!.english)),
        InkWell(
            onTap: () {
              provider.changeappLanuage("ar");
            },
            child: provider.lan == "ar"
                ? getSelectedItem(AppLocalizations.of(context)!.arabic)
                : getUnselectedItem(AppLocalizations.of(context)!.arabic)),
      ],
    );
  }

  Widget getSelectedItem(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
          size: 30,
        )
      ]),
    );
  }

  Widget getUnselectedItem(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
