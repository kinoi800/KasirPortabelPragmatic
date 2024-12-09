import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pancong/core/core.dart';
import 'package:pancong/features/home/home.dart';
import 'package:pancong/features/pos/pos.dart';
import 'package:pancong/features/product/product.dart';
import 'package:pancong/features/settings/pages/pages.dart';
import 'package:pancong/features/transaction/pages/pages.dart';
// HOME PAGE
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const String routeName = '/home';

  //konfigurasi index atau defaultnya aplikasi ke halaman mana1
//konfigurasi tampilan homepage untuk dengan tampilan 'Home Page'1
  @override
  Widget build(BuildContext context) {
    //list class page/daftar halaman fitur dalam aplikasi yang akan dipakai
    const pages = [
      HomePage(),
      TransactionPage(),
      POSPage(),
      ProductPage(),
      SettingsPage(),
    ];

    return BlocBuilder<BottomNavBloc, int>(
      builder: (context, index) {
        return Scaffold(
          body: pages[index],//bertugas sebagai penampil tampilan halaman sesuai pilihan
          //konfigurasi Navigationbar bawah
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,//konfigurasi index atau defaultnya aplikasi ke halaman mana2
            onTap: (value) {//memberikan efek sentuhan pada navigation bar
              context.read<BottomNavBloc>().add(TapBottomNavEvent(value));
            },
             //konfigurasi Navigationbar beserta nama teks dan iconnya
            items: const [
              BottomNavigationBarItem(
                icon: Icon(AppIcons.storefront),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.receipt),
                label: 'Transaksi',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.pos),
                label: 'POS',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.product),
                label: 'Produk',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.settings),
                label: 'Lainnya',
              ),
            ],
          ),
        );
      },
    );
  }
}
