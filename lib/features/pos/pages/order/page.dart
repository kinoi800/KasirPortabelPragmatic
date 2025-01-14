import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pancong/core/core.dart';
import 'package:pancong/features/home/home.dart';
import 'package:pancong/features/pos/pos.dart';
import 'package:pancong/features/transaction/transaction.dart';

part 'sections/action_section.dart';
part 'sections/order_section.dart';
part 'sections/detail_section.dart';
part 'sections/discount_section.dart';
//UI Daftar pesanan di page POS
class POSOrderPage extends StatelessWidget {
  const POSOrderPage({super.key});

  static const String routeName = '/pos/order';

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CartBloc, CartState>(listener: (context, state) {
          if (state.carts.isEmpty) {
            Navigator.pop(context);
          }
        }),
        BlocListener<TransactionBloc, TransactionState>(
          listener: (context, state) {
            if (state.status == Status.apply) {
               context.read<BottomNavBloc>().add(const TapBottomNavEvent(1));
              Navigator.pushNamedAndRemoveUntil(
                context,
                MainPage.routeName,
                (route) => false,
              );
            }
          },
        )
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Daftar Pesanan')),
        body: ListView(
          children: const [
            _OrderSection(),
            Divider(thickness: Dimens.dp8),
            _DetailSection(),
          ],
        ),
        bottomNavigationBar: const _ActionSection(),
      ),
    );
  }
}
