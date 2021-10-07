import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_shop_app/core/router/router.dart';
import 'package:iti_shop_app/view/home/controller/shop_cubit.dart';
import 'package:iti_shop_app/view/home/model/cart_entry.dart';
import 'package:iti_shop_app/view/home/model/product_model.dart';
import 'package:iti_shop_app/view/product/product_view.dart';
import 'package:iti_shop_app/widgets/counter.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      required this.cubit,
      required this.index,
      required this.product,
      required this.image,
      required this.title,
      required this.description,
      required this.id})
      : super(key: key);
  final ShopCubit cubit;
  final int index;
  final ProductModel product;
  final String? image;
  final String? title;
  final String? description;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MagicRouter.navigateTo(BlocProvider.value(
        value: cubit,
        child: ProductView(product: product),
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  Image.network(image.toString(), fit: BoxFit.cover),
                  ConstrainedBox(
                    constraints: const BoxConstraints.expand(),
                    child: Material(
                      color: Colors.transparent,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () =>
                                cubit.changeFavorites(productId: id),
                            icon: cubit.ids.contains(id)
                                ? const Icon(Icons.favorite, color: Colors.red)
                                : const Icon(Icons.favorite_border)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(title.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline6),
                      Text(description.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.caption),
                    ])),
            Flexible(child: Container()),
            Counter(
                mainAxisSize: MainAxisSize.max,
                value: cubit.entries[id]?.quantity ?? 0,
                onUpdate: (count) =>
                    cubit.update(CartEntry(id: id, quantity: count))),
          ],
        ),
      ),
    );
  }
}
