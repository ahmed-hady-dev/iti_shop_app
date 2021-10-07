import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import '../../constants/app_colors.dart';
import '../../core/router/router.dart';
import '../cart/cart_view.dart';
import '../favorites/favorites_view.dart';
import 'component/home_grid_view.dart';
import 'controller/shop_cubit.dart';
import '../settings_view.dart';

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
                  children: [
                    Image.asset(
                      "assets/images/purple_void_logo_icon.png",
                      fit: BoxFit.cover,
                      height: 40,
                    ),
                    const Text('ITI Shop App',
                        style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            height: 2))
                  ],
                ),
                actions: [
                  IconButton(
                      onPressed: () => MagicRouter.navigateTo(
                            BlocProvider.value(
                              value: cubit,
                              child: const SettingsView(),
                            ),
                          ),
                      icon: const Icon(Icons.settings_rounded)),
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
                        const Icon(Icons.shopping_cart_rounded),
                        Positioned(
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.red,
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
                  ),
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
