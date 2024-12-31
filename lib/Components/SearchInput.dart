import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  SearchInput({super.key, this.helperText, required this.onSubmitted});
  final String? helperText;
  final void Function(String) onSubmitted;


  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: greyColor,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        helperText: helperText,
        prefixIcon: Icon(
          Icons.search,
          color: greyColor,
        ),
        hintText: 'Search for recipes',
        hintStyle: TextStyle(
          color: greyColor,
          fontSize: fontSizeLarge,
          fontWeight: regular,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(mediumRounded),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
      ),
    );
  }
}
