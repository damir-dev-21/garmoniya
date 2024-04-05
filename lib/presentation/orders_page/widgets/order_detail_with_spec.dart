import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../data/config/colors.dart';
import '../bloc/orders_bloc.dart';

class OrderDetailWithSpec extends StatefulWidget {
  OrderDetailWithSpec(
      {Key? key,
      required this.items,
      required this.sale,
      required this.data,
      required this.order_uuid})
      : super(key: key);
  final items;
  final sale;
  final data;
  final order_uuid;
  @override
  State<OrderDetailWithSpec> createState() => _OrderDetailWithSpecState();
}

class _OrderDetailWithSpecState extends State<OrderDetailWithSpec> {
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Provider.of<OrdersBloc>(context, listen: false)
                      .add(OrdersEvent.getOrders());
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
            backgroundColor: mainColor,
            title: Text(AppLocalizations.of(context)!.my_order_title +
                " " +
                widget.data['number'].toString()),
            centerTitle: true,
            bottom: TabBar(
              padding: const EdgeInsets.all(0),
              tabs: [
                Tab(text: AppLocalizations.of(context)!.order),
                Tab(
                  text: AppLocalizations.of(context)!.order_sale,
                ),
              ],
              indicatorColor: Colors.white,
            ),
          ),
          endDrawer: Drawer(
            child: SafeArea(
              child: Column(
                children: [
                  Column(
                    children:
                        List.generate(widget.sale['files'].length, (index) {
                      return GestureDetector(
                        onTap: () async {
                          String base64_string =
                              widget.sale['files'][index]['file_base64'];
                          print(base64_string);
                          Uint8List bytes = base64.decode(base64_string);
                          final directory =
                              await getApplicationDocumentsDirectory();
                          String dir = directory!.path +
                              '/' +
                              "${AppLocalizations.of(context)!.order_sale} #${index + 1}" +
                              ".pdf";
                          File file = File(dir);
                          if (!file.existsSync()) file.create();
                          await file.writeAsBytes(bytes);
                          await OpenFile.open(file.path);
                        },
                        child: Container(
                            margin: const EdgeInsets.only(top: 15),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "${AppLocalizations.of(context)!.order_sale} #${index + 1}",
                              style: TextStyle(color: Colors.white),
                            )),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  widget.sale['access_confirmation']
                      ? ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.orangeAccent)),
                          onPressed: () {
                            _showMessage(() {
                              Provider.of<OrdersBloc>(context, listen: false)
                                  .add(OrdersEvent.confirmOrder(
                                      widget.order_uuid, widget.sale['uuid']));
                            });
                          },
                          child: Text(AppLocalizations.of(context)!.access))
                      : SizedBox(),
                  widget.sale['access_accepted']
                      ? ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.blueAccent.shade200)),
                          onPressed: () {
                            _showMessage(() {
                              Provider.of<OrdersBloc>(context, listen: false)
                                  .add(OrdersEvent.acceptOrder(
                                      widget.order_uuid, widget.sale['uuid']));
                            });
                          },
                          child: Text(AppLocalizations.of(context)!.receive))
                      : SizedBox(),
                  widget.data['cancel']
                      ? ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.redAccent)),
                          onPressed: () {
                            _showMessage(() {
                              Provider.of<OrdersBloc>(context, listen: false)
                                  .add(OrdersEvent.rejectOrder(
                                      widget.order_uuid));
                            });
                          },
                          child: Text(AppLocalizations.of(context)!.cancel))
                      : SizedBox()
                ],
              ),
            ),
          ),
          body: TabBarView(
              dragStartBehavior: DragStartBehavior.down,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Tab(text: AppLocalizations.of(context)!.order),
                Tab(
                  text: AppLocalizations.of(context)!.order_sale,
                ),
              ].map((Tab tab) {
                final String label = tab.text!;
                if (label == AppLocalizations.of(context)!.order) {
                  return SafeArea(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                  ));
                } else if (label == AppLocalizations.of(context)!.order_sale) {
                  return SafeArea(
                      child: Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: widget.sale['results'].length,
                              itemBuilder: (ctx, i) {
                                Map<String, dynamic> item =
                                    widget.sale['results'][i];
                                return ListTile(
                                  style: ListTileStyle.drawer,
                                  title: Text(item['item']['name']),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                  ));
                }
                return const SizedBox();
              }).toList())),
    );
  }
}
