import 'package:cached_network_image/cached_network_image.dart';
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
        title: Text('Elevate Shop'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetProductsLeading) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is GetProductsSuccess) {
            final products = state.products;

            return GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7, // لتناسب المحتوى بشكل أفضل
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 11,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 1.2, // لجعل الصورة مربعة تقريبًا
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: CachedNetworkImage(
                                  imageUrl: product.image ??
                                      'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
                                  // width: 190,
                                  // height: 170,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 4.0,
                              right: 4.0,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey.withOpacity(0.7),
                                radius: 14.0,
                                child: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                product.title,
                                style: const TextStyle(fontSize: 12.0),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4.0),
                              Row(
                                children: [
                                  Text(
                                    'EGP ${product.price.toStringAsFixed(0)}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  // const SizedBox(width: 4.0),
                                  // if (product.price != null)
                                  //   Text(
                                  //     '${product.oldPrice?.toStringAsFixed(0)} EGP',
                                  //     style: const TextStyle(
                                  //       decoration: TextDecoration.lineThrough,
                                  //       color: Colors.grey,
                                  //       fontSize: 12.0,
                                  //     ),
                                  //   ),
                                ],
                              ),
                              //     const SizedBox(height: 4.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('Review (${product.rating.rate})'),
                                      const Icon(Icons.star,
                                          color: Colors.amber, size: 16.0),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 16.0,
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 18.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              //  const Spacer(), // لدفع زر الإضافة إلى الأسفل
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is GetProductsError) {
            return Center(
              child: Text('Something rong !!'),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
