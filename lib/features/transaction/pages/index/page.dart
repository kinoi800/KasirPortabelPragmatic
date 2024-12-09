import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pancong/core/core.dart';
import 'package:pancong/features/transaction/transaction.dart';

part 'sections/filter_section.dart';
part 'sections/item_section.dart';
//halaman transaksi
class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar halaman transaksi
      appBar: AppBar(title: const Text('Transaksi')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(Dimens.dp16),
            child: _FilterSection(),
          ),
          Expanded(
            child: BlocBuilder<TransactionBloc, TransactionState>(
              builder: (context, state) {
                if (state.transactions.isEmpty) {
                  return const EmptyTemplate();
                }
                //agar halaman transaksi dapat di scroll
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final item = state.transactions[index];
                    return _ItemSection(item);
                  },
                  itemCount: state.transactions.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
