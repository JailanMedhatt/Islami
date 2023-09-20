import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/MyTheme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int counter = 0;
  int index = 0;

  double turns = 0;

  @override
  Widget build(BuildContext context) {
    List<String> tasabeh = [
      AppLocalizations.of(context)!.subhanallah,
      AppLocalizations.of(context)!.elhamdullah,
      AppLocalizations.of(context)!.allahoakbar,
    ];
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              provider.isDarkMode()
                  ? Image.asset("assets/images/head_sebha_dark.png")
                  : Image.asset("assets/images/head_sebha_logo.png"),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.11,
                child: InkWell(
                    onTap: () {
                      counter++;
                      turns += 1 / 4;
                      setState(() {
                        if (counter % 33 == 0) {
                          if (index < tasabeh.length - 1) {
                            index++;
                          } else {
                            index = 0;
                          }
                        }
                      });
                    },
                    child: AnimatedRotation(
                      turns: turns,
                      duration: Duration(microseconds: 80),
                      child: provider.isDarkMode()
                          ? Image.asset("assets/images/body_sebha_dark.png")
                          : Image.asset("assets/images/body_sebha_logo.png"),
                    )),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width * 0.03),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.4,
              vertical: MediaQuery.of(context).size.width * 0.08),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25)),
          child: Text(
            "$counter",
            style: TextStyle(
                fontSize: 30,
                color:
                    provider.isDarkMode() ? Colors.white : MyTheme.blackColor),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width * 0.03),
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.08,
              right: MediaQuery.of(context).size.width * 0.3,
              left: MediaQuery.of(context).size.width * 0.3),
          decoration: BoxDecoration(
              color: provider.isDarkMode()
                  ? MyTheme.yellowColor
                  : Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25)),
          child: Text(
            tasabeh[index],
            style: TextStyle(
              fontSize: 25,
              color: provider.isDarkMode() ? MyTheme.blackColor : Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
