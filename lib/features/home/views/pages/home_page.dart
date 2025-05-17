import 'package:elevate_shop/features/home/cubit/home_cubit.dart';
import 'package:elevate_shop/features/home/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Elevate Shop',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetProductsLeading) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is GetProductsSuccess) {
            final products = state.products;
            return ProductItem(products: products);
          } else if (state is GetProductsError) {
            return Center(
              child: Text('Check youe Network !!'),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
