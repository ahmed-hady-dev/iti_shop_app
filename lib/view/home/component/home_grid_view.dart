import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import 'product_card.dart';
import '../controller/shop_cubit.dart';
import '../model/product_model.dart';

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
                                color: AppColors.purple),
                          ),
                          onPressed: () {
                            cubit.selectedCategory = category.toString();
                            cubit.changeCategory(
                                category: cubit.selectedCategory);
                          },
                          backgroundColor: Colors.grey[200],
                          shape: const StadiumBorder(
                              side: BorderSide(
                                  width: 1, color: AppColors.purple)),
                        ),
                      ))
                  .toList()),
        ),
        const SizedBox(height: 8),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 0.62
                    : 0.61,
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
                price: selectedList[index].price,
              );
            },
          ),
        ),
      ],
    );
  }
}
