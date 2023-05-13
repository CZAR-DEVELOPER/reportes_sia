/*

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final ValueNotifier<String> _searchText;
  final String? hintText;
  final String? labelText;

  const SearchTextField({
    Key? key,
    required ValueNotifier<String> searchText,
    this.labelText,
    this.hintText,
  })  : _searchText = searchText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        EasyDebounce.debounce('searchDebounce', Duration(milliseconds: 500),
            () {
          _searchText.value = value;
        });
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}

*/