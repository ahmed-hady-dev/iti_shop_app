import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';

class RatingAndCountRow extends StatelessWidget {
  const RatingAndCountRow({Key? key, required this.rate, required this.count})
      : super(key: key);
  final String rate;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                    text: 'Rating : ',
                    style: TextStyle(fontSize: 16.0, color: AppColors.purple)),
                TextSpan(
                  text: rate,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: AppColors.red),
                ),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                    text: 'Count : ',
                    style: TextStyle(fontSize: 16.0, color: AppColors.purple)),
                TextSpan(
                  text: count,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: AppColors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
