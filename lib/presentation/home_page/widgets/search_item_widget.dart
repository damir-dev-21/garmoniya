import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:intl/intl.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:garmoniya_pharm/presentation/cart_page/bloc/cart_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../utils/router/route_utils.dart';
import '../../../domain/models/item.dart';
import '../bloc/home_bloc.dart';

class SearchItemWidget extends StatefulWidget {
  const SearchItemWidget({
    Key? key,
    required this.product,
    required this.isRefuse,
    required this.isFilter,
  }) : super(key: key);
  final Item product;
  final bool isRefuse;
  final bool isFilter;
  @override
  State<SearchItemWidget> createState() => _SearchItemWidgetState();
}

class _SearchItemWidgetState extends State<SearchItemWidget> {
  final TextEditingController _controller = TextEditingController();
  String text = '0';
  String text_free = '0';
  bool _isFree = false;
  bool zeroVisible = false;
  double total = 0;
  double globTotal = 0;
  bool color = false;
  @override
  void initState() {
    super.initState();
    text = widget.product.currentCount.toString();
    text_free = widget.product.currentCount_free.toString();
  }

  void calculating(btnTxt, setState, product, type) {
    var price = product.price.toStringAsFixed(3);
    var amount = product.remainder;
    // var count = product.count;
    print(amount);
    setState(() {
      if (text == '-') {
        text = text.substring(0);
      }
      if (text_free == "-") {
        text_free = text_free.substring(0);
      }

      if (btnTxt is Icon && !_isFree) {
        String t = text.substring(0, text.lastIndexOf(text[text.length - 1]));
        text = t;
        total = t.length >= 1 ? double.parse(t) : 0;

        if (text.length == 0) {
          text = '0';
          zeroVisible = false;
        }

        print('G:${text.length}');
        print(amount.toString().length);
      } else if (btnTxt is Icon && _isFree) {
        String t = text_free.substring(
            0, text_free.lastIndexOf(text_free[text_free.length - 1]));
        text_free = t;
        total = t.length >= 1 ? double.parse(t) : 0;

        if (text_free.length == 0) {
          text_free = '0';
          zeroVisible = false;
        }

        print('G:${text_free.length}');
        print(amount.toString().length);
      } else {
        // if (text.contains('-')) {
        //   text = text.substring(0, text.lastIndexOf('-'));
        // }
        // if (text_free.contains('-')) {
        //   text_free = text_free.substring(0, text_free.lastIndexOf('-'));
        // }

        if (text[0] == '0') {
          text = text.substring(0, text.lastIndexOf('0'));
        }

        if (_isFree && text_free[0] == '0') {
          text_free = text_free.substring(0, text_free.lastIndexOf('0'));
        }

        print(text);
        print(amount);
        zeroVisible = true;
        if (_isFree) {
          text_free += btnTxt;
          total = double.parse(text_free) * double.parse(price);
        } else {
          text += btnTxt;
          total = double.parse(text) * double.parse(price);
        }

        globTotal += total;
      }
    });
  }

