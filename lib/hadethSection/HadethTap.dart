import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/MyTheme.dart';
import 'package:islami/hadethSection/HadethName.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (ahadeth.isEmpty) {
      readHadeth();
    }
    return Column(
      children: [
        Center(child: Image.asset("assets/images/hadeth_logo.png")),
        Divider(
          thickness: 3,
          color: provider.isDarkMode()
              ? MyTheme.yellowColor
              : Theme.of(context).primaryColor,
        ),
        Text(
          AppLocalizations.of(context)!.hadethName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          thickness: 3,
          color: provider.isDarkMode()
              ? MyTheme.yellowColor
              : Theme.of(context).primaryColor,
        ),
        ahadeth.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return HadethName(hadeth: ahadeth[index]);
                  },
                  itemCount: ahadeth.length,
                  separatorBuilder: (context, index) => Divider(
                    thickness: 1,
                    color: provider.isDarkMode()
                        ? MyTheme.yellowColor
                        : Theme.of(context).primaryColor,
                  ),
                ),
              )
      ],
    );
  }

  void readHadeth() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> all = content.split("#\r\n");
    String hadethWithTitle;
    for (int i = 0; i < all.length; i++) {
      hadethWithTitle = all[i];
      List<String> hadethLines = hadethWithTitle.split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      ahadeth.add(Hadeth(title: title, hadethContent: hadethLines));
    }
    setState(() {});
  }
}

class Hadeth {
  String title;
  List<String> hadethContent;

  Hadeth({required this.title, required this.hadethContent});
}
