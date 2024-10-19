import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const normalTextSize = 16.0;
const headingTextSize = 20.0;
const normalText = TextStyle(fontSize: normalTextSize, color: textColor);
const boldNormalText = TextStyle(fontSize: normalTextSize, fontWeight: FontWeight.bold, color: textColor);
const headingText = TextStyle(fontSize: headingTextSize, fontWeight: FontWeight.bold, color: textColor);
const subheadingTextBold = TextStyle(fontSize: normalTextSize, fontWeight: FontWeight.bold, color: subheadingColor);
const subheadingText = TextStyle(fontSize: normalTextSize, color: subheadingColor);
const labelText = TextStyle(fontSize: normalTextSize, color: searchBarLabelColor, fontWeight: FontWeight.bold);

final markDownStyle = MarkdownStyleSheet(
  h1: boldNormalText,
  strong: boldNormalText,
  p: normalText,
  tableBody: normalText,
  tableHead: boldNormalText,
  tableColumnWidth: const IntrinsicColumnWidth(),
  tableHeadAlign: TextAlign.center,
  tableBorder: TableBorder.all(color: subheadingColor),
  listBullet: boldNormalText,
);
//Colors
const iconColorPurple = Color(0XFF762fa2);
const bottomBackgroundColor = Color(0xFF212121);
const itemSelectedColor = Color(0xFFC62828);
const scaffoldBackgroundColor = Color(0xFF121212);
const bottomNavigationBarColor = Color(0xFF020202);
const cardBackgroundColor = Color(0xFF1D1D1D);
const textColor = Colors.white;
const subheadingColor = Color(0xFF707070);
const searchBarColor = Color(0xFF293742);
const searchBarLabelColor = Color(0xFF8999A6);
const checkBoxBorderColor = Color(0xFF8999A6);
const checkBoxBackgroundColorUnchecked = Color(0xFF293742);

final enabledStyle = WidgetStateProperty.resolveWith((states) {
  if (!states.contains(WidgetState.selected)) {
    return checkBoxBackgroundColorUnchecked;
  }
  return iconColorPurple;
});
final disabledStyle = WidgetStateProperty.resolveWith((states) {
  return checkBoxBackgroundColorUnchecked;
});