import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../constants/end_points.dart';
import '../../../core/dioHelper/dio_helper.dart';
import '../model/cart_entry.dart';
import '../model/product_model.dart';
import 'package:meta/meta.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  static ShopCubit get(context) => BlocProvider.of(context);

//===============================================================
  List<ProductModel> productsList = [];
  List<ProductModel> categoriesList = [];
  String selectedCategory = 'all';
  List<int> ids = [];
  List<dynamic> categories = ['all'];
  var entries = <int, CartEntry>{};

//===============================================================

  Future<void> getData() async {
    emit(GetProductDataLoading());
    final homeResponse = await DioHelper.getData(url: PRODUCTS);
    try {
      productsList = (homeResponse.data as List<dynamic>)
          .map((value) => ProductModel.fromJson(value))
          .toList();
      emit(GetProductDataSuccess());
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
    }
  }

//===============================================================

  Future<void> getCategories() async {
    emit(GetProductDataLoading());
    final categoriesResponse = await DioHelper.getData(url: CATEGORIES);
    try {
      categories.addAll(categoriesResponse.data);
      emit(GetProductDataSuccess());
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
    }
  }
//===============================================================

  changeCategory({required String category}) {
    categoriesList =
        productsList.where((element) => element.category == category).toList();
    emit(ChangeCategoryState());
  }

//===============================================================
  changeFavorites({required int? productId}) {
    var index = ids.indexOf(productId!);
    if (index == -1) {
      ids.add(productId);
    } else {
      ids.removeAt(index);
    }
    emit(ChangeFavoritesState());
  }

//===============================================================
  void update(CartEntry entry) {
    if (entry.quantity <= 0) {
      entries.remove(entry.id);
      emit(ChangeEntryState());
      return;
    }
    entries[entry.id!] = entry;
    emit(ChangeEntryState());
  }

  void clear() {
    entries = {};
    emit(ChangeEntryState());
  }

  int get count {
    return entries.values
        .map((entry) => entry.quantity)
        .fold<int>(0, (a, b) => a + b);
  }
}
