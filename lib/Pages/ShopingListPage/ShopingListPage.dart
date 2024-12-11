import 'package:cook_smart/Components/TitleBar.dart';
import 'package:cook_smart/Pages/ShopingListPage/Sections.dart';
import 'package:flutter/material.dart';

class ShopingListPage extends StatelessWidget {
  const ShopingListPage({super.key});

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
                title: "Daftar Belanja",
              )
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Section(
                  state: false,
                ),
                const Divider(),
                Section(
                  state: true,
                ),
              ],
            ),
          )),
    );
  }
}
