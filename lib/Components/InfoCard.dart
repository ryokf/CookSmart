import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';// Pastikan file theme.dart sudah dibuat sebelumnya

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;

  const InfoCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    this.backgroundColor = const Color(0xFFF2F2F2), // Warna default
    this.iconColor = const Color(0xFFAAAAAA), // Warna default ikon
    this.textColor = const Color(0xFF333333), // Warna default teks
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(mediumRounded), // Sudut melengkung
      ),
      child: Column(

        children: [
          Icon(
            icon,
            color: iconColor,
            size: 28,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: regular,
              fontSize: fontSizeSmall, // 12px
              color: iconColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontWeight: medium,
              fontSize: fontSizeBase, // 14px
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}