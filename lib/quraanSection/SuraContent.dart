import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/quraanSection/Aya.dart';
import 'package:islami/quraanSection/SuraName.dart';
import 'package:provider/provider.dart';

class SuraContent extends StatefulWidget {
  static const routeName = 'sura-content';

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  List<String> ayatList = [];

  void readFile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/suwar/${index + 1}.txt");
    List<String> lines = content.split('\n');
    ayatList = lines;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var arg = ModalRoute.of(context)?.settings.arguments as args;
    if (ayatList.isEmpty) {
      readFile(arg.index);
    }
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
            arg.suraName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: ayatList.length == 0
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06,
                    vertical: MediaQuery.of(context).size.height * 0.07),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Aya(text: ayatList[index], indexx: index);
                  },
                  itemCount: ayatList.length,
                ),
              ),
      )
    ]);
  }
}
