part of '../page.dart';
//konfigurasi pembuatan bentuk tombol (Tambah produk) di halaman produk
class _FloationgSection extends StatelessWidget {
  const _FloationgSection({required this.onTap});

  final Function() onTap;
//pengarah tombol tambah produk agar bisa pindah kehalaman yang berbeda
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.dp16,
          vertical: Dimens.dp8,
        ),
        decoration: BoxDecoration(
          color: context.theme.primaryColor,
          borderRadius: BorderRadius.circular(Dimens.dp8),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: context.theme.primaryColor.withOpacity(.5),
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add_rounded,
              color: context.theme.scaffoldBackgroundColor,
            ),
            Dimens.dp8.width,
            RegularText.semiBold(
              'Tambah Produk',
              style: TextStyle(
                color: context.theme.scaffoldBackgroundColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
