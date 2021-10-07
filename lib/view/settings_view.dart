import 'package:flutter/material.dart';
import '../constants/token.dart';
import '../core/cacheHelper/cache_helper.dart';
import '../core/router/router.dart';
import 'login/login_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: <Widget>[
              Row(
                children: [
                  const Text('Want to logout?',
                      style: TextStyle(fontSize: 22.0)),
                  TextButton(
                      onPressed: () {
                        CacheHelper.removeData(key: 'token');
                        token = '';
                        MagicRouter.navigateAndPopAll(const LoginView());
                      },
                      child: const Text('Log out',
                          style: TextStyle(fontSize: 22.0))),
                ],
              ),
              const Divider(),
              const SizedBox(height: 4.0),
              const Text(
                  'This App was developed for ITI Kafr El-Shiekh summer training 2021 by Ahmed Abd-Elhady under observation of Instructors : Eng Khaled Elnaser and Eng Ahmed Mokhtar',
                  style: TextStyle(fontSize: 22.0))
            ],
          ),
        ),
      ),
    );
  }
}
