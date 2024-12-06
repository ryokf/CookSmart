import 'dart:convert';

import 'package:cook_smart/Components/RecipeCard.dart';
import 'package:cook_smart/Components/SearchInput.dart';
import 'package:cook_smart/Config/api.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key, required this.query});
  final String query;

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  Widget build(BuildContext context) {

    Future recipeData() async {
      var getData = Uri.https(api_url, "/recipes/complexSearch",
          {"query": widget.query});
      var response = await http.get(getData, headers: {"x-api-key": api_key});
      var data = jsonDecode(response.body);
      return data["results"];
    }

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
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 12),
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
            const SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: 700,
              child: FutureBuilder(
                future: recipeData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        controller: ScrollController(
                          keepScrollOffset: true,
                        ),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return RecipeCard(id: snapshot.data![index]["id"], imageUrl: snapshot.data![index]["image"], title: snapshot.data![index]["title"],);
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
