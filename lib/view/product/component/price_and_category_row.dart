import 'package:flutter/material.dart';
import 'package:iti_shop_app/constants/app_colors.dart';

class PriceAndCategoryRow extends StatelessWidget {
  const PriceAndCategoryRow(
      {Key? key, required this.price, required this.category})
      : super(key: key);
  final String price;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                    text: 'Price ',
                    style: TextStyle(fontSize: 22.0, color: Colors.blueGrey)),
                TextSpan(
                  text: "$price EGP",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                    text: 'Category :',
                    style: TextStyle(fontSize: 12.0, color: AppColors.red)),
                TextSpan(
                  text: category,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: AppColors.blue),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
