import 'package:flutter/material.dart';
import 'package:iti_shop_app/view/home/component/counter.dart';
import 'package:iti_shop_app/view/home/controller/shop_cubit.dart';
import 'package:iti_shop_app/view/home/model/cart_entry.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({Key? key, required this.cubit}) : super(key: key);
  final ShopCubit cubit;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cubit.products!.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(cubit.products![index].title.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold)),
          leading: SizedBox(
              height: 80.0,
              width: 80.0,
              child: Image.network(
                cubit.products![index].image.toString(),
                fit: BoxFit.contain,
              )),
          subtitle: Text(cubit.products![index].description.toString(),
              style: const TextStyle(fontWeight: FontWeight.normal)),
          trailing: Counter(
              value: cubit.entries[cubit.products![index].id]?.quantity ?? 0,
              onUpdate: (count) => cubit.update(
                  CartEntry(id: cubit.products![index].id, quantity: count))),
        );
      },
    );
  }
}
