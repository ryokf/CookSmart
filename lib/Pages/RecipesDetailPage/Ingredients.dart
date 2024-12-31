// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cook_smart/Themes/themes.dart';
import 'package:cook_smart/helper/DatabaseHelper.dart';
import 'package:cook_smart/helper/removeDecimal.dart';
import 'package:flutter/material.dart';

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
                "Ingredients needed for this recipe",
              style: TextStyle(
                fontSize: fontSizeSmall,
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
            ),
          ),
          SizedBox(
            height: 400,
            child: ListView.builder(
                itemCount: ingredientsData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
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
                            Text(
                              (ingredientsData[index]["nameClean"] ?? ingredientsData[index]["name"]).toString().length > 18 
                              ? (ingredientsData[index]["nameClean"] ?? ingredientsData[index]["name"]).toString().substring(0, 18) + '...' 
                              : (ingredientsData[index]["nameClean"] ?? ingredientsData[index]["name"]),
                              style: TextStyle(
                              fontSize: fontSizeLarge,
                              fontWeight: FontWeight.w500,
                              color: blackColor,                          
                            ))
                          ],
                        ),
                        ElevatedButton(onPressed: () async{
                          await DatabaseHelper.instance.insertShoppingItem({
                            "ingredientId": ingredientsData[index]["id"],
                            "name": ingredientsData[index]["name"],
                            "quantity": removeDecimalZeroFormat(ingredientsData[index]["measures"]["metric"]["amount"]),
                            "unit": ingredientsData[index]["measures"]["metric"]["unitLong"]
                          });
                        }, child: Text("Buy"))
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
