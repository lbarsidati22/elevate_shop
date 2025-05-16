import 'package:elevate_shop/features/home/model/product_model.dart';
import 'package:elevate_shop/features/home/views/widgets/products_widget_item.dart';
import 'package:flutter/material.dart';

class RecommendedItemWidget extends StatelessWidget {
  final List<ProductModel> products;
  const RecommendedItemWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 10,
        );
      },
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ArticleWidgetItem(
          products: product,
        );
      },
    );
  }
}
