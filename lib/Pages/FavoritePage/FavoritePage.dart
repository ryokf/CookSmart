import 'package:cook_smart/Pages/FavoritePage/FavoriteList.dart';
import 'package:cook_smart/Pages/FavoritePage/Header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(),
            FavoriteList()
          ],
        ),
      ),
    );
  }
}
