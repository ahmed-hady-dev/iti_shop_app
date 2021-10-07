import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({
    Key? key,
    this.totalPrice = '0.00',
  }) : super(key: key);

  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.purple.withOpacity(0.25),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: AppColors.purple),
      ),
      child: Row(
        children: [
          const Text('Total price : ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
          Text('$totalPrice EGP',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: AppColors.red)),
        ],
      ),
    );
  }
}
