import 'package:elevate_shop/features/home/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ElevateShop());
}

class ElevateShop extends StatelessWidget {
  const ElevateShop({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elevate Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
