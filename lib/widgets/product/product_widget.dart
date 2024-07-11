import 'dart:math';

import 'package:alisveris_kapsulu/providers/product_provider.dart';

import 'package:alisveris_kapsulu/widgets/subtitle_text.dart';
import 'package:alisveris_kapsulu/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key,
    required this.productId,

  }
      );

  final String productId;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    final productsProvider = Provider.of<ProductProvider>(context);
    final getCurrProduct = productsProvider.findByProId(widget.productId);

    return getCurrProduct == null
        ? SizedBox.shrink()
        : Padding(
      padding: EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: () {
          log("to do ad d navigate" as num);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: FancyShimmerImage(
                imageUrl: getCurrProduct.productImage,
                height: size.height * 0.2,
                width: size.height * 0.2,

              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Flexible(

                      child: TitleTextWidget(label: getCurrProduct.productTitle, fontsize: 15,

                      )
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 1,
                      child: SubTitleTextWidget(
                        label: getCurrProduct.productPrice,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,)
                  ),
                  Flexible(
                      child: Material(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.lightBlue,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12.0),
                          onTap: () {},
                          splashColor: Colors.grey,
                          child: Padding
                            (
                            padding: EdgeInsets.all(2.0),
                            child: Icon(Icons.check),
                          ),
                        ),
                      )

                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            )
          ],

        ),
      ),

    );
  }
}