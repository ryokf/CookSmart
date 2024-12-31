// ignore_for_file: use_build_context_synchronously

import 'package:cook_smart/Components/TitleBar.dart';
import 'package:cook_smart/Pages/FavoritePage/DetailRecipe.dart';
import 'package:cook_smart/helper/DatabaseHelper.dart';
import 'package:flutter/material.dart';

class MealPlanPage extends StatefulWidget {
  const MealPlanPage({super.key});

  @override
  State<MealPlanPage> createState() => _MealPlanPageState();
}

class _MealPlanPageState extends State<MealPlanPage> {
  final List<String> _daysOfWeek = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
    "Minggu"
  ];

  final Map<String, List<Map<String, dynamic>>> _mealPlans = {};

  @override
  void initState() {
    super.initState();
    _loadMealPlans();
  }

  Future<void> _loadMealPlans() async {
    for (var day in _daysOfWeek) {
      final plans = await DatabaseHelper.instance.fetchMealPlansByDay(day);
      setState(() {
        _mealPlans[day] = plans;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            TitleBar(
              size: size,
              innerBoxIsScrolled: innerBoxIsScrolled,
                title: "Meal Plan",
            )
          ];
        },
        body: ListView.builder(
          itemCount: _daysOfWeek.length,
          itemBuilder: (context, index) {
            final day = _daysOfWeek[index];
            final totalCalories = _mealPlans[day]?.fold<double>(
                    0,
                    (sum, meal) =>
                        sum + (meal['calories'] as num? ?? 0).toDouble()) ??
                0;
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ExpansionTile(
                title: Text(
                  day,
                  style: const TextStyle(
                      fontSize: 16,),
                ),
                subtitle: Text(
                    "Total Calories: $totalCalories Kcal",
                  style: const TextStyle(
                      fontSize: 12, color: Colors.grey),
                ),
                children: [
                  // Menampilkan rencana makan dengan detail
                  ...?_mealPlans[day]?.map((meal) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailRecipe(
                                id: meal['id'].toString(),
                                title: meal['title'],
                                imageUrl: meal['imageUrl'],
                                ingredients: meal['ingredients'].split(','),
                                steps: meal['steps'].split(','),
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: ClipOval(
                            child: Image.network(
                              meal['imageUrl'] ?? '',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            meal['title'],
                            style: const TextStyle(fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            "${meal['calories']} Kkal",
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          isThreeLine: true,
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              await DatabaseHelper.instance
                                  .deleteMealPlan(meal['id'].toString());
                              _loadMealPlans();
                            },
                          ),
                        ),
                      )),
                  ListTile(
                    leading: const Icon(Icons.add, color: Colors.green),
                    title: const Text("Add Meal Plan"),
                    onTap: () => _showRecipeModalSheet(context, day),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Modal Bottom Sheet untuk memilih resep favorit
  Future<void> _showRecipeModalSheet(BuildContext context, String day) async {
    final favorites = await DatabaseHelper.instance.fetchRecipes();

    if (favorites.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            "Tidak Ada Resep Favorit. Tambahkan Resep Favorit Terlebih Dahulu!"),
        duration: Duration(seconds: 2),
      ));
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16.0),
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          children: [
            const Text(
              "Pilih Resep Favorit",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final recipe = favorites[index];
                  return ListTile(
                    leading: Image.network(
                      recipe['imageUrl'] ?? '',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    title: Text(recipe['title']),
                    isThreeLine: false,
                    onTap: () async {
                      await DatabaseHelper.instance.insertMealPlan(day, recipe);
                      Navigator.pop(context);
                      _loadMealPlans();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
