import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class Nutrition extends StatelessWidget {
  const Nutrition({super.key, required this.nutritionData});

  final nutritionData;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: 800,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        child: ListView.builder(
            itemCount: nutritionData.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Text(
                      " ${nutritionData[index]["name"]} : ",
                      style: TextStyle(
                        fontSize: fontSizeLarge,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${nutritionData[index]["amount"]} ${nutritionData[index]["unit"]}",
                      style: TextStyle(
                        fontSize: fontSizeLarge,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
