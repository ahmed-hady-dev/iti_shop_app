import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:iti_shop_app/view/home/component/product_tile.dart';
import 'package:iti_shop_app/view/home/controller/shop_cubit.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          final cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: const Text('Favorites')),
            body: Conditional.single(
              context: context,
              conditionBuilder: (context) => cubit.ids.isEmpty,
              widgetBuilder: (context) => const Center(
                  child: Text('No favorite items, go and add some!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0))),
              fallbackBuilder: (context) => ListView(
                children: cubit.ids.map((id) {
                  var product =
                      cubit.products!.firstWhere((element) => element.id == id);
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
