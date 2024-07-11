import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({
    super.key,
    required this.pickedImage,
    required this.function
  });

  final XFile? pickedImage;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
            padding: const EdgeInsets.all(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
              child: pickedImage == null
                  ? Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(25.0)
                ),
              )
                  : Image.file(
                File(pickedImage!.path),
                fit: BoxFit.fill,
              )
          ),
        ),
        Positioned(
          bottom: 0,
            right: 10,
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.blue,
              child: InkWell(
                borderRadius: BorderRadius.circular(12.0),
                onTap: (){},
                splashColor: Colors.red,
                child: const Padding(
                    padding: const EdgeInsets.all(6.0),
                  child: Icon(Icons.add,size: 15,),
                ),
              ),
            ),
        ),
      ],
    );
  }
}
