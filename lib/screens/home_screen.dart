import 'package:alisveris_kapsulu/constans/app_constans.dart';
import 'package:alisveris_kapsulu/providers/theme_provider.dart';
import 'package:alisveris_kapsulu/services/assets_manages.dart';
import 'package:alisveris_kapsulu/widgets/app_name.dart';
import 'package:alisveris_kapsulu/widgets/product/category_rounded_widget.dart';
import 'package:alisveris_kapsulu/widgets/product/product_widget.dart';
import 'package:alisveris_kapsulu/widgets/product/top_product.dart';
import 'package:alisveris_kapsulu/widgets/subtitle_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.card),
        ),
        title: const AppNameTextWidget(fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: size.height * 0.25,
                child: ClipRRect(
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        AppConstans.bannerImages[index],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: AppConstans.bannerImages.length,
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.greenAccent,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const TitleTextWidget(label: "Top Product"),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                height: size.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return TopProductWidget();
                  },
                ),
              ),
              const TitleTextWidget(label: "Categories"),
              const SizedBox(
                height: 15.0,
              ),
              GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  children:
                      List.generate(AppConstans.categoriesList.length, (index) {
                    return CategoryRoundedWidget(
                        image: AppConstans.categoriesList[index].image,
                        name: AppConstans.categoriesList[index].name);
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
