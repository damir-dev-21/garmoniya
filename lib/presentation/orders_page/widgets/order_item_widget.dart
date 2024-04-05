import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:garmoniya_pharm/presentation/orders_page/pages/order_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../domain/models/order.dart';
import '../bloc/orders_bloc.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({Key? key, required this.order, required this.status})
      : super(key: key);
  final Order order;
  final Map<String, dynamic> status;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Stack(
            children: [
              ListTile(
                onTap: () {
                  Provider.of<OrdersBloc>(context, listen: false)
                      .add(OrdersEvent.getOrder(widget.order.uuid));
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return OrderDetailPage(order: widget.order);
                  }));
                },
                contentPadding: const EdgeInsets.all(10),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        AppLocalizations.of(context)!.my_order_title +
                            " " +
                            widget.order.number.toString() +
                            " \n" +
                            widget.order.dateString,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    // GestureDetector(
                    //     onTap: () {
                    //       setState(() {
                    //         _expanded = !_expanded;
                    //       });
                    //     },
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         // context.router
                    //         //     .push(OrderDetailRoute(order: widget.order));
                    //       },
                    //       child: Row(
                    //         children: [
                    //           Text(
                    //             "Подробно",
                    //             style: const TextStyle(
                    //                 color: Colors.grey, fontSize: 12),
                    //           ),
                    //           Icon(
                    //             _expanded
                    //                 ? Icons.expand_less
                    //                 : Icons.expand_more,
                    //             color: Colors.black54,
                    //             size: 18,
                    //           ),
                    //         ],
                    //       ),
                    //     ))
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(AppLocalizations.of(context)!.summa +
                      " " +
                      NumberFormat.decimalPattern('ru-Ru')
                          .format(widget.order.amount)),
                ),
              ),
              Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                      onTap: () {
                        //cartProvider.deleteOrder(widget.order);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: HexColor(widget.status['color'])),
                        child: Text(
                          widget.status['title'],
                          style: TextStyle(
                              fontSize: 12, color: widget.status['textColor']),
                        ),
                      )))
            ],
          ),
        ],
      ),
    );
  }
}
