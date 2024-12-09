import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pancong/core/core.dart';
import 'package:pancong/features/home/home.dart';

part 'sections/card_section.dart';
//konfigurasi tampilan homepage untuk dengan tampilan 'Home Page'2
//Bagian terpisah Tampilan Home Page
// agar lebih rapih untuk setiap halamannya
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetDataHomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //konfigurasi pembuatan app bar atas (beranda)
      appBar: AppBar(title: const Text('Beranda')),
      //Konfigurasi HomePage agar bisa di scroll 
      //Konfigurasi kotak kecil HomePage melebar mentok layar
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Column(
              children: [
                _CardSection(
                  label: 'Total Penjualan',
                  value: state.totalSale.toIDR(),//mengedit teks di kotak kecil home page
                ),
                Dimens.dp16.height,
                _CardSection(
                  label: 'Total Transaksi',
                  value: state.totalTransaction.toString(),//konfigurasi jarak antar kotak kecil di home page
                ),
                Dimens.dp16.height,
                _CardSection(
                  label: 'Total Produk',
                  value: '${state.totalProduct}',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
