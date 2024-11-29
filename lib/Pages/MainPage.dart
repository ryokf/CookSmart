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
    HomePage(),
    Text("resep disimpan"),
    Text("daftar belanja"),
    Text("rencana makan"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: Icon(Icons.menu),
            label: 'Rencana makan',
          ),
        ],
        selectedItemColor: primaryColor,
        unselectedItemColor: greyColor,
        showUnselectedLabels: true,
        selectedFontSize: fontSizeBase,
        unselectedFontSize: fontSizeBase,
      ),
    );
  }
}
