import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:garmoniya_pharm/presentation/orders_page/bloc/orders_bloc.dart';
import 'package:provider/provider.dart';

import '../../../data/config/colors.dart';

class OrderDetailOrder extends StatefulWidget {
  OrderDetailOrder(
      {Key? key,
      required this.items,
      required this.data,
      required this.order_uuid})
      : super(key: key);
  final items;
  final data;
  final order_uuid;
  @override
  State<OrderDetailOrder> createState() => _OrderDetailOrderState();
}

class _OrderDetailOrderState extends State<OrderDetailOrder> {
  _showMessage(func) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.sure,
                      style: TextStyle(fontSize: 19),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => mainColor)),
                          onPressed: () {
                            func();
                            Navigator.pop(context);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.yes,
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.redAccent)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.no,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Provider.of<OrdersBloc>(context, listen: false)
                    .add(const OrdersEvent.getOrders());
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
          backgroundColor: mainColor,
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.my_order_title +
              " " +
              widget.data['number'].toString()),
        ),
        floatingActionButton: widget.data['cancel']
            ? FloatingActionButton.extended(
                backgroundColor: Colors.redAccent,
                onPressed: () {
                  _showMessage(() {
                    Provider.of<OrdersBloc>(context, listen: false)
                        .add(OrdersEvent.rejectOrder(widget.order_uuid));
                  });
                },
                label: Text(AppLocalizations.of(context)!.cancel),
              )
            : SizedBox(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: widget.items.length,
                    itemBuilder: (ctx, i) {
                      Map<String, dynamic> item = widget.items[i];
                      return ListTile(
                        style: ListTileStyle.drawer,
                        title: Text(item['item']['name']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "${AppLocalizations.of(context)!.count}: ${item['quantity']} шт"),
                            item['quantity_free'] > 0
                                ? Text(
                                    "${AppLocalizations.of(context)!.free}: ${item['quantity_free']} шт")
                                : SizedBox(),
                          ],
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "${AppLocalizations.of(context)!.summa}: ${item['amount']}"),
                            item['amount_promotion'] > 0
                                ? Text(
                                    "${AppLocalizations.of(context)!.free}: ${item['amount_promotion']}")
                                : SizedBox(),
                          ],
                        ),
                      );
                    }))
          ],
        )));
  }
}
