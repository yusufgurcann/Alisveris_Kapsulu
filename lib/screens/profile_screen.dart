import 'package:alisveris_kapsulu/main.dart';
import 'package:alisveris_kapsulu/providers/theme_provider.dart';
import 'package:alisveris_kapsulu/screens/init_screen/viewed_recently.dart';
import 'package:alisveris_kapsulu/screens/init_screen/wishlist.dart';
import 'package:alisveris_kapsulu/services/assets_manages.dart';
import 'package:alisveris_kapsulu/services/myApp_function.dart';
import 'package:alisveris_kapsulu/widgets/app_name.dart';
import 'package:alisveris_kapsulu/widgets/order/order_screen.dart';
import 'package:alisveris_kapsulu/widgets/subtitle_text.dart';
import 'package:alisveris_kapsulu/widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.user512),
        ),
        title: const AppNameTextWidget(fontSize: 20),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Visibility(
              visible: false,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TitleTextWidget(label: "label"),
              )),
          Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.background,
                        width: 3,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        AssetsManager.login,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      TitleTextWidget(label: "Yusuf Gürcan"),
                      SizedBox(
                        height: 6,
                      ),
                      SubTitleTextWidget(label: "E-mail yusufgur401@gmail.com")
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                const TitleTextWidget(label: "Information"),
                const SizedBox(
                  height: 10,
                ),
                CustomListTile(
                    imagePath: AssetsManager.bagImg_2,
                    text: "All Orders",
                    function: () {
                      Navigator.pushNamed(context, OrderScreen.routName);
                     }
                    ),
                CustomListTile(
                    imagePath: AssetsManager.bagImg_1,
                    text: "Favori",
                    function: () {
                      Navigator.pushNamed(context, WishlistScreen.routName);
                    }),
                CustomListTile(
                    imagePath: AssetsManager.clock,
                    text: "Viewed Recently",
                    function: () {
                      Navigator.pushNamed(context, ViewedRecentlyScreen.routName);
                    }),
                CustomListTile(
                    imagePath: AssetsManager.location,
                    text: "Locations",
                    function: () {}),
                const Divider(
                  thickness: 1,
                ),
                CustomListTile(
                    imagePath: AssetsManager.privacy,
                    text: "Settings",
                    function: () {}),
                const SizedBox(
                  height: 10,
                ),
                SwitchListTile(
                  title: Text(
                      themeProvider.getIsDarkTheme ? "Dark Mode" : "Light Mode"),
                  value: themeProvider.getIsDarkTheme,
                  onChanged: (value) {
                    themeProvider.setDarkTheme(themeValue: value);
                  },
                ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () async {
                await MyAppFunctions.showErrorOrWaningDialog(
                  context: context,
                  subtitle: "Are you sure?",
                  fct: () {},
                  isError: false,
                );
              },
              icon: const Icon(Icons.login),
              label: const Text("Login"),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.imagePath,
    required this.text,
    required this.function,
  });

  final String imagePath, text;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: function,
      title: SubTitleTextWidget(
        label: text,
      ),
      leading: Image.asset(
        imagePath,
        height: 34,
      ),
      trailing: const Icon(CupertinoIcons.chevron_right),
    );
  }
}