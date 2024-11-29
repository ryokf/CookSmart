// ignore_for_file: must_be_immutable

import 'package:cook_smart/Components/IngredientCard.dart';
import 'package:cook_smart/Themes/themes.dart';
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
                child: Text(state ? "Bahan yang belum dibeli" : "Bahan yang sudah dibeli",
                    style: TextStyle(
                        fontSize: fontSizeLarge, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  this.state
                  ? "Bahan yang anda simpan untuk catatan anda belanja, bisa diakses secara offline"
                  : "Daftar barang dibawah akan hilang secara otomatis setelah 24 jam, pastikan  anda sudah membeli barang yang dibutuhkan",
                  style: TextStyle(
                    fontSize: fontSizeBase,
                    color: greyColor,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: IngredientCard(isCheck: this.state,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: IngredientCard(isCheck: this.state),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: IngredientCard(isCheck: this.state),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }
}