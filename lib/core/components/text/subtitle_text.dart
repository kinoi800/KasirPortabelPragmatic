//ektrak widget text dipakai berulang
//konfigurasi teks format bentuk headline
import 'package:flutter/material.dart';
import 'package:pancong/core/core.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText(
    this.text,{
     super.key,
    this.align,
    this.style,
      });

final String text;
final TextStyle? style;
final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    //konfigurasi bentuk tema teks splash1
    final baseStyle = context.theme.textTheme.titleLarge;
    return Text(
      text,
    //konfigurasi bentuk tema teks splash2
     style: baseStyle?.merge(style),
      textAlign: align,
     );
  }
}
