// ignore_for_file: prefer_const_constructors
import 'package:cook_smart/Themes/themes.dart';
import 'package:cook_smart/helper/DatabaseHelper.dart';
import 'package:flutter/material.dart';

class IngredientCard extends StatefulWidget {
  const IngredientCard(
      {super.key,
      required this.id,
      required this.name,
      required this.quantity,
      required this.unit});

  final int id;
  final String name;
  final String quantity;
  final String unit;

  @override
  State<IngredientCard> createState() => _IngredientCardState();
}

class _IngredientCardState extends State<IngredientCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100, // Warna latar belakang
        borderRadius: BorderRadius.circular(largeRounded), // Sudut melengkung
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name, // Nama bahan
                  style: TextStyle(
                    fontWeight: medium, // FontWeight dari theme.dart
                    fontSize: fontSizeBase + 2, // 12 px
                    color: blackColor, // Warna teks
                  ),
                ),
                const SizedBox(height: 4), // Jarak antara teks
                Text(
                  'quantity : ${widget.quantity} ${widget.unit}', // Jumlah bahan
                  style: TextStyle(
                    fontWeight: regular,
                    fontSize: fontSizeBase, // 10 px
                    color: greyColor,
                  ),
                ),
              ],
            ),
          ),
          // Ikon centang di sebelah kanan
          GestureDetector(
            onTap: () async {
              await DatabaseHelper.instance.deleteShoppingItem(widget.id);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage()));
            },
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.green.shade100, // Warna hijau muda
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                color:  Colors.green, // Warna ikon centang
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
