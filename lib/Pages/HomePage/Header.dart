// ignore_for_file: file_names

import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(fullRounded),
              child: Image.network(
                  'https://images.unsplash.com/photo-1617825013838-0c4109a96aca?q=80&w=2128&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Hello Ryo',
              style: TextStyle(
                fontSize: fontSizeBase,
                color: greyColor,
              ),
            ),
            Text('What do you want to cook today?',
                style: TextStyle(
                  fontSize: fontSizeBase,
                  color: blackColor,
                ))
          ]),
        ],
      ),
    );
  }
}
