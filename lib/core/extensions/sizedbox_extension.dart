import 'package:flutter/material.dart';
//extensi jarak lebar dan panjang contoh = Dimens.defaultSize.height atau width
extension SizedBoxExtension on double{
  SizedBox get width => SizedBox(width: this);
  SizedBox get height => SizedBox(height: this);
}
