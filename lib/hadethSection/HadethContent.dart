import 'package:flutter/material.dart';
import 'package:islami/hadethSection/HadethTap.dart';
import 'package:islami/hadethSection/HadethText.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethContent extends StatelessWidget {
  static const routeName = 'hadeth-content';

  @override
  Widget build(BuildContext context) {
    var hadeth = ModalRoute.of(context)?.settings.arguments as Hadeth;
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(children: [
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
            hadeth.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06,
              vertical: MediaQuery.of(context).size.height * 0.07),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return HadethText(line: hadeth.hadethContent[index]);
            },
            itemCount: hadeth.hadethContent.length,
          ),
        ),
      )
    ]);
  }
}
