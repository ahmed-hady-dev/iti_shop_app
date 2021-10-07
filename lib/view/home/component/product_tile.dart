import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../widgets/counter.dart';
import '../controller/shop_cubit.dart';
import '../model/cart_entry.dart';
import '../model/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final ShopCubit cubit;

  const ProductTile({Key? key, required this.product, required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        product.title!,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: Text(
        product.description!,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      isThreeLine: true,
      leading: Column(
        children: [
          Flexible(
            child: Container(
              width: 60.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(product.image!), fit: BoxFit.contain),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Text(product.price.toString(),
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 14.0, color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
      trailing: Counter(
          value: cubit.entries[product.id]?.quantity ?? 0,
          onUpdate: (count) =>
              cubit.update(CartEntry(id: product.id, quantity: count))),
    );
  }
}
