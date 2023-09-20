import 'package:flutter/material.dart';
import 'package:islami/hadethSection/HadethContent.dart';
import 'package:islami/hadethSection/HadethTap.dart';

class HadethName extends StatelessWidget {
  Hadeth hadeth;

  HadethName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(HadethContent.routeName, arguments: hadeth);
        },
        child: Text(
          hadeth.title,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ));
  }
}
