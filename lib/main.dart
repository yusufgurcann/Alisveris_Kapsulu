import 'package:alisveris_kapsulu/constans/theme_data.dart';
import 'package:alisveris_kapsulu/providers/product_provider.dart';
import 'package:alisveris_kapsulu/providers/theme_provider.dart';
import 'package:alisveris_kapsulu/root_screen.dart';
import 'package:alisveris_kapsulu/screens/auth/forget_password.dart';
import 'package:alisveris_kapsulu/screens/auth/login.dart';
import 'package:alisveris_kapsulu/screens/auth/register.dart';
import 'package:alisveris_kapsulu/screens/init_screen/viewed_recently.dart';
import 'package:alisveris_kapsulu/screens/init_screen/wishlist.dart';
import 'package:alisveris_kapsulu/widgets/order/order_screen.dart';
import 'package:alisveris_kapsulu/widgets/product/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_){
        return ThemeProvider();
      }),
      ChangeNotifierProvider(create: (_){
        return ProductProvider();
      }),
    ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child){
        return MaterialApp(
          title: "Alışveriş Kapsülü",
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          //home:  const LoginScreen(),
          home: const RootScreen(),
          routes: {
            ProductDetailsScreen.routName : (context) => const ProductDetailsScreen(),
            WishlistScreen.routName : (context) => const WishlistScreen(),
            ViewedRecentlyScreen.routName : (context) => const ViewedRecentlyScreen(),
            RegisterScreen.routName : (context) => const RegisterScreen(),
            OrderScreen.routName : (context) => const OrderScreen(),
            ForgetPassword.routName : (context) => const ForgetPassword(),
          },
        );
      },),
    );
  }
}

