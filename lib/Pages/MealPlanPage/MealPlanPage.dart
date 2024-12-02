import 'package:cook_smart/Components/TitleBar.dart';
import 'package:flutter/material.dart';

class MealPlanPage extends StatelessWidget {
  const MealPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              TitleBar(
                size: size,
                innerBoxIsScrolled: innerBoxIsScrolled,
                title: "Rencana Makan",
              )
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            ),
          )),
    );
  }
}
