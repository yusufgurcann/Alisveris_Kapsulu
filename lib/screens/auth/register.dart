import 'dart:math';

import 'package:alisveris_kapsulu/constans/validator.dart';
import 'package:alisveris_kapsulu/services/myApp_function.dart';
import 'package:alisveris_kapsulu/widgets/app_name.dart';
import 'package:alisveris_kapsulu/widgets/image_picker_widget.dart';
import 'package:alisveris_kapsulu/widgets/subtitle_text.dart';
import 'package:alisveris_kapsulu/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  static const routName = "/RegisterScreen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText = true;
  late final TextEditingController _nameController,
  _emailController,
  _passwordController,
  _repeatPasswordController;

  late FocusNode _nameFocusNode, _emailFocusNode, _passwordFocusNode, _repeatPasswordFocusNode;

  final _formkey = GlobalKey<FormState>();
  XFile? _pickedImage;

  @override
  void initState(){
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();

    _nameFocusNode =  FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _repeatPasswordFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose(){
    if(mounted){
      _nameController.dispose();
      _emailController.dispose();
      _passwordController.dispose();
      _repeatPasswordController.dispose();

      _nameFocusNode.dispose();
      _emailFocusNode.dispose();
      _passwordFocusNode.dispose();
      _repeatPasswordFocusNode.dispose();
    }
    super.dispose();
  }

  Future<void> _registerFCT() async{
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
  }

  Future<void> localImagePicker () async{
    final ImagePicker imagePicker = ImagePicker();
    await MyAppFunctions.imagePickerDialog(
      context: context,
      cameraFCT: () async{
        _pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
        setState(() {

        });
      },
      galleryFCT: () async{
        _pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
        setState(() {

        });
      },
      removeFCT: (){
        setState(() {
          _pickedImage = null;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const AppNameTextWidget(
                  fontSize: 20,
                ),
                const SizedBox(
                  height: 60,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TitleTextWidget(label: "Welcome"),
                      SubTitleTextWidget(label: "Yor Welcome message hello"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child:
                  SizedBox(
                    height: size.width * 0.3,
                    width: size.width * 0.3,
                    child: ImagePickerWidget(
                      function: () async {
                        await localImagePicker();
                      },
                      pickedImage: _pickedImage,
                    ),
                ),

                ),

                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        focusNode: _nameFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Email Adress",
                          prefixIcon: Icon(Icons.person),
                        ),
                        onFieldSubmitted: (value){
                          FocusScope.of(context).requestFocus(_emailFocusNode);
                        },
                        validator: (value){
                          return MyValidators.EmailValidator(value);
                        },
                      ),

                      const SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Email Adress",
                          prefixIcon: Icon(IconlyLight.message)
                        ),
                        onFieldSubmitted: (value){
                          FocusScope.of(context).requestFocus(_passwordFocusNode);
                        },
                        validator: (value){
                          return MyValidators.EmailValidator(value);
                        },
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(IconlyLight.password),
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: Icon(
                              obscureText ? Icons.visibility_off
                                  :Icons.visibility
                            ),
                          ),
                        ),
                        onFieldSubmitted: (value){
                          FocusScope.of(context).requestFocus(_repeatPasswordFocusNode);
                        },
                        validator: (value){
                          return MyValidators.PasswordValidator(value);
                        },
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        controller: _repeatPasswordController,
                        focusNode: _repeatPasswordFocusNode,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: obscureText,
                        decoration:  InputDecoration(
                          hintText: "Repeat Password",
                          prefixIcon: Icon(IconlyLight.password),
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: Icon(
                              obscureText ? Icons.visibility_off
                                  :Icons.visibility
                            ),
                          ),
                        ),
                        onFieldSubmitted: (value) async {
                          await _registerFCT();
                        },
                        validator: (value){
                          return MyValidators.PasswordValidator(value);
                        },
                      ),
                      const SizedBox(
                        height: 48.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () async { await _registerFCT();},
                          label: Text("Sign up"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
