import 'dart:math';

import 'package:alisveris_kapsulu/models/product_model.dart';
import 'package:alisveris_kapsulu/providers/product_provider.dart';
import 'package:alisveris_kapsulu/services/assets_manages.dart';
import 'package:alisveris_kapsulu/widgets/app_name.dart';
import 'package:alisveris_kapsulu/widgets/product/product_widget.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart/cart_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  late TextEditingController searchTextController;

  @override
  void initState(){
    searchTextController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    final productsProvider = Provider.of<ProductProvider>(context);
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AssetsManager.card
            ),
          ),
          title: const AppNameTextWidget(fontSize: 20),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15.0,
              ),
              TextField(
                controller: searchTextController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    onTap: (){
                      setState(() {
                        FocusScope.of(context).unfocus();
                        searchTextController.clear();
                      });
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                  ),
                ),
                onChanged: (value){
                   log("value of text is $value" as num);
                },
                onSubmitted: (value){
                   log("${searchTextController}" as num);
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(child: DynamicHeightGridView(
                mainAxisSpacing: 12,
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                itemCount: productsProvider.getProducts.length,
                builder: (context, index){
                  return ProductWidget(productId: productsProvider.getProducts[index].productId);
                },
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
