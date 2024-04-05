import 'package:flutter/material.dart';

import '../../../domain/models/item.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text(
        item.fabricator,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(item.remainder.toString()),
        ],
      ),
    );
  }
}
