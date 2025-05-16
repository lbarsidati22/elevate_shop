import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_shop/features/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleWidgetItem extends StatelessWidget {
  final ProductModel products;

  const ArticleWidgetItem({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    // final favoriteActionsCubit = BlocProvider.of<FavoriteActionsCubit>(context);
    // final parsedDate =
    //     DateTime.parse(article.publishedAt ?? DateTime.now().toString());
    // final publishedDate = DateFormat.yMMMEd().format(parsedDate);
    return InkWell(
      // onTap: () {
      //   Navigator.of(context).pushNamed(
      //     AppRoutes.articleDetails,
      //     arguments: article,
      //   );
      // },
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: products.image ??
                      'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
                  width: 190,
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products.title ?? '',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  products.title ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(
                  height: 8,
                ),
                // Text(
                //   publishedDate,
                //   style: Theme.of(context).textTheme.titleSmall!.copyWith(
                //         color: AppColors.grey,
                //       ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
