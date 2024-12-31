// ignore_for_file: must_be_immutable, prefer_const_constructors, use_build_context_synchronously, library_private_types_in_public_api

import 'package:cook_smart/Themes/themes.dart';
import 'package:cook_smart/helper/DatabaseHelper.dart';
import 'package:flutter/material.dart';

class Section extends StatefulWidget {
  const Section({super.key});

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
    shoppingList = await DatabaseHelper.instance.fetchShoppingList();
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
            child: Text("Items not yet purchased",
              style: TextStyle(
                fontSize: fontSizeLarge, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
                "Ingredients you saved for your shopping list, accessible offline",
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
                        child: Container(
                          height: 80,
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100, // Warna latar belakang
                            borderRadius: BorderRadius.circular(
                                largeRounded), // Sudut melengkung
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
                                      shoppingList[index]['name'], // Nama bahan
                                      style: TextStyle(
                                        fontWeight:
                                            medium, // FontWeight dari theme.dart
                                        fontSize: fontSizeBase + 2, // 12 px
                                        color: blackColor, // Warna teks
                                      ),
                                    ),
                                    const SizedBox(
                                        height: 4), // Jarak antara teks
                                    Text(
                                      'quantity : ${shoppingList[index]['quantity']} ${shoppingList[index]['unit']}', // Jumlah bahan
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
                                  // await DatabaseHelper.instance
                                  //     .deleteShoppingItem(
                                  //         shoppingList[index]['id']);
                                  // fetchShoppingList();
                                  _showDeleteConfirmationDialog(
                                      shoppingList[index]['id']);
                                },
                                child: Container(
                                  width: 52,
                                  height: 52,
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .green.shade100, // Warna hijau muda
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.green, // Warna ikon centang
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                ),
        ],
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(int itemId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'Apakah Anda yakin ingin menghapus item ini dari daftar belanja?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal', style: TextStyle(color: Colors.grey)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Hapus', style: TextStyle(color: Colors.red)),
              onPressed: () async {
                await DatabaseHelper.instance.deleteShoppingItem(itemId);
                fetchShoppingList();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
