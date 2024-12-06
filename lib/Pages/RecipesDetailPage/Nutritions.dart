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

  Column newMethod() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Macro Nutrients",
              style: TextStyle(
                  fontSize: fontSizeLarge + 2, fontWeight: FontWeight.w600),
            ),
            Text(
              "Makronutrien adalah nutrisi yang dibutuhkan oleh tubuh dalam jumlah besar untuk menghasilkan energi (kalori)",
              style: TextStyle(
                fontSize: fontSizeSmall,
                color: greyColor,
              ),
            ),
            SizedBox(height: 12),
            Text("Carbs : ${nutritionData[3]["amount"]} ${nutritionData[3]["unit"]}",
                style: TextStyle(
                    fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
            SizedBox(height: 8),
            Text("Fat : ${nutritionData[1]["amount"]} ${nutritionData[1]["unit"]}",
                style: TextStyle(
                    fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
            SizedBox(height: 8),
            Text("Protein : 2${nutritionData[10]["amount"]} ${nutritionData[10]["unit"]}",
                style: TextStyle(
                    fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
            SizedBox(height: 8),
            Text("kcal : ${nutritionData[0]["amount"]} ${nutritionData[0]["unit"]}",
                style: TextStyle(
                    fontSize: fontSizeLarge, fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            const Divider(
              height: 24,
            ),
            SizedBox(height: 12),
            Text(
              "Micro Nutrients",
              style: TextStyle(
                  fontSize: fontSizeLarge + 2, fontWeight: FontWeight.w600),
            ),
            Text(
              "Mikronutrien adalah nutrisi yang dibutuhkan oleh tubuh dalam jumlah kecil dan tidak menghasilkan energi (kalori)",
              style: TextStyle(
                fontSize: fontSizeSmall,
                color: greyColor,
              ),
            ),
            SizedBox(height: 12),
            Text("Vitamin A : ${nutritionData[27]["name"]} ${nutritionData[28]["unit"]}",
                style: TextStyle(
                    fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
            SizedBox(height: 8),
            Text("Vitamin C : ${nutritionData[12]["amount"]} ${nutritionData[12]["unit"]}",
                style: TextStyle(
                    fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
            SizedBox(height: 8),
            Text("Calcium : ${nutritionData[26]["amount"]} ${nutritionData[26]["unit"]}",
                style: TextStyle(
                    fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
            SizedBox(height: 8),
            Text("Iron",
                style: TextStyle(
                    fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
            SizedBox(height: 8),
            Text("Calcium",
                style: TextStyle(
                    fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
            SizedBox(height: 8),
            Text("Iron",
                style: TextStyle(
                    fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
            SizedBox(height: 8),
            Text("Magnesium",
                style: TextStyle(
                    fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
            SizedBox(height: 8),
            Text("Phosphorus",
                style: TextStyle(
                    fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
            SizedBox(height: 8),
            Text("Potassium",
                style: TextStyle(
                    fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
            SizedBox(height: 16),
          ]);
  }
}
