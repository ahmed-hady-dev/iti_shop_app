import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_shop_app/constants/token.dart';
import 'package:iti_shop_app/core/cacheHelper/cache_helper.dart';
import 'package:iti_shop_app/view/home/controller/shop_cubit.dart';

import 'controller/shop_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  Text(token!),
                  ElevatedButton(
                      onPressed: () {
                        CacheHelper.removeData(key: 'token');
                      },
                      child: const Text('Log out', style: TextStyle())),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
