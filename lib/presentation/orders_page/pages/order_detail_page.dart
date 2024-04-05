import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:garmoniya_pharm/domain/models/order.dart';
import 'package:garmoniya_pharm/presentation/orders_page/bloc/orders_bloc.dart';
import 'package:garmoniya_pharm/presentation/orders_page/widgets/order_detail_order.dart';
import 'package:garmoniya_pharm/presentation/orders_page/widgets/order_detail_with_spec.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key, required this.order}) : super(key: key);
  final order;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(builder: (context, state) {
      return state.maybeWhen(
        orElse: () => Center(
          child: CircularProgressIndicator(),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (e) => Center(
          child: Text(e),
        ),
        getOrder: (items, sale, data) {
          return sale != null
              ? OrderDetailWithSpec(
                  items: items, sale: sale, data: data, order_uuid: order.uuid)
              : OrderDetailOrder(
                  items: items, data: data, order_uuid: order.uuid);
        },
      );
    });
  }
}
