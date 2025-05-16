import 'dart:developer';

import 'package:elevate_shop/features/home/model/product_model.dart';
import 'package:elevate_shop/features/home/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final apiServices = ApiServices();
  List<ProductModel> products = [];
  Future<void> getProducts() async {
    emit(GetProductsLeading());
    try {
      final result = await apiServices.getData('/products');
      for (var product in result.data) {
        products.add(ProductModel.fromMap(product));
        //  ProductModel.fromMap(product);
      }
      debugPrint('result is ${result.data}');
      emit(GetProductsSuccess(products));
    } catch (e) {
      debugPrint(e.toString());
      emit(GetProductsError());
    }
  }
}
