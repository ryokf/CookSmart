// ignore_for_file: file_names

import 'package:cook_smart/Themes/themes.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.id, required this.imageUrl, required this.title});

  final int id;
  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/recipe/$id');
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4,
              offset: const Offset(1, 2),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(mediumRounded),
        ),
        // margin: const EdgeInsets.only(right: 12),
        width: 180,
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style:  TextStyle(
                  fontSize: fontSizeSmall,
                  color: Colors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
