part of 'shop_cubit.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}

class GetProductDataLoading extends ShopState {}

class GetProductDataSuccess extends ShopState {}

class GetProductDataError extends ShopState {}

//===============================================================
class ChangeFavoritesState extends ShopState {}

//===============================================================
class ChangeEntryState extends ShopState {}
//===============================================================
