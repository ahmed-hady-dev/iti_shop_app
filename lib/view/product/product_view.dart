import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_shop_app/view/home/controller/shop_cubit.dart';
import 'package:iti_shop_app/view/home/model/cart_entry.dart';
import 'package:iti_shop_app/view/home/model/product_model.dart';
import 'package:iti_shop_app/widgets/counter.dart';

import 'component/description_column.dart';
import 'component/price_and_category_row.dart';
import 'component/product_image.dart';
import 'component/rating_and_count_row.dart';
import 'component/title_text.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          final cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: ListView(
              shrinkWrap: true,
              children: [
                TitleText(text: product.title.toString()),
                ProductImage(image: product.image.toString()),
                Counter(
                    value: cubit.entries[product.id]?.quantity ?? 0,
                    onUpdate: (count) => cubit
                        .update(CartEntry(id: product.id, quantity: count))),
                const SizedBox(height: 8.0),
                PriceAndCategoryRow(
                    price: product.price.toString(),
                    category: product.category.toString()),
                const Divider(),
                RatingAndCountRow(
                  count: product.rating!.count.toString(),
                  rate: product.rating!.rate.toString(),
                ),
                const Divider(),
                DescriptionColumn(description: product.description.toString()),
              ],
            ),
          );
        },
      ),
    );
  }
}
