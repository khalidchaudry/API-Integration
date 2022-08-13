import 'package:flutter/material.dart';

import '../../../constants.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget(
      {Key? key,
      required this.title,
      required this.text,
      required this.textStyle})
      : super(key: key);
  final String title;
  final String text;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(text: title, style: kTextStyle),
      TextSpan(text: text, style: textStyle),
    ]));
  }
}
