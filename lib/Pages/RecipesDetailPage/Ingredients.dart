import 'package:cook_smart/Themes/themes.dart';
import 'package:cook_smart/helper/removeDecimal.dart';
import 'package:flutter/material.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/widgets.dart';

class Ingridients extends StatelessWidget {
  const Ingridients({super.key, required this.ingredientsData});

  final ingredientsData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12, top: 12),
            child: Text(
              "Bahan yang dibutuhkan untuk membuat resep ini",
              style: TextStyle(
                fontSize: fontSizeSmall,
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
                itemCount: ingredientsData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.black,
                          size: 8,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "${removeDecimalZeroFormat(ingredientsData[index]["measures"]["metric"]["amount"])} ${ingredientsData[index]["measures"]["metric"]["unitLong"] ?? ""} ",
                          style: TextStyle(
                            fontSize: fontSizeLarge,
                            fontWeight: FontWeight.w600,
                            color: blackColor,
                          ),
                        ),
                        Text(ingredientsData[index]["nameClean"], style: TextStyle(
                          fontSize: fontSizeLarge,
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                        ))
                      ],
                    ),
                  );
                }),
          )
          // BulletedList(
          //   style: TextStyle(
          //     fontSize: fontSizeLarge,
          //     fontWeight: FontWeight.w400,
          //     color: blackColor,
          //   ),
          //   bullet: const Icon(
          //     Icons.circle,
          //     color: Colors.black,
          //     size: 8,
          //   ),
          //   listItems: ingredientsData,
          // )
        ],
      ),
    );
  }
}
