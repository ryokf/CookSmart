// ignore_for_file: file_names

import 'package:cook_smart/Themes/themes.dart';

import 'package:flutter/material.dart';


class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(1, 2),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
              'https://images.unsplash.com/photo-1617825013838-0c4109a96aca?q=80&w=2128&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Ganti dengan URL gambar asli
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Farfalle with Peas, Ham and Cream',
              style:  TextStyle(
                fontSize: fontSizeBase,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
