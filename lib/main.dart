import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_shop_app/constants/token.dart';
import 'package:iti_shop_app/view/home/controller/shop_cubit.dart';
import 'package:iti_shop_app/view/home/home_view.dart';
import 'package:iti_shop_app/view/login/login_view.dart';

import 'core/blocObserver/bloc_observer.dart';
import 'core/cacheHelper/cache_helper.dart';
import 'core/dioHelper/dio_helper.dart';
import 'core/router/router.dart';
import 'core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //===============================================================
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  //===============================================================
  await CacheHelper.init();
  //===============================================================
  token = CacheHelper.get(key: 'token') ?? '';
  late Widget startScreen;
  if (token == '' || token == null) {
    startScreen = const LoginView();
  } else {
    startScreen = const HomeView();
  }
  //===============================================================
  runApp(MyApp(
    startScreen: startScreen,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startScreen;
  const MyApp({
    Key? key,
    required this.startScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: MaterialApp(
        title: 'ITI Shop App',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        onGenerateRoute: onGenerateRoute,
        theme: lightTheme(context),
        home: startScreen,
      ),
    );
  }
}
