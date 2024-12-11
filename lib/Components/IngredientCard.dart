import 'package:cook_smart/Themes/themes.dart';
import 'package:cook_smart/helper/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard(
      {super.key,
      required this.id,
      required this.isCheck,
      required this.name,
      required this.quantity,
      required this.unit});

  final int id;
  final String name;
  final String quantity;
  final String unit;
  final bool isCheck;

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
          // Gambar di sebelah kiri
          // ClipOval(
          //   child: Image.network(
          //     'https://images.unsplash.com/photo-1617825013838-0c4109a96aca?q=80&w=2128&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Ganti dengan path gambar Anda
          //     width: 48,
          //     height: 48,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // const SizedBox(width: 12), // Spasi antara gambar dan teks
          // Teks nama bahan dan jumlah
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.name, // Nama bahan
                  style: TextStyle(
                    fontWeight: medium, // FontWeight dari theme.dart
                    fontSize: fontSizeBase + 2, // 12 px
                    color: blackColor, // Warna teks
                  ),
                ),
                const SizedBox(height: 4), // Jarak antara teks
                Text(
                  'quantity : ${this.quantity} ${this.unit}', // Jumlah bahan
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
              await DatabaseHelper.instance.updateIsBought(this.id, !isCheck);
              context.pushReplacement('/');
            },
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: this.isCheck
                    ? Colors.orange.shade100
                    : Colors.green.shade100, // Warna hijau muda
                shape: BoxShape.circle,
              ),
              child: Icon(
                this.isCheck ? Icons.restore : Icons.check,
                color: this.isCheck
                    ? Colors.orange
                    : Colors.green, // Warna ikon centang
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
