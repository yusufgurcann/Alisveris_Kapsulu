import 'package:alisveris_kapsulu/screens/cart/empty_bag.dart';
import 'package:alisveris_kapsulu/screens/init_screen/wishlist.dart';
import 'package:alisveris_kapsulu/services/assets_manages.dart';
import 'package:alisveris_kapsulu/widgets/order/order_widget.dart';
import 'package:alisveris_kapsulu/widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  static const routName = "/OrderScreen";

  const OrderScreen({super.key});


  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final bool isEmptyOrders = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const TitleTextWidget(label: "All Orders"),
      ),
      body: isEmptyOrders
          ? EmptyBagWidget(
              imagePath: AssetsManager.rounden_map,
              title: "No orders has bee placed",
              subtitle: " ",
              buttonText: "shop now")
          : ListView.separated(
              itemBuilder: (ctx, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                  child: OrderWidgetFree(),
                );
              },
              separatorBuilder: (BuildContext contex, int index) {
                return const Divider(
                  color: Colors.black54,
                );
              },
              itemCount: 10),
    );
  }
}
