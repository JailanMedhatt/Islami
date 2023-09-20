import 'package:flutter/material.dart';
import 'package:islami/MyTheme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class Aya extends StatelessWidget {
  String text;
  int indexx;

  Aya({required this.text, required this.indexx});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Text(
      "$text {${indexx + 1}}",
      style: provider.isDarkMode()
          ? MyTheme.myTheme.textTheme.titleSmall
              ?.copyWith(color: MyTheme.yellowColor)
          : MyTheme.myTheme.textTheme.titleSmall,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
