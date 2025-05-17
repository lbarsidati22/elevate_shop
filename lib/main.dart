import 'package:elevate_shop/core/theme/app_theme.dart';
import 'package:elevate_shop/core/functions/app_constants.dart';
import 'package:elevate_shop/features/home/cubit/home_cubit.dart';
import 'package:elevate_shop/features/home/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const ElevateShop());
}

class ElevateShop extends StatelessWidget {
  const ElevateShop({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: AppTheme.mainTheme,
        home: HomePage(),
      ),
    );
  }
}
