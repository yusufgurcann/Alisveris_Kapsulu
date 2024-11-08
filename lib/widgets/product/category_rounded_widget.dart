import 'package:alisveris_kapsulu/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

class CategoryRoundedWidget extends StatelessWidget {
  const CategoryRoundedWidget({
    super.key,
    required this.image,
    required this.name,
  });

  final String image, name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, height: 50, width: 50),
        const SizedBox(
          height: 5,
        ),
        SubTitleTextWidget(
          label: name,
          fontsize: 13,
          fontWeight: FontWeight.w800,
        ),
      ],
    );
  }
}
