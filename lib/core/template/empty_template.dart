import 'package:flutter/material.dart';
import 'package:pancong/core/core.dart';

class EmptyTemplate extends StatelessWidget {
  const EmptyTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              MainAssets.empty,
              width: Dimens.width(context) / 2,
            ),
            Dimens.dp32.height,
            const SubtitleText(
              'Tidak ada produk disini',
              align: TextAlign.center,
            ),
            Dimens.dp16.height,
            const RegularText(
              'Kamu belum memiliki produk, '
              'tambahkan produk terlebih dahulu untuk mulai menjual',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
