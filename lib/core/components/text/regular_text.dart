//ektrak widget text dipakai berulang
//konfigurasi teks format bentuk regular
import 'package:flutter/material.dart';
import 'package:pancong/core/core.dart';

class RegularText extends StatelessWidget {
  const RegularText(this.text,{
    super.key, 
    this.style, 
    this.textAlign
    });

final String text;
final TextStyle? style;
final TextAlign? textAlign;
//konfigurasi membuat template ketika menulis text ukuran, ketebalan, dll
factory RegularText.medium(
    String text, {
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return RegularText(
      text,
      textAlign: textAlign,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ).merge(style),
    );
  }

factory RegularText.semiBold(
    String text, {
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return RegularText(
      text,
      textAlign: textAlign,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ).merge(style),
    );
  }

  @override
  Widget build(BuildContext context) {
    //konfigurasi bentuk tema teks splash1
    final baseStyle = context.theme.textTheme.bodyMedium;
    return Text(
      text,
    //konfigurasi bentuk tema teks splash2
     style: baseStyle?.merge(style),
     );
  }
}
