//ektrak widget text dipakai berulang
//konfigurasi teks format bentuk headline
import 'package:flutter/material.dart';
import 'package:pancong/core/core.dart';

class HeadingText extends StatelessWidget {
  const HeadingText(
    this.text, {
    super.key,
    this.align,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    final baseStyle = context.theme.textTheme.headlineLarge;

    return Text(
      text,
      style: baseStyle?.merge(style),
      textAlign: align,
    );
  }
}
