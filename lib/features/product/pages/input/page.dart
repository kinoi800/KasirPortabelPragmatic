import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pancong/core/core.dart';
import 'package:pancong/features/product/product.dart';

part 'sections/info_section.dart';
part 'sections/price_section.dart';
part 'sections/stock_section.dart';
//halaman TAMBAH PRODUK
class ProductInputPage extends StatefulWidget {
  const ProductInputPage({super.key, this.product});

  final ProductModel? product;

  static const String routeName = '/product/input';

  @override
  State<ProductInputPage> createState() => _ProductInputPageState();
}

class _ProductInputPageState extends State<ProductInputPage> {
  @override
  void initState() {
    context.read<FormProductBloc>().add(InitialFormProductEvent(
          image: widget.product?.image,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state.status == Status.apply) {
          Navigator.pop(context);
        }
      },
      //appbar halaman tambah produk
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.product != null ? 'Edit Produk' : 'Tambah Produk'),
        ),
         //pemanggil konfigurasi bagian input di halaman tambah produk
         //divider atau pemisah antar bagian input Produk,harga,stock
        body: ListView(
          children: [
            _InfoSection(product: widget.product),
            const Divider(),
            _PriceSection(product: widget.product),
            const Divider(thickness: Dimens.dp8),
            _StockSection(product: widget.product),
          ],
        ),
         //konfigurasi tombol simpan di halaman tambah produk
        bottomNavigationBar: BlocBuilder<FormProductBloc, FormProductState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Dimens.dp16),
                child: ElevatedButton(
                  onPressed: state.isValid
                      ? () {
                          if (widget.product != null) {
                            context
                                .read<ProductBloc>()
                                .add(UpdateProductEvent(state.product(
                                  id: widget.product?.id,
                                  createdAt: widget.product?.createdAt,
                                )));
                          } else {
                            context
                                .read<ProductBloc>()
                                .add(CreateProductEvent(state.product()));
                          }
                        }
                      : null,
                  child: const Text('Simpan'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
