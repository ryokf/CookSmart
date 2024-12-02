import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class Nutrition extends StatelessWidget {
  const Nutrition({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        child: Column(
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
              Text("Carbs : 100g",
                  style: TextStyle(
                      fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
              SizedBox(height: 8),
              Text("Fat : 10g",
                  style: TextStyle(
                      fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
              SizedBox(height: 8),
              Text("Protein : 20g",
                  style: TextStyle(
                      fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
              SizedBox(height: 8),
              Text("kcal : 570 kcal",
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
              Text("Vitamin A",
                  style: TextStyle(
                      fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
              SizedBox(height: 8),
              Text("Vitamin C",
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
            ]),
      ),
    );
  }
}
