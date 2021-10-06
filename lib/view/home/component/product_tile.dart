import 'package:flutter/material.dart';
import 'package:iti_shop_app/view/home/component/counter.dart';
import 'package:iti_shop_app/view/home/controller/shop_cubit.dart';
import 'package:iti_shop_app/view/home/model/cart_entry.dart';
import 'package:iti_shop_app/view/home/model/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final ShopCubit cubit;

  const ProductTile({Key? key, required this.product, required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title!),
      subtitle: Text(product.description!),
      leading: Image.network(product.image!),
      trailing: Counter(
          value: cubit.entries[product.id]?.quantity ?? 0,
          onUpdate: (count) =>
              cubit.update(CartEntry(id: product.id, quantity: count))),
    );
  }
}
