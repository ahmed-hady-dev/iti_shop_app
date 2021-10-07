import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key, required this.image}) : super(key: key);
final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 32.0),
      child: InteractiveViewer(child: Image.network(image)),
    );
  }
}
