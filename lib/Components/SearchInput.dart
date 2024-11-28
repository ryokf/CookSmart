import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0), // Margin sekeliling
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: greyColor, // Menggunakan warna dari theme
          ),
          hintText: 'Cari resep',
          hintStyle: TextStyle(
            color: greyColor, // Warna placeholder
            fontSize: fontSizeBase + 2, // Ukuran font (dari theme)
            fontWeight: regular,
          ),
          filled: true,
          fillColor: backgroundColor, // Warna background input
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(smallRounded), // Radius sudut
            borderSide: BorderSide.none, // Tanpa border
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
        ),
      ),
    );
  }
}