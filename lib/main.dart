// ignore_for_file: unused_local_variable

import 'package:cook_smart/Pages/IngredientSearchPage/IngredientSearchPage.dart';
import 'package:cook_smart/Pages/MainPage.dart';
import 'package:cook_smart/Pages/RecipesDetailPage/RecipeDetailPage.dart';
import 'package:cook_smart/Pages/SearchResultPage/SearchResultPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MainPage(),
        routes: [
          GoRoute(
            path: '/recipe/:id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return RecipeDetailPage(recipeId: id,);
            },
          ),
          GoRoute(
            path: '/ingredient-search',
            builder: (context, state) => IngredientSearchPage(),
          ),
          GoRoute(
            path: '/search',
            builder: (context, state) => SearchResultPage(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      debugShowCheckedModeBanner: false,
    );
  }
}
