part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState({
    this.carts = const [],
    this.disc = 0,
    this.type,
  });

  factory CartState.initial() {
    return const CartState();
  }

  final List<CartModel> carts;
  final DiscountType? type;
  final num disc;

  CartModel? findItem(int id) {
    try {
      return carts.firstWhere((e) => e.product.id == id);
    } catch (e) {
      return null;
    }
  }

  bool isValidCash(String nominal) {
    return (num.tryParse(nominal) ?? 0) >= (getEstimate - discount);
  }

  int get getQty {
    int qty = 0;

    for (var element in carts) {
      qty += element.qty;
    }

    return qty;
  }

  int get getEstimate {
    int price = 0;

    for (var element in carts) {
      price += element.qty * element.product.regularPrice;
    }

    return price;
  }

  num get discount {
    if (type == DiscountType.percentage) {
      return getEstimate * disc / 100;
    } else {
      return disc;
    }
  }
//model simpan draft
  TransactionModel transaction(
    TypeEnum type, {
    num? payAmount,
    PaymentType? paymentType,
  }) {
    final now = DateTime.now();
    return TransactionModel(
      referenceId: 'TRX-${now.year}${now.month}${now.day}${now.millisecond}',
      type: type,
      amount: getEstimate,
      createdAt: now,
      paymentType: paymentType ?? PaymentType.cash,
      items: carts.map((e) => e.toTransaction).toList(),
      discount: discount,
      payAmount: payAmount ?? getEstimate - discount,
    );
  }

  CartState copyWith({
    List<CartModel>? carts,
    DiscountType? type,
    num? disc,
  }) {
    return CartState(
      carts: carts ?? this.carts,
      disc: disc ?? this.disc,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [carts, disc, type];
}
