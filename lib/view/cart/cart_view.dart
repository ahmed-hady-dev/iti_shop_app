import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_shop_app/view/home/component/product_tile.dart';
import 'package:iti_shop_app/view/home/controller/shop_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          final cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: const Text('Cart'), actions: [
              IconButton(
                onPressed: cubit.count > 0 ? cubit.clear : null,
                icon: const Icon(Icons.delete),
              )
            ]),
            body: cubit.count > 0
                ? ListView(
                    children: cubit.entries.values
                        .map((entry) => ProductTile(
                            cubit: cubit,
                            product: cubit.products!.firstWhere(
                                (product) => product.id == entry.id)))
                        .toList(),
                  )
                : Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Cart is empty'),
                        ElevatedButton(
                            child: const Text('Add Products'),
                            onPressed: () => Navigator.of(context).maybePop()),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}