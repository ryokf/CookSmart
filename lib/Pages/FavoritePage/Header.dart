import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/cupertino.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Text(
        "Resep yang disimpan bisa anda akses secara oflline",
        style: TextStyle(
            fontSize: fontSizeBase,
            fontWeight: FontWeight.w500,
            color: greyColor),
      ),
    );
  }
}
