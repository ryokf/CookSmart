import 'package:cook_smart/Pages/ShopingListPage/Sections.dart';
import 'package:flutter/material.dart';

class ShopingListPage extends StatelessWidget {
  const ShopingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Section(state: true,),
            const Divider(),
            Section(state: false,),
          ],
        ),
      ),
    );
  }
}
