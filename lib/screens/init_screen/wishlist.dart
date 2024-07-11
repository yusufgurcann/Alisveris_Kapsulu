
import 'package:alisveris_kapsulu/screens/cart/bottom_checkout.dart';
import 'package:alisveris_kapsulu/widgets/app_name.dart';
import 'package:alisveris_kapsulu/screens/cart/cart_widget.dart';
import 'package:alisveris_kapsulu/screens/cart/empty_bag.dart';
import 'package:alisveris_kapsulu/services/assets_manages.dart';
import 'package:alisveris_kapsulu/widgets/title_text.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  static const routName = "/WishlistScreen";

  const WishlistScreen({super.key});
  final bool isEmpty = false;

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
          title: const TitleTextWidget(label: "Wishlist"),
        ),
        body: EmptyBagWidget(
          imagePath: AssetsManager.bagImg_7,
          title: 'Your Cart is empty',
          subtitle: 'Like your cart is empty',
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
        title: const TitleTextWidget(label: "Wishlist"),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return const CartWidget();
      }),
    );
  }
}
