import 'package:flutter/material.dart';
import 'package:islami/quraanSection/SuraContent.dart';

class SuraName extends StatelessWidget {
  String text;
  int indexx;

  SuraName({required this.text, required this.indexx});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(SuraContent.routeName,
              arguments: args(suraName: text, index: indexx));
        },
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ));
  }
}

class args {
  String suraName;
  int index;

  args({required this.suraName, required this.index});
}
