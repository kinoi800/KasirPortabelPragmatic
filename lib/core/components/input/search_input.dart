import 'package:flutter/material.dart';
import 'package:pancong/core/core.dart';
//konfigurasi teks input untuk search bar halaman produk1
class SearchTextInput extends StatelessWidget {
  const SearchTextInput({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
  });

  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return RegularTextInput(
      hintText: hintText,
      controller: controller,
      onChanged: onChanged,
      prefixIcon: AppIcons.search,
    );
  }
}
