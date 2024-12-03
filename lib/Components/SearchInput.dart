import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key, this.helperText});
  final String ? helperText;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      cursorColor: greyColor,
      onSubmitted: (value) {
        context.push('/search');
      },
      decoration: InputDecoration(
        helperText: helperText,
        prefixIcon: Icon(
          Icons.search,
          color: greyColor, // Menggunakan warna dari theme
        ),
        hintText: 'Cari resep',
        hintStyle: TextStyle(
          color: greyColor, // Warna placeholder
          fontSize: fontSizeLarge, // Ukuran font (dari theme)
          fontWeight: regular,
        ),
        filled: true,
        fillColor: Colors.grey[100], // Warna background input
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(mediumRounded), // Radius sudut
          borderSide: BorderSide.none,
           // Tanpa border
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
      ),
    );
  }
}