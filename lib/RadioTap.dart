import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/MyTheme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class RadioTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.04,
          right: MediaQuery.of(context).size.width * 0.02,
          bottom: MediaQuery.of(context).size.height * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Image.asset("assets/images/radio_image.png"),
          ),
          Text(
            AppLocalizations.of(context)!.eza3etElquran,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.skip_previous, size: 50),
                color: provider.isDarkMode()
                    ? MyTheme.yellowColor
                    : Theme.of(context).primaryColor,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow,
                  size: 50,
                  color: provider.isDarkMode()
                      ? MyTheme.yellowColor
                      : Theme.of(context).primaryColor,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next,
                    size: 50,
                    color: provider.isDarkMode()
                        ? MyTheme.yellowColor
                        : Theme.of(context).primaryColor,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
