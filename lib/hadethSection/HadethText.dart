import 'package:flutter/material.dart';
import 'package:islami/MyTheme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethText extends StatelessWidget {
  String line;

  HadethText({required this.line});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Text(
      line,
      style: provider.isDarkMode()
          ? MyTheme.myTheme.textTheme.titleSmall
              ?.copyWith(color: MyTheme.yellowColor)
          : MyTheme.myTheme.textTheme.titleSmall,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
