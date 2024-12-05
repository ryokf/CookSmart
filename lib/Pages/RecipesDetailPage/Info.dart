import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key, required this.additionalInfo});

  final additionalInfo;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: 400,
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 24,
        ),
        child: ListView.builder(
          itemCount: additionalInfo.length,
          itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Text(
                  " ${additionalInfo[index]["name"]} : ",
                  style: TextStyle(
                    fontSize: fontSizeLarge,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${additionalInfo[index]["amount"]} ${additionalInfo[index]["unit"]}",
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "additional information about the recipe",
            style: TextStyle(
                fontSize: fontSizeBase,
                color: greyColor,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 8),
          Text("Glycemic Index : ",
              style: TextStyle(
                  fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
          SizedBox(height: 8),
          Text("Cusine :",
              style: TextStyle(
                  fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
          SizedBox(height: 8),
          Text("Dairy Free : ",
              style: TextStyle(
                  fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
          SizedBox(height: 8),
          Text("Suitable for diets : ",
              style: TextStyle(
                  fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
          SizedBox(height: 8),
          Text("Gluten Free : ",
              style: TextStyle(
                  fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
          SizedBox(height: 8),
          Text("Dish Type : ",
              style: TextStyle(
                  fontSize: fontSizeLarge, fontWeight: FontWeight.w400)),
          SizedBox(height: 16),
          Text("Taste data ",
              style: TextStyle(
                  fontSize: fontSizeLarge, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          Text(
            "Sweetness : ",
            style: TextStyle(
                fontSize: fontSizeLarge, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 8),
          Text(
            "Sourness : ",
            style: TextStyle(
                fontSize: fontSizeLarge, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 8),
          Text(
            "Bitterness : ",
            style: TextStyle(
                fontSize: fontSizeLarge, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 8),
          Text(
            "Spiciness : ",
            style: TextStyle(
                fontSize: fontSizeLarge, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 8),
          Text(
            "Salty : ",
            style: TextStyle(
                fontSize: fontSizeLarge, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 8),
        ],
      );
  }
}
