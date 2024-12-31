import 'package:cook_smart/Pages/FavoritePage/FavoritePage.dart';
import 'package:cook_smart/Pages/HomePage/HomePage.dart';
import 'package:cook_smart/Pages/MealPlanPage/MealPlanPage.dart';
import 'package:cook_smart/Pages/ShopingListPage/ShopingListPage.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, this.indexPage = 0});
  final int indexPage;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const FavoritePage(),
    const ShopingListPage(),
    const MealPlanPage(),
  ];

  final List<String> appBarTitles = [
    "",
    "Saved Recipes",
    "Shopping List",
    "Meal Plan",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screens[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[100],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            if (widget.indexPage != 0) {
              _currentIndex = widget.indexPage;
            } else {
              _currentIndex = index;
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shopping List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_rounded),
            label: 'Meal Plan',
          ),
        ],
        selectedItemColor: primaryColor,
        unselectedItemColor: greyColor,
        selectedFontSize: fontSizeBase,
        unselectedFontSize: fontSizeBase,
      ),
    );
  }
}
