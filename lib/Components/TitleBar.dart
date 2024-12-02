import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar(
      {super.key, required this.size, required this.innerBoxIsScrolled, required this.title});
  final Size size;
  final bool innerBoxIsScrolled;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.grey.shade50,
      flexibleSpace: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: innerBoxIsScrolled ? fontSizeBase : fontSizeLarge + 10,
            fontWeight: FontWeight.w600,
          ),
          textAlign:  TextAlign.center,
        ),
      ),
      floating: true,
      pinned: true,
      expandedHeight: size.height * 0.3,
      collapsedHeight: size.height * 0.1,
    );
  }
}
