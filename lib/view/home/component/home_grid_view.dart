import 'package:flutter/material.dart';
import 'package:iti_shop_app/constants/app_colors.dart';
import 'package:iti_shop_app/view/home/component/product_card.dart';
import 'package:iti_shop_app/view/home/controller/shop_cubit.dart';
import 'package:iti_shop_app/view/home/model/product_model.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({Key? key, required this.cubit}) : super(key: key);
  final ShopCubit cubit;

  @override
  Widget build(BuildContext context) {
    List<ProductModel> selectedList = [];
    cubit.selectedCategory == 'all'
        ? selectedList = cubit.productsList
        : selectedList = cubit.categoriesList;
    return ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: cubit.categories
                  .map((category) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ActionChip(
                          elevation: 4.0,
                          padding: const EdgeInsets.all(2.0),
                          label: Text(
                            category.toString(),
                            style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blue),
                          ),
                          onPressed: () {
                            cubit.selectedCategory = category.toString();
                            cubit.changeCategory(
                                category: cubit.selectedCategory);
                          },
                          backgroundColor: Colors.grey[200],
                          shape: const StadiumBorder(
                              side:
                                  BorderSide(width: 1, color: AppColors.blue)),
                        ),
                      ))
                  .toList()),
        ),
        const SizedBox(height: 8),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.68,
            mainAxisSpacing: 20,
          ),
          children: List.generate(
            selectedList.length,
            (index) {
              return ProductCard(
                cubit: cubit,
                index: index,
                product: selectedList[index],
                image: selectedList[index].image.toString(),
                title: selectedList[index].title.toString(),
                description: selectedList[index].description.toString(),
                id: selectedList[index].id,
              );
            },
          ),
          // cubit.selectedCategory == 'all'
          //     ? List.generate(cubit.productsList.length, (index) {
          //         return ProductCard(
          //           cubit: cubit,
          //           index: index,
          //           product: cubit.productsList[index],
          //           image: cubit.productsList[index].image.toString(),
          //           title: cubit.productsList[index].title.toString(),
          //           description:
          //               cubit.productsList[index].description.toString(),
          //           id: cubit.productsList[index].id,
          //         );
          //       })
          //     : List.generate(
          //         cubit.categoriesList.length,
          //         (index) {
          //           return ProductCard(
          //             cubit: cubit,
          //             index: index,
          //             product: cubit.categoriesList[index],
          //             image: cubit.categoriesList[index].image.toString(),
          //             title: cubit.categoriesList[index].title.toString(),
          //             description:
          //                 cubit.categoriesList[index].description.toString(),
          //             id: cubit.categoriesList[index].id,
          //           );
          //         },
          //       ),
        ),
      ],
    );
  }
}
