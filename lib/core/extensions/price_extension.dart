import 'package:intl/intl.dart';
//ekstensi id harga untuk halaman produk
extension PriceExtension on num {
  String toIDR() {
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'IDR ',
      decimalDigits: 0,
    );
    return formatCurrency.format(this);
  }
}
