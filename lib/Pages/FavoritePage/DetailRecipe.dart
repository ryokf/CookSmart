import 'package:cook_smart/Themes/themes.dart';
import 'package:cook_smart/helper/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailRecipe extends StatelessWidget {
  final String id;
  final String title;
  final String? imageUrl;
  final List<dynamic> ingredients;
  final List<dynamic> steps;

  const DetailRecipe({
    Key? key,
    required this.id,
    required this.title,
    this.imageUrl,
    required this.ingredients,
    required this.steps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2, // Jumlah tab
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            if (imageUrl != null)
              Stack(
                children: [
                  Image.network(
                    imageUrl!,
                    width: double.infinity,
                    height: size.height * 0.4,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.0),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: fontSizeLarge + 2,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Text(
                          //   widget.description,
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: fontSizeSmall,
                          //   ),
                          //   maxLines: 2,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                      ),
                      // icon: Icon(
                      //   isFavorite ? Icons.favorite : Icons.favorite_border,
                      //   color: Colors.red,
                      //   size: 32,
                      // ),
                      child: Text(
                        "Hapus",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSizeBase,
                        ),
                      ),
                      onPressed: () {
                        () async {
                          await DatabaseHelper.instance.deleteRecipe(id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Resep dihapus!')),
                          );
                        }();
                        context.push('/');
                      },
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 32,
                        ),
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 8),
            const TabBar(
              tabs: [
                Tab(text: "Bahan"),
                Tab(text: "Langkah"),
              ],
            ),
            // TabBarView untuk isi tab
            Expanded(
              child: TabBarView(
                children: [
                  // Tab Bahan
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: ingredients
                          .map((ingredient) => Text("• $ingredient",
                              style: const TextStyle(fontSize: 16)))
                          .toList(),
                    ),
                  ),
                  // Tab Langkah
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: steps.asMap().entries.map((entry) {
                        final index = entry.key + 1;
                        final step = entry.value;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            "$index. $step",
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
