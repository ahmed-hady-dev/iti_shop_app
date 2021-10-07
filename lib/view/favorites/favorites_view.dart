import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import '../home/component/product_tile.dart';
import '../home/controller/shop_cubit.dart';

import 'component/no_items.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          final cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Favorites',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: Conditional.single(
              context: context,
              conditionBuilder: (context) => cubit.ids.isEmpty,
              widgetBuilder: (context) => const NoItems(),
              fallbackBuilder: (context) => ListView(
                shrinkWrap: true,
                children: cubit.ids.map((id) {
                  var product = cubit.productsList
                      .firstWhere((element) => element.id == id);
                  return ProductTile(product: product, cubit: cubit);
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
