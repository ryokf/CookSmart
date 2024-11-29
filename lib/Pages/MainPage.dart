import 'package:cook_smart/Pages/FavoritePage/FavoritePage.dart';
import 'package:cook_smart/Pages/HomePage/HomePage.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const FavoritePage(),
    const Text("daftar belanja"),
    const Text("rencana makan"),
  ];

  final List<String> appBarTitles = [
    "",
    "Resep disimpan",
    "Daftar belanja",
    "Rencana makan",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex != 0
          ? AppBar(
              backgroundColor: Colors.white10,
              title: Text(appBarTitles[_currentIndex],
                  style: TextStyle(
                      fontSize: fontSizeBase, fontWeight: FontWeight.w600)),
              elevation: 1,
            )
          : null,
      backgroundColor: Colors.white,
      body: SafeArea(child: _screens[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 50,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Resep disimpan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Daftar belanja',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Rencana makan',
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
