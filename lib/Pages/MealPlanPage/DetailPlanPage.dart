import 'package:flutter/material.dart';

class DetailPlanPage extends StatelessWidget {
  const DetailPlanPage({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(day),
      ),
    );
  }
}