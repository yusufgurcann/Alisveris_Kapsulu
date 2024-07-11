import 'package:alisveris_kapsulu/constans/app_constans.dart';
import 'package:alisveris_kapsulu/widgets/subtitle_text.dart';
import 'package:alisveris_kapsulu/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class OrderWidgetFree extends StatefulWidget {
  const OrderWidgetFree({super.key});

  @override
  State<OrderWidgetFree> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidgetFree> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.width * 0.25,
              width: size.width * 0.25,
              imageUrl: AppConstans.imageUrl,
            ),
          ),
          Flexible(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            child: TitleTextWidget(label: "Product Title", fontsize: 15,)
                        ),
                        IconButton(onPressed: (){}, icon: Icon(Icons.clear, color: Colors.red, size: 20,)),
                      ],
                    ),
                    Row(
                      children: [
                        TitleTextWidget(label: "Price"),
                        const SizedBox(
                          width: 15,
                        ),
                        SubTitleTextWidget(label: "\$11.00"),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const SubTitleTextWidget(label: "qty : 20",fontsize: 13,),
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}
