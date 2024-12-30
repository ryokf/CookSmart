// ignore_for_file: must_be_immutable

import 'package:cook_smart/Components/IngredientCard.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:cook_smart/helper/DatabaseHelper.dart';
import 'package:flutter/material.dart';

class Section extends StatefulWidget {
  Section({super.key, required this.state});

  bool state;

  @override
  _SectionState createState() => _SectionState();
}

class _SectionState extends State<Section> {
  List<Map<String, dynamic>> shoppingList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchShoppingList();
  }

  Future<void> fetchShoppingList() async {
    shoppingList = await DatabaseHelper.instance.fetchShoppingList(widget.state);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
                widget.state ? "Bahan yang sudah dibeli" : "Bahan yang belum dibeli",
                style: TextStyle(
                    fontSize: fontSizeLarge, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              widget.state
                  ? "Daftar barang dibawah akan hilang secara otomatis setelah 24 jam, pastikan  anda sudah membeli barang yang dibutuhkan"
                  : "Bahan yang anda simpan untuk catatan anda belanja, bisa diakses secara offline",
              style: TextStyle(
                fontSize: fontSizeBase,
                color: greyColor,
              ),
            ),
          ),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: shoppingList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: IngredientCard(
                        isCheck: widget.state,
                        id: shoppingList[index]["id"],
                        name: shoppingList[index]["name"],
                        quantity: shoppingList[index]["quantity"],
                        unit: shoppingList[index]["unit"],
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
