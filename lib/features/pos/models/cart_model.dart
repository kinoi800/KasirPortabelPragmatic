import 'package:equatable/equatable.dart';
import 'package:pancong/features/product/product.dart';
import 'package:pancong/features/transaction/transaction.dart';
//model data item produk bagian page POS dan produk
class CartModel extends Equatable {
  const CartModel({this.qty = 1, required this.product});

  final int qty;
  final ProductModel product;

  TransactionItemModel get toTransaction {
    return TransactionItemModel(
      qty: qty,
      title: product.title,
      desc: product.desc,
      image: product.image,
      regularPrice: product.regularPrice,
      price: product.price,
      stock: product.stock,
      unit: product.unit,
      sku: product.sku,
      transactionId: 0,
    );
  }

  @override
  List<Object> get props => [qty, product];
}
