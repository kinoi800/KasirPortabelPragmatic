import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';
//model untuk input data page produk
@JsonSerializable()
class ProductModel extends Equatable {
  const ProductModel({
    this.id = 0,
    required this.title,
    required this.desc,
    required this.image,
    required this.regularPrice,
    required this.price,
    required this.stock,
    required this.unit,
    required this.sku,
    required this.createdAt,
  });

  @JsonKey(includeToJson: false)
  final int id;

  @JsonKey(defaultValue: '')
  final String title;

  @JsonKey(defaultValue: '')
  final String desc;

  @JsonKey(defaultValue: '')
  final String image;

  @JsonKey(defaultValue: 0)
  final int regularPrice;

  @JsonKey(defaultValue: 0)
  final int price;

  @JsonKey(defaultValue: 0)
  final int stock;

  @JsonKey(defaultValue: '')
  final String unit;

  @JsonKey(defaultValue: '')
  final String sku;

  final DateTime createdAt;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  List<Object> get props => [
        id,
        title,
        desc,
        image,
        regularPrice,
        price,
        stock,
        unit,
        sku,
        createdAt,
      ];
}
