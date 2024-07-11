
import 'package:alisveris_kapsulu/screens/cart/bottom_checkout.dart';
import 'package:alisveris_kapsulu/widgets/app_name.dart';
import 'package:alisveris_kapsulu/screens/cart/cart_widget.dart';
import 'package:alisveris_kapsulu/screens/cart/empty_bag.dart';
import 'package:alisveris_kapsulu/services/assets_manages.dart';
import 'package:alisveris_kapsulu/widgets/title_text.dart';
import 'package:flutter/material.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  static const routName = "/ViewedRecentlyScreen";

  const ViewedRecentlyScreen({super.key});
  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return isEmpty ?
    Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
            ),
          ),
          title: const TitleTextWidget(label: "Viewed Recently"),
        ),
        body: EmptyBagWidget(
          imagePath: AssetsManager.search ,
          title: 'Your Viewed Recently is empty',
          subtitle: 'Like your Viewed Recently is empty',
          buttonText: 'Shop Now',
        )
    )
        :Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
        title: const TitleTextWidget(label: "Viewed Recently"),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return const CartWidget();
      }),
    );
  }
}
