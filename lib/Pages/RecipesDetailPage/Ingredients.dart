import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:bulleted_list/bulleted_list.dart';

class Ingridients extends StatelessWidget {
  const Ingridients({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
            BulletedList(
              style: TextStyle(
                fontSize: fontSizeLarge,
                fontWeight: FontWeight.w400,
                color: blackColor,
              ),
              bullet: const Icon(
                Icons.circle,
                color: Colors.black,
                size: 8,
              ),
              listItems: const [
                "250 gram beras",
                "1/2 sdm gula pasir",
                "2 butir telur",
                "1/2 sdt garam",
                "1/2 sdt lada",
                "1/2 sdt vanili", 
                "1/2 sdt bawang putih",
              ],
            )
          ],
        ),
      ),
    );
  }
}
