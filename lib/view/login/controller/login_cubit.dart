import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iti_shop_app/constants/end_points.dart';
import 'package:iti_shop_app/constants/token.dart';
import 'package:iti_shop_app/core/cacheHelper/cache_helper.dart';
import 'package:iti_shop_app/core/dioHelper/dio_helper.dart';
import 'package:iti_shop_app/view/login/model/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
//===============================================================
  LoginModel? loginModel;
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//===============================================================
  void userLogin({
    required String username,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final response = await DioHelper.postData(url: LOGIN, data: {
      'username': username,
      'password': password,
    });
    try {
      loginModel = LoginModel.fromJson(response.data);
      if (loginModel!.token != null || loginModel!.token != '') {
        token = loginModel!.token.toString();
        CacheHelper.saveData(key: 'token', value: loginModel!.token.toString());
        emit(LoginSuccessState(loginModel: loginModel!));
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      debugPrint(e.toString());
      emit(LoginLErrorState(error: e.toString()));
    }
  }

//===============================================================
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());
  }
}
