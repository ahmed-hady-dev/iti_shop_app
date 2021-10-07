import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:iti_shop_app/core/router/router.dart';
import 'package:iti_shop_app/view/cart/cart_view.dart';
import 'package:iti_shop_app/view/favorites/favorites_view.dart';
import 'package:iti_shop_app/view/home/component/home_grid_view.dart';
import 'package:iti_shop_app/view/home/controller/shop_cubit.dart';

import 'controller/shop_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()
        ..getData()
        ..getCategories(),
      lazy: false,
      child: SafeArea(
        child: BlocBuilder<ShopCubit, ShopState>(
          builder: (context, state) {
            final cubit = ShopCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Padding(padding: EdgeInsets.all(4.0), child: FlutterLogo()),
                    Text('Shop'),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.favorite_rounded),
                    onPressed: () => MagicRouter.navigateTo(
                      BlocProvider.value(
                        value: cubit,
                        child: const FavoritesView(),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => MagicRouter.navigateTo(BlocProvider.value(
                      value: cubit,
                      child: const CartView(),
                    )),
                    icon: Stack(
                      children: [
                        const Icon(Icons.shopping_cart),
                        Positioned(
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              cubit.count.toString(),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              body: Conditional.single(
                context: context,
                conditionBuilder: (context) => state is GetProductDataLoading,
                widgetBuilder: (context) => const Center(
                    child: CupertinoActivityIndicator(
                        radius: 16.0, animating: true)),
                fallbackBuilder: (context) => RefreshIndicator(
                    onRefresh: () => cubit.getData(),
                    child: HomeGridView(cubit: cubit)),
              ),
            );
          },
        ),
      ),
    );
  }
}
