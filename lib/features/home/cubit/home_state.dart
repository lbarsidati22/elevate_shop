part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetProductsLeading extends HomeState {}

final class GetProductsSuccess extends HomeState {
  final List<ProductModel> products;

  GetProductsSuccess(this.products);
}

final class GetProductsError extends HomeState {}
