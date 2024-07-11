import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HeartBtnWidget extends StatefulWidget {
  const HeartBtnWidget({
    super.key,
    this.bkgColor = Colors.transparent,
    this.size = 20,
  });

  final Color bkgColor;
  final double size;

  @override
  State<HeartBtnWidget> createState() => _HeartBtnWidgetState();
}

class _HeartBtnWidgetState extends State<HeartBtnWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.bkgColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        style: IconButton.styleFrom(elevation: 10),
        onPressed: (){},
        icon: Icon(
          IconlyLight.heart,
          size: widget.size,
        ),
      ),
    );
  }
}
