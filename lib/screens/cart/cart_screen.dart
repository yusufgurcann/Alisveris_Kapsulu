
import 'package:alisveris_kapsulu/screens/cart/bottom_checkout.dart';
import 'package:alisveris_kapsulu/widgets/app_name.dart';
import 'package:alisveris_kapsulu/screens/cart/cart_widget.dart';
import 'package:alisveris_kapsulu/screens/cart/empty_bag.dart';
import 'package:alisveris_kapsulu/services/assets_manages.dart';
import 'package:alisveris_kapsulu/widgets/title_text.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return isEmpty ?
    Scaffold(
      body: EmptyBagWidget(
        imagePath: AssetsManager.card2,
        title: 'Your Cart is empty',
        subtitle: 'Like your cart is empty',
        buttonText: 'Shop Now',
      )
    )
    :Scaffold(
      bottomSheet: CartBottomSheetWidget(),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.bagImg_2
          ),
        ),
        title: const TitleTextWidget(label: "Card (7)"),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.delete_forever_rounded, color: Colors.red,)
          ),
        ],
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return const CartWidget();
      }),
    );
  }
}
