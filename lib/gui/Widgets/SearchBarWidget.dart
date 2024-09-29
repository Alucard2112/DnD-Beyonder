import 'package:flutter/material.dart';

import '../../data/gui/constants.dart';

class SearchBarWidget extends StatelessWidget {
  final String searchText;
  final ValueChanged<String> onChanged;
  final String hintText;
  const SearchBarWidget({this.hintText = "", required this.searchText, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: searchBarLabelColor,
      initialValue: searchText,
      style: normalText,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: searchBarColor,
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: searchBarLabelColor,
            width: 2.0,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: searchBarLabelColor,
          ),
        ),
        labelText: hintText,
        labelStyle: labelText,
      ),
    );
  }
}
