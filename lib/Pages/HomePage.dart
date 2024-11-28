import 'package:cook_smart/Components/SearchInput.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget Header() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(fullRounded),
              child: Image.network(
                  'https://images.unsplash.com/photo-1617825013838-0c4109a96aca?q=80&w=2128&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Halo Ryo',
              style: TextStyle(
                fontSize: fontSizeBase,
                color: greyColor,
              ),
            ),
            Text('Mau masak apa hari ini?',
                style: TextStyle(
                  fontSize: fontSizeBase,
                  color: blackColor,
                ))
          ]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Header(),
          SearchInput(),
        ],
      ),
    );
  }
}
