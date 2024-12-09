part of '../page.dart';//membagi part dari konfigurasi cardsection.dart/konfigurasi kotak kecil dart2
//super key bisa dihapus gpp

class _CardSection extends StatelessWidget {
  const _CardSection({
    required this.label,
    required this.value,
  });

  final String label;// menjadi card template text title(Total Penjualan)
  final String value;// menjadi card template text value(Rp 5.000.000)
// konfigurasi template kotak kecil agar tidak membuat berulang
//jadi card yang telah dibuat bisa dibuat templatenya dengan cara
//ekstrak widget "Card" nya dengan extract widget
//contoh kofig card awal sebelum di ekstrak ada di /////Beranda dan Card default/////

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
         //konfigurasi padding agar ada jarak teks bisa di tengah kotak
        padding: const EdgeInsets.all(Dimens.dp24),
        child: Column(
         //Konfigurasi Teks kotak kecil agar perataan kiri dari start homepage
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RegularText(label),
            Dimens.dp4.height,//menambah jarak space antar text di kotak kecil homepage
            HeadingText(
              value,
              style: const TextStyle(fontSize: Dimens.dp24),//konfigurasi bentuk ukuran text kotak kecil homepage
            ),
            Dimens.dp6.height,
            RegularText.semiBold(
              'By Data',
              style: TextStyle(
                fontSize: Dimens.dp12,
                color: context.theme.primaryColor,//konfigurasi warna text kotak kecil home page
              ),
            ),
          ],
        ),
      ),
    );
  }
}
