import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iti_shop_app/constants/end_points.dart';
import 'package:iti_shop_app/core/dioHelper/dio_helper.dart';
import 'package:iti_shop_app/view/home/model/cart_entry.dart';
import 'package:iti_shop_app/view/home/model/product_model.dart';
import 'package:meta/meta.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());
  static ShopCubit get(context) => BlocProvider.of(context);
//===============================================================
  List<ProductModel>? products;
  List<int> ids = [];
  var entries = <int, CartEntry>{};
  //===============================================================

  Future<void> getData() async {
    emit(GetProductDataLoading());
    final response = await DioHelper.getData(url: PRODUCTS);
    try {
      products = (response.data as List<dynamic>)
          .map((value) => ProductModel.fromJson(value))
          .toList();
      emit(GetProductDataSuccess());
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
    }
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
