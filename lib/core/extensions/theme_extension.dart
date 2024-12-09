import 'package:flutter/material.dart';
//extensi untuk mengatur tema theme 
//contoh = style: context.theme.textTheme.headlineLarge,
extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