  void _showSimpleModalDialog(context, Item product, id, type) {
    var price = product;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: 620,
                    maxWidth: MediaQuery.of(context).size.width),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            border: Border(
                          top:
                              BorderSide(width: 1, color: Colors.grey.shade300),
                        )),
                        child: Column(
                          children: [
                            Center(
                                child: Text(
                              '${price.name}',
                              maxLines: 1,
                            )),
                            Text(
                              widget.product.fabricator,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            border: Border(
                          top:
                              BorderSide(width: 1, color: Colors.grey.shade300),
                          bottom:
                              BorderSide(width: 1, color: Colors.grey.shade300),
                        )),
                        child: Row(
                          mainAxisAlignment: price.type_load_main != ""
                              ? MainAxisAlignment.spaceBetween
                              : MainAxisAlignment.center,
                          children: [
                            price.type_load_main == 'load' ||
                                    price.type_load_main == 'promotion'
                                ? Center(
                                    child: Text(
                                    '${price.type_load_main == 'load' ? 'Нагрузка' : 'Акция'}: ${price.mark_load} ${price.type_load_main == 'load' ? '%' : ' 🤩'}',
                                  ))
                                : SizedBox(),
                            Text(
                                '📦 ${AppLocalizations.of(context)!.count_pack}: ${price.quantiry_per_pack.toString()} шт'),
                          ],
                        ),
                      ),
                      widget.isRefuse
                          ? SizedBox()
                          : Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Colors.grey.shade300),
                              )),
                              child: Center(
                                child: Text(
                                    '${AppLocalizations.of(context)!.price}: ${NumberFormat.decimalPattern('ru-Ru').format(price.price)}'),
                              )),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print(price.type_load);
                                print(price.type_load_main);
                                setState(() {
                                  _isFree = false;
                                });
                              },
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  height: 80,
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration:
                                      BoxDecoration(color: Colors.blueGrey),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text(
                                            text == '-' ? '$text' : '$text',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ])),
                            ),
                            // product.permission_free
                            //     ? GestureDetector(
                            //         onTap: () {
                            //           setState(() {
                            //             _isFree = true;
                            //           });
                            //         },
                            //         child: Container(
                            //           width: MediaQuery.of(context).size.width /
                            //               2.7,
                            //           height: 80,
                            //           margin: const EdgeInsets.only(top: 10),
                            //           decoration:
                            //               BoxDecoration(color: Colors.orange),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.center,
                            //             children: [
                            //               Padding(
                            //                 padding: const EdgeInsets.all(6.0),
                            //                 child: Text(
                            //                   text_free == '-'
                            //                       ? '$text_free'
                            //                       : '$text_free',
                            //                   textAlign: TextAlign.left,
                            //                   style: TextStyle(
                            //                     color: Colors.white,
                            //                     fontSize: 30,
                            //                   ),
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       )
                            //     : SizedBox(),
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 10),
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                calcbutton('1', Colors.grey.shade300,
                                    Colors.black, setState, price, type),
                                calcbutton('2', Colors.grey.shade300,
                                    Colors.black, setState, price, type),
                                calcbutton('3', Colors.grey.shade300,
                                    Colors.black, setState, price, type),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                calcbutton('4', Colors.grey.shade300,
                                    Colors.black, setState, price, type),
                                calcbutton('5', Colors.grey.shade300,
                                    Colors.black, setState, price, type),
                                calcbutton('6', Colors.grey.shade300,
                                    Colors.black, setState, price, type),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                calcbutton('7', Colors.grey.shade300,
                                    Colors.black, setState, price, type),
                                calcbutton('8', Colors.grey.shade300,
                                    Colors.black, setState, price, type),
                                calcbutton('9', Colors.grey.shade300,
                                    Colors.black, setState, price, type),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                calcbutton(null, Colors.grey.shade300,
                                    Colors.black, setState, price, type),
                                calcbutton('0', Colors.grey.shade300,
                                    Colors.black, setState, price, type),
                                calcbutton(
                                    Icon(Icons.backspace),
                                    Colors.grey.shade300,
                                    Colors.black,
                                    setState,
                                    price,
                                    type)
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   padding: EdgeInsets.symmetric(vertical: 5),
                      //   decoration: BoxDecoration(color: Colors.blueGrey),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'Остаток: ${product.count} шт',
                      //         style: TextStyle(
                      //             fontSize: 20, fontWeight: FontWeight.w500),
                      //       ),
                      //       Text(
                      //         'Итог: ',
                      //         style: TextStyle(
                      //             fontSize: 20, fontWeight: FontWeight.w500),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (text_free.isEmpty) {
                                  text_free = "0";
                                }
                                if (text.isEmpty) {
                                  text = "0";
                                }
                                if (widget.isRefuse) {
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.addToRefuse(
                                          item: widget.product));
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.changeCurrentCountRefuse(
                                          product,
                                          "ALL",
                                          int.parse(text.toString())));
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent
                                          .changeCurrentCountRefuse_search(
                                              product,
                                              "ALL",
                                              int.parse(text.toString())));
                                } else if (widget.isFilter) {
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.changeCurrentCountFilter(
                                          product,
                                          "ALL",
                                          int.parse(text.toString()),
                                          int.parse(text_free.toString())));

                                  Provider.of<CartBloc>(context, listen: false)
                                      .add(CartEvent.addToCartEvent(
                                          cartItem: product));
                                  Provider.of<CartBloc>(context, listen: false)
                                      .add(CartEvent
                                          .increaseAmountOfItemCartEvent(
                                              cartItem: widget.product,
                                              count: int.parse(text.toString()),
                                              count_free: int.parse(
                                                  text_free.toString())));
                                } else {
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.changeCurrentCount(
                                          product,
                                          "ALL",
                                          int.parse(text.toString()),
                                          int.parse(text_free.toString())));
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.changeCurrentCountSearch(
                                          product,
                                          "ALL",
                                          int.parse(text.toString())));

                                  Provider.of<CartBloc>(context, listen: false)
                                      .add(CartEvent.addToCartEvent(
                                          cartItem: product));
                                  Provider.of<CartBloc>(context, listen: false)
                                      .add(CartEvent
                                          .increaseAmountOfItemCartEvent(
                                              cartItem: widget.product,
                                              count: int.parse(text.toString()),
                                              count_free: int.parse(
                                                  text_free.toString())));
                                }

                                // setState(() {
                                //   text = '-';
                                // });

                                Navigator.of(context).pop(false);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                child: Center(
                                  child: Text(
                                      AppLocalizations.of(context)!.save,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   text = '-';
                                // });

                                if (widget.product.currentCount.toString() !=
                                    text.toString()) {
                                  if (widget.isRefuse) {
                                    Provider.of<HomeBloc>(context,
                                            listen: false)
                                        .add(HomeEvent.addToRefuse(
                                            item: widget.product));
                                    Provider.of<HomeBloc>(context,
                                            listen: false)
                                        .add(HomeEvent.changeCurrentCountRefuse(
                                            product,
                                            "ALL",
                                            int.parse(widget
                                                .product.currentCount
                                                .toString())));
                                    Provider.of<HomeBloc>(context,
                                            listen: false)
                                        .add(HomeEvent
                                            .changeCurrentCountRefuse_search(
                                                product,
                                                "ALL",
                                                int.parse(widget
                                                    .product.currentCount
                                                    .toString())));
                                  } else if (widget.isFilter) {
                                    Provider.of<HomeBloc>(context,
                                            listen: false)
                                        .add(HomeEvent.changeCurrentCountFilter(
                                            product,
                                            "ALL",
                                            int.parse(widget
                                                .product.currentCount
                                                .toString()),
                                            int.parse(text_free.toString())));

                                    Provider.of<CartBloc>(context,
                                            listen: false)
                                        .add(CartEvent.addToCartEvent(
                                            cartItem: product));
                                    Provider.of<CartBloc>(context,
                                            listen: false)
                                        .add(CartEvent
                                            .increaseAmountOfItemCartEvent(
                                                cartItem: widget.product,
                                                count: int.parse(widget
                                                    .product.currentCount
                                                    .toString()),
                                                count_free: int.parse(
                                                    text_free.toString())));
                                  } else {
                                    Provider.of<HomeBloc>(context,
                                            listen: false)
                                        .add(HomeEvent.changeCurrentCount(
                                            product,
                                            "ALL",
                                            int.parse(widget
                                                .product.currentCount
                                                .toString()),
                                            int.parse(text_free.toString())));
                                    Provider.of<HomeBloc>(context,
                                            listen: false)
                                        .add(HomeEvent.changeCurrentCountSearch(
                                            product, "ALL", 0));

                                    Provider.of<CartBloc>(context,
                                            listen: false)
                                        .add(CartEvent.addToCartEvent(
                                            cartItem: product));
                                    Provider.of<CartBloc>(context,
                                            listen: false)
                                        .add(CartEvent
                                            .increaseAmountOfItemCartEvent(
                                                cartItem: widget.product,
                                                count: int.parse(widget
                                                    .product.currentCount
                                                    .toString()),
                                                count_free: 0));
                                  }
                                  setState(() {
                                    text =
                                        widget.product.currentCount.toString();
                                  });
                                }

                                Navigator.of(context).pop(false);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: textColorLight,
                                    borderRadius: BorderRadius.circular(10.0)),
                                width: double.infinity,
                                height: 50,
                                padding: EdgeInsets.all(15),
                                child: Center(
                                  child: Text(
                                      AppLocalizations.of(context)!.cancel_btn,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  Widget calcbutton(
      dynamic btntxt, Color btncolor, Color txtcolor, setState, price, type) {
    return Container(
      child: btntxt is Icon
          ? GestureDetector(
              onTap: () {
                calculating(btntxt, setState, price, type);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: btncolor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: MediaQuery.of(context).size.width / 5,
                height: 50,
                child: IconButton(
                    onPressed: () {
                      calculating(btntxt, setState, price, type);
                    },
                    icon: Center(child: btntxt)),
              ),
            )
          : GestureDetector(
              onTap: () {
                if (btntxt == '0' && zeroVisible == false || btntxt == null) {
                  return null;
                } else {
                  calculating(btntxt, setState, price, type);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: btncolor, borderRadius: BorderRadius.circular(10.0)),
                width: MediaQuery.of(context).size.width / 5,
                height: 55,
                child: Center(
                  child: Text(
                    btntxt == null ? '' : '$btntxt',
                    style: TextStyle(
                      fontSize: 20,
                      color: txtcolor,
                    ),
                  ),
                ),
                padding: EdgeInsets.all(10),
              ),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    text = widget.product.currentCount.toString();
    text_free = widget.product.currentCount_free.toString();
    _controller.text = widget.product.currentCount <= 0
        ? ""
        : widget.product.currentCount.toString();
    return GestureDetector(
      onTap: () {
        _showSimpleModalDialog(context, widget.product, 0, "");
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              title: Text(
                widget.product.name,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.isRefuse
                          ? SizedBox()
                          : Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${AppLocalizations.of(context)!.price}" +
                                          ": " +
                                          NumberFormat.decimalPattern('ru-Ru')
                                              .format(widget.product.price),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    widget.product.discount_best
                                        ? Icon(
                                            Icons.star,
                                            color: Colors.orangeAccent,
                                            size: 13,
                                          )
                                        : SizedBox()
                                  ],
                                ),
                              ],
                            ),
                      widget.isRefuse
                          ? SizedBox()
                          : Text(
                              "${AppLocalizations.of(context)!.date_overdude}: " +
                                  widget.product.date_overdue.toString(),
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        widget.product.fabricator,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )
                    ]),
              ),
              trailing: SizedBox(
                width: 135,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HoldDetector(
                      onHold: () {
                        var currentText = widget.product.currentCount;

                        setState(() {
                          if (currentText >= 0 && (currentText - 1) >= 0) {
                            if (currentText != 0) {
                              _controller.text = (currentText - 1).toString();
                            }

                            if (widget.isRefuse) {
                              Provider.of<HomeBloc>(context, listen: false).add(
                                  HomeEvent.changeCurrentCountRefuse(
                                      widget.product, "DEC", 0));
                              Provider.of<HomeBloc>(context, listen: false).add(
                                  HomeEvent.changeCurrentCountRefuse_search(
                                      widget.product, "DEC", 0));
                            } else if (widget.isFilter) {
                              Provider.of<HomeBloc>(context, listen: false).add(
                                  HomeEvent.changeCurrentCountFilter(
                                      widget.product,
                                      "DEC",
                                      0,
                                      widget.product.currentCount_free));
                              Provider.of<CartBloc>(context, listen: false).add(
                                  CartEvent.addToCartEvent(
                                      cartItem: widget.product));
                              Provider.of<CartBloc>(context, listen: false).add(
                                  CartEvent.increaseAmountOfItemCartEvent(
                                      cartItem: widget.product,
                                      count: 0,
                                      count_free:
                                          widget.product.currentCount_free));
                            } else {
                              Provider.of<HomeBloc>(context, listen: false).add(
                                  HomeEvent.changeCurrentCountSearch(
                                      widget.product, "DEC", 0));
                              Provider.of<HomeBloc>(context, listen: false).add(
                                  HomeEvent.changeCurrentCount(
                                      widget.product,
                                      "DEC",
                                      0,
                                      widget.product.currentCount_free));
                              Provider.of<CartBloc>(context, listen: false).add(
                                  CartEvent.addToCartEvent(
                                      cartItem: widget.product));
                              Provider.of<CartBloc>(context, listen: false).add(
                                  CartEvent.decreaseAmountOfItemCartEvent(
                                      cartItem: widget.product,
                                      count: 0,
                                      count_free:
                                          widget.product.currentCount_free));
                            }
                          } else {
                            _controller.text = "";
                            if (widget.isRefuse) {
                              Provider.of<HomeBloc>(context, listen: false).add(
                                  HomeEvent.removeFromRefuse(
                                      item: widget.product));
                            } else if (widget.isFilter) {
                              Provider.of<HomeBloc>(context, listen: false).add(
                                  HomeEvent.changeCurrentCountFilter(
                                      widget.product,
                                      "ALL",
                                      0,
                                      widget.product.currentCount_free));
                              Provider.of<CartBloc>(context, listen: false).add(
                                  CartEvent.removeFromCartEvent(
                                      cartItem: widget.product));
                            } else {
                              Provider.of<HomeBloc>(context, listen: false).add(
                                  HomeEvent.changeCurrentCountSearch(
                                      widget.product, "ALL", 0));
                              Provider.of<HomeBloc>(context, listen: false).add(
                                  HomeEvent.changeCurrentCount(
                                      widget.product,
                                      "ALL",
                                      0,
                                      widget.product.currentCount_free));
                              Provider.of<CartBloc>(context, listen: false).add(
                                  CartEvent.removeFromCartEvent(
                                      cartItem: widget.product));
                            }
                          }
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 11),
                          decoration: BoxDecoration(
                              color: textColorLight,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Text(
                            "-",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 100,
                        child: TextField(
                            style: const TextStyle(fontSize: 15),
                            controller: _controller,
                            readOnly: true,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (e) {
                              var currentCount = int.parse(e);
                              if (int.parse(e) <= 0) {
                                if (widget.isRefuse) {
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.addToRefuse(
                                          item: widget.product));
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.changeCurrentCountRefuse(
                                          widget.product,
                                          "ALL",
                                          int.parse(text.toString())));

                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.removeFromRefuse(
                                          item: widget.product));
                                } else if (widget.isFilter) {
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.changeCurrentCountFilter(
                                          widget.product,
                                          "ALL",
                                          currentCount,
                                          widget.product.currentCount_free));
                                  Provider.of<CartBloc>(context, listen: false)
                                      .add(CartEvent.addToCartEvent(
                                          cartItem: widget.product));
                                  Provider.of<CartBloc>(context, listen: false)
                                      .add(CartEvent
                                          .increaseAmountOfItemCartEvent(
                                              cartItem: widget.product,
                                              count: currentCount,
                                              count_free: widget
                                                  .product.currentCount_free));
                                } else {
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.changeCurrentCountSearch(
                                          widget.product, "ALL", currentCount));
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.changeCurrentCount(
                                          widget.product,
                                          "ALL",
                                          currentCount,
                                          widget.product.currentCount_free));
                                  Provider.of<CartBloc>(context, listen: false)
                                      .add(CartEvent.addToCartEvent(
                                          cartItem: widget.product));
                                  Provider.of<CartBloc>(context, listen: false)
                                      .add(CartEvent
                                          .increaseAmountOfItemCartEvent(
                                              cartItem: widget.product,
                                              count: currentCount,
                                              count_free: widget
                                                  .product.currentCount_free));
                                }
                              } else {
                                if (widget.isRefuse) {
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.removeFromRefuse(
                                          item: widget.product));
                                } else if (widget.isFilter) {
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.changeCurrentCountFilter(
                                          widget.product,
                                          "ALL",
                                          0,
                                          widget.product.currentCount_free));
                                  Provider.of<CartBloc>(context, listen: false)
                                      .add(CartEvent.removeFromCartEvent(
                                          cartItem: widget.product));
                                } else {
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.changeCurrentCountSearch(
                                          widget.product, "ALL", 0));
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.changeCurrentCount(
                                          widget.product,
                                          "ALL",
                                          0,
                                          widget.product.currentCount_free));
                                  Provider.of<CartBloc>(context, listen: false)
                                      .add(CartEvent.removeFromCartEvent(
                                          cartItem: widget.product));
                                }

                                setState(() {});
                              }
                              _controller.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: _controller.text.length));
                              setState(() {});
                            },
                            onEditingComplete: () {
                              FocusScope.of(context).unfocus();
                            },
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center,
                                border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                enabledBorder: widget.product.currentCount == 0
                                    ? const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0.5))
                                    : const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                label: Center(
                                  child: Text(widget.product.currentCount == 0
                                      ? ' '
                                      : widget.product.currentCount.toString()),
                                ))),
                      ),
                    ),
                    HoldDetector(
                      onHold: () {
                        if (widget.isRefuse) {
                          if (widget.product.currentCount == 0) {
                            Provider.of<HomeBloc>(context, listen: false).add(
                                HomeEvent.addToRefuse(item: widget.product));
                          }

                          Provider.of<HomeBloc>(context, listen: false).add(
                              HomeEvent.changeCurrentCountRefuse(
                                  widget.product, "INC", 0));
                          Provider.of<HomeBloc>(context, listen: false).add(
                              HomeEvent.changeCurrentCountRefuse_search(
                                  widget.product, "INC", 0));
                        } else if (widget.isFilter) {
                          Provider.of<HomeBloc>(context, listen: false).add(
                              HomeEvent.changeCurrentCountFilter(widget.product,
                                  "INC", 0, widget.product.currentCount_free));
                          Provider.of<CartBloc>(context, listen: false).add(
                              CartEvent.addToCartEvent(
                                  cartItem: widget.product));
                          Provider.of<CartBloc>(context, listen: false).add(
                              CartEvent.increaseAmountOfItemCartEvent(
                                  cartItem: widget.product,
                                  count: 0,
                                  count_free:
                                      widget.product.currentCount_free));
                        } else {
                          Provider.of<HomeBloc>(context, listen: false).add(
                              HomeEvent.changeCurrentCountSearch(
                                  widget.product, "INC", 0));
                          Provider.of<HomeBloc>(context, listen: false).add(
                              HomeEvent.changeCurrentCount(widget.product,
                                  "INC", 0, widget.product.currentCount_free));
                          Provider.of<CartBloc>(context, listen: false).add(
                              CartEvent.addToCartEvent(
                                  cartItem: widget.product));
                          Provider.of<CartBloc>(context, listen: false).add(
                              CartEvent.increaseAmountOfItemCartEvent(
                                  cartItem: widget.product,
                                  count: 0,
                                  count_free:
                                      widget.product.currentCount_free));
                        }
                        var currentText = widget.product.currentCount + 1;
                        setState(() {
                          _controller.text = (currentText).toString();
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 11),
                          decoration: BoxDecoration(
                              color:
                                  // widget.type == 'additional'

                                  //     ? Theme.of(context).primaryColor
                                  //     :
                                  mainColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Text(
                            "+",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          widget.product.type_load_main == 'load'
              ? Positioned(
                  top: widget.product.type_load_main == 'load' &&
                          widget.product.type_load != 'load' &&
                          widget.product.type_load != 'promotion'
                      ? 10
                      : 30,
                  child: Icon(
                    Icons.transfer_within_a_station_sharp,
                    color: Colors.redAccent,
                    size: 13,
                  ))
              : const SizedBox(),
          widget.product.type_load == 'promotion' ||
                  widget.product.type_load_main == 'promotion'
              ? const Positioned(
                  top: 10,
                  child: Icon(
                    Icons.star,
                    color: Colors.lightBlue,
                    size: 13,
                  ))
              : const SizedBox(),
          widget.product.type_load == 'load'
              ? const Positioned(
                  top: 10,
                  child: Icon(
                    Icons.train,
                    color: Colors.red,
                    size: 13,
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}
