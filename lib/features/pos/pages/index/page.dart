import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pancong/core/core.dart';
import 'package:pancong/features/pos/pos.dart';
import 'package:pancong/features/product/product.dart';

part 'sections/item_section.dart';
part 'sections/cart_section.dart';
//UI page pos
class POSPage extends StatefulWidget {
  const POSPage({super.key});

  @override
  State<POSPage> createState() => _POSPageState();
}

class _POSPageState extends State<POSPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {
      getData();
    });

    getData();

    context.read<CartBloc>().add(const InitialCartEvent());
    super.initState();
  }

  void getData() {
    context.read<ProductBloc>().add(GetProductEvent(controller.text));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('POS')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimens.dp16),
            child: SearchTextInput(
              controller: controller,
              hintText: 'Cari berdasarakan nama produk atau SKU',
            ),
          ),
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state.status == Status.success && state.products.isEmpty) {
                  return const EmptyTemplate();
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(Dimens.dp16),
                  itemBuilder: (context, index) {
                    final item = state.products[index];
                    return _ItemSection(product: item);
                  },
                  separatorBuilder: (context, index) => Dimens.dp16.height,
                  itemCount: state.products.length,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.carts.isEmpty) {
            return const SizedBox();
          } else {
            return _CartSection(
              qtyItem: state.getQty,
              price: state.getEstimate,
            );
          }
        },
      ),
    );
  }
}
