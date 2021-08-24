import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color titleColor;
  final Color subTitleColor;
  final double titleFontSize;
  final double subTitleFontSize;

  const Header(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.titleColor = Colors.black,
      this.subTitleColor = Colors.black,
      this.titleFontSize = 32.0,
      this.subTitleFontSize = 18.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64.0, left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: titleColor,
                fontSize: titleFontSize,
                fontWeight: FontWeight.w500,
                letterSpacing: 1),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            subTitle,
            style: TextStyle(
              color: subTitleColor,
              fontSize: subTitleFontSize,
              fontWeight: FontWeight.w300,
              wordSpacing: 2.0,
            ),
          )
        ],
      ),
    );
  }
}
