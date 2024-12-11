// ignore_for_file: must_be_immutable

import 'package:cook_smart/Components/IngredientCard.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:cook_smart/helper/DatabaseHelper.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  Section({super.key, required this.state});

  bool state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
                state ? "Bahan yang sudah dibeli" : "Bahan yang belum dibeli",
                style: TextStyle(
                    fontSize: fontSizeLarge, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              this.state
                  ? "Daftar barang dibawah akan hilang secara otomatis setelah 24 jam, pastikan  anda sudah membeli barang yang dibutuhkan"
                  : "Bahan yang anda simpan untuk catatan anda belanja, bisa diakses secara offline",
              style: TextStyle(
                fontSize: fontSizeBase,
                color: greyColor,
              ),
            ),
          ),
          FutureBuilder(
              future: DatabaseHelper.instance.fetchShoppingList(this.state),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: IngredientCard(
                          isCheck: this.state,
                          id: snapshot.data![index]["id"],
                          name: snapshot.data![index]["name"],
                          quantity: snapshot.data![index]["quantity"],
                          unit: snapshot.data![index]["unit"],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })
        ],
      ),
    );
  }
}
