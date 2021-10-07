import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home/component/product_tile.dart';
import '../home/controller/shop_cubit.dart';

import 'component/cart_empty_column.dart';
import 'component/price_container.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          final cubit = ShopCubit.get(context);
          final total = cubit.entries.values
              .map((entry) =>
                  cubit.productsList
                      .where((element) => element.id == entry.id!)
                      .first
                      .price!
                      .toDouble() *
                  entry.quantity)
              .toList();
          final totalPrice = total
              .fold(0, (previousValue, element) => previousValue = element)
              .toStringAsFixed(2);
          return Scaffold(
            appBar: AppBar(
                title: const Text(
                  'Cart',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: cubit.count > 0 ? cubit.clear : null,
                      icon: const Icon(Icons.delete))
                ]),
            body: cubit.count > 0
                ? Column(
                    children: [
                      ListView(shrinkWrap: true, children: [
                        PriceContainer(totalPrice: totalPrice),
                        ...cubit.entries.values
                            .map((entry) => ProductTile(
                                cubit: cubit,
                                product: cubit.productsList.firstWhere(
                                    (product) => product.id == entry.id)))
                            .toList()
                      ]),
                    ],
                  )
                : const CartEmptyColumn(),
          );
        },
      ),
    );
  }
}
