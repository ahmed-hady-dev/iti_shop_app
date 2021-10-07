import 'package:flutter/material.dart';

class CartEmptyColumn extends StatelessWidget {
  const CartEmptyColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Cart is empty',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
              child: const Text('Add Products',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              onPressed: () => Navigator.of(context).maybePop()),
        ],
      ),
    );
  }
}
