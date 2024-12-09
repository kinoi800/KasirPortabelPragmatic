import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pancong/core/core.dart';
import 'package:pancong/features/product/product.dart';

part 'sections/item_section.dart';
part 'sections/floating_section.dart';
//halaman PRODUK
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {
      getData();
    });

    getData();
    super.initState();
  }

  void getData() {
    context.read<ProductBloc>().add(GetProductEvent(controller.text));
  }
//appbar halaman produk
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produk')),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state.status == Status.deleted) {
            getData();
          }
        },
        //halaman di konfiguarsi berbentuk kebawah untuk halaman produk
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Dimens.dp16.height,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.dp16,
                ),
                //konfigurasi search bar halaman produk1
                child: SearchTextInput(
                  controller: controller,
                  hintText: 'Cari berdasarakan nama produk atau SKU',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimens.dp16),
                child: SubtitleText('${state.products.length} Produk'),
              ),
              //pemanggil tampilan item section halaman produk
              Expanded(
                child: state.status == Status.success && state.products.isEmpty
                    ? const EmptyTemplate()
                    : ListView.separated(
                        padding: const EdgeInsets.all(Dimens.dp16),
                        itemBuilder: (context, index) {
                          final item = state.products[index];
                          return _ItemSection(
                            product: item,
                            onDelete: () {
                              context
                                  .read<ProductBloc>()
                                  .add(DeleteProductEvent(item.id));
                            },
                            onEdit: () async {
                              await Navigator.pushNamed(
                                context,
                                ProductInputPage.routeName,
                                arguments: item,
                              );

                              getData();
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            Dimens.dp16.height,
                        itemCount: state.products.length,
                      ),
              ),
            ],
          );
        },
      ),
      //pemanggil tampilan tombol (tambah produk) halaman produk
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _FloationgSection(
        onTap: () async {
          await Navigator.pushNamed(context, ProductInputPage.routeName);

          getData();
        },
      ),
    );
  }
}
