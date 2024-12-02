import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Image.network(
          "https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Corndogs-7832ef6.jpg?quality=90&resize=556,505",
          width: double.infinity,
          height: size * 0.4,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 20,
          left: 20,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 32,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: IconButton(
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.red,
              size: 32,
            ),
            onPressed: () {
              // Tambahkan logika untuk memeriksa kefavoritan
            },
          ),
        ),
        Container(
          width: double.infinity,
          height: size * 0.4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.0),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs",
                  style: TextStyle(
                    fontSize: fontSizeLarge + 2,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "You can never have too many main course recipes, so give Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs a try.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeSmall,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
