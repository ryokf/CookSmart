import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {
  const Instructions({super.key, required this.instructionData});

  final Future instructionData;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: instructionData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Text(
                        "Steps required to make this recipe",
                      style: TextStyle(
                        fontSize: fontSizeSmall,
                        fontWeight: FontWeight.w400,
                        color: greyColor,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 700,
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                "${index + 1}. ${snapshot.data[index]["step"]}",
                                style: TextStyle(
                                  fontSize: fontSizeBase,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
