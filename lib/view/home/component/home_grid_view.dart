import 'package:flutter/material.dart';
import 'package:iti_shop_app/view/home/component/counter.dart';
import 'package:iti_shop_app/view/home/controller/shop_cubit.dart';
import 'package:iti_shop_app/view/home/model/cart_entry.dart';
import 'package:iti_shop_app/view/home/model/product_model.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({Key? key, required this.productList}) : super(key: key);
  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300, childAspectRatio: 0.6),
        children: List.generate(productList.length, (index) {
          final cubit = ShopCubit.get(context);
          return Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Stack(
                  children: [
                    Image.network(productList[index].image.toString(),
                        fit: BoxFit.cover),
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: Material(
                        color: Colors.transparent,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () => cubit.changeFavorites(
                                  productId: productList[index].id),
                              icon: cubit.ids.contains(productList[index].id)
                                  ? const Icon(Icons.favorite,
                                      color: Colors.red)
                                  : const Icon(Icons.favorite_border)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(productList[index].title.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headline6),
                        Text(productList[index].description.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.caption),
                      ])),
              Flexible(child: Container()),
              Counter(
                  value:
                      cubit.entries[cubit.products![index].id]?.quantity ?? 0,
                  onUpdate: (count) => cubit.update(CartEntry(
                      id: cubit.products![index].id, quantity: count))),
            ],
          );
        }));
  }
}
