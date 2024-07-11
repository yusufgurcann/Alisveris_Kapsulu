import 'package:alisveris_kapsulu/widgets/subtitle_text.dart';
import 'package:alisveris_kapsulu/widgets/title_text.dart';
import 'package:flutter/material.dart';

class EmptyBagWidget extends StatelessWidget {
  const EmptyBagWidget({
      super.key,
      required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.buttonText
      });

  final String imagePath, title, subtitle, buttonText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              imagePath,
              width: double.infinity,
              height: size.height * 0.35,
            ),
            const SizedBox(
              height: 20,
            ),
            const TitleTextWidget(
                label: "",
              fontsize: 40,
              color: Colors.deepPurpleAccent,
            ),
            const SizedBox(
              height: 20,
            ),
            SubTitleTextWidget(
                label: title,
              fontWeight: FontWeight.w800,
              fontsize: 25,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(padding: const EdgeInsets.all(8.0),
              child: SubTitleTextWidget(
                label: subtitle,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              onPressed:(){
                null;
              },
              child: Text(buttonText),
            ),
          ],
        ),
    );
  }
}
