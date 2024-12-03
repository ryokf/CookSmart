import 'package:cook_smart/Components/RecipeCard.dart';
import 'package:cook_smart/Components/SearchInput.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> ingredients = [
      'Pasta',
      'Tomato',
      'Onion',
      'Garlic',
      'Spices',
      'Cheese',
      'Meat',
      'Pasta',
      'Tomato',
      'Onion',
      'Garlic',
      'Spices',
      'Cheese',
      'Meat',
    ];

    var ingredient = 'Pasta';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Hasil Pencarian',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchInput(),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 35,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton(
                  underline: Container(),
                  hint: Text(
                    'Pilih Bahan',
                    style: TextStyle(fontSize: fontSizeBase),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'Pasta',
                      child: Text(
                        'Pasta',
                        style: TextStyle(fontSize: fontSizeBase),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Tomato',
                      child: Text(
                        'Tomato',
                        style: TextStyle(fontSize: fontSizeBase),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Onion',
                      child: Text(
                        'Onion',
                        style: TextStyle(fontSize: fontSizeBase),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Garlic',
                      child: Text(
                        'Garlic',
                        style: TextStyle(fontSize: fontSizeBase),
                      ),
                    ),
                  ],
                  onChanged: (value) {},
                )),
            SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: 800,
              child: GridView.builder(
                  controller: ScrollController(
                    keepScrollOffset: true,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) {
                    return const RecipeCard();
                  }),
            )
          ],
        )),
      ),
    );
  }
}
