import 'package:cook_smart/Components/TitleBar.dart';
import 'package:cook_smart/Pages/FavoritePage/FavoriteList.dart';
import 'package:cook_smart/Pages/FavoritePage/Header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              TitleBar(size: size, innerBoxIsScrolled: innerBoxIsScrolled, title: 'Resep Favorit',)
            ];
          },
          body: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Header(), FavoriteList()],
            ),
          )),
    );
  }
}