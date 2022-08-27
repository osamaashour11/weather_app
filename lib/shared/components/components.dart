import 'package:flutter/material.dart';
import 'package:new_flutter_weather/shared/constants/constants.dart';

class defaultText extends StatelessWidget {
  defaultText({
    Key? key,
    required this.text,
    this.maxLines = 1,
    this.textOverflow = TextOverflow.ellipsis,
    this.fontSize = 20.00,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
  }) : super(key: key);

  final String text;
  int? maxLines;
  TextOverflow? textOverflow;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        overflow: textOverflow,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

class defaultDataItem extends StatelessWidget {
  defaultDataItem({
    Key? key,
    required this.url,
    required this.result,
    required this.name,
  }) : super(key: key);

  final String url;
  final String name;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage(url),
          height: 30,
        ),
        const SizedBox(
          width: 10,
        ),
        defaultText(
          text: '$name: $result',
          fontSize: 22,
          color: defaultAppColor,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
