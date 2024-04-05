import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:garmoniya_pharm/presentation/cart_page/bloc/cart_bloc.dart';
import 'package:garmoniya_pharm/presentation/home_page/bloc/home_bloc.dart';
import 'package:garmoniya_pharm/presentation/home_page/pages/filter_page.dart';
import 'package:garmoniya_pharm/utils/main_service.dart';
import 'package:garmoniya_pharm/utils/notifications.dart';
import 'package:garmoniya_pharm/utils/shared_prefs.dart';
import 'package:garmoniya_pharm/utils/size_utils.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../domain/models/item.dart';
import '../../utils/router/route_utils.dart';
import '../login_page/bloc/auth_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double minHeightOfSheet = 0;
  List<Item> items = [];
  List<Map<String, dynamic>> checksErrors = [];
  bool _isChecks = false;
  bool _isLoad = false;
  bool _isEmpty = false;
  bool _isError = false;
  String _errorMessage = "";

  bool paymentType = false;
  double totalVal = 0;
  double totalCount = 0;
  double totalCountFree = 0;
  Map<String, dynamic> paymentData = {
    "comment": "",
    "type_payment": "cash",
  };

  @override
  void initState() {
    super.initState();
    print("Cart: ${SharedPrefs().cartCount}");
    print("Items:  ${SharedPrefs().itemsCount}");
    var body = MainService.getDefaultBody();

    bool statusSync = MainService.checkHowManyDaysHavePassed_cart();
    if ((SharedPrefs().cartCount != SharedPrefs().itemsCount || statusSync) &&
        body['username'] != 'test') {
      Provider.of<CartBloc>(context, listen: false)
          .add(const CartEvent.getCartEvent());
    } else {
      Provider.of<CartBloc>(context, listen: false)
          .add(const CartEvent.getCartLocalEvent());
    }
    paymentData['type_payment'] = "transfer";
    paymentType = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  _showRefuseList() {
    Provider.of<HomeBloc>(context, listen: false)
        .add(const HomeEvent.getRefusal());
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child:
                    BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const Center(child: Text("Лист отказа пуст")),
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    ),
                    refusal: (refusalList, refusalList_search) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                                child: ListView.builder(
                                    itemCount: refusalList.length,
                                    itemBuilder: (ctx, i) {
                                      Item item = refusalList[i];
                                      return RefuseItem(item: item);
                                    }))
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            );
          });
        });
  }

  _showSetPayment() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                paymentData['type_payment'] = "transfer";
                                paymentType = true;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 5),
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: mainColor),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!.transfer,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        initialValue: paymentData['comment'],
                        onChanged: (e) {
                          setState(() {
                            paymentData['comment'] = e;
                          });
                        },
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            focusColor: Colors.grey,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey)),
                            hintText: AppLocalizations.of(context)!.comment,
                            border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey))),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => mainColor)),
                          onPressed: () {
                            Provider.of<CartBloc>(context, listen: false)
                                .add(CartEvent.setChecks(data: paymentData));
                            Provider.of<HomeBloc>(context, listen: false)
                                .add(const HomeEvent.clearFilter());
                            Navigator.pop(context);
                          },
                          child: Text(AppLocalizations.of(context)!.set_order)),
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
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        state.maybeWhen(
            errorState: (e) {
              setState(() {
                _isError = true;
                _errorMessage = e;
                _isLoad = false;
              });
            },
            orElse: () {},
            logout: () {
              Provider.of<AuthBloc>(context, listen: false)
                  .add(const AuthEvent.logout(data: {}));
            },
            emptyCartState: (sended) {
              setState(() {
                _isEmpty = true;
              });
              if (sended) {
                showAlert(context, AppLocalizations.of(context)!.success_order,
                    AlertType.success);
                Provider.of<HomeBloc>(context, listen: false)
                    .add(const HomeEvent.clearAllCount());
              }
            },
            loading: () {
              setState(() {
                _isLoad = true;
                _isEmpty = false;
              });
            },
            updatedCartState: (cart, total, amount, free) {
              setState(() {
                _isLoad = false;
                _isEmpty = false;
                items = cart;
                totalVal = total;
                totalCount = amount;
                totalCountFree = free;
              });
            },
            updateErrors: (errors) {
              // if (errors[0]['status'] != null) {
              setState(() {
                _isLoad = false;
                _isEmpty = false;
                checksErrors = errors;
                minHeightOfSheet = errors.isNotEmpty ? 700 : 0;
              });
              // } else {
              //   showAlert(context, errors[0][SharedPrefs().locale],
              //       AlertType.warning);
              //   setState(() {
              //     _isLoad = false;
              //     _isEmpty = false;
              //     checksErrors = [];
              //     minHeightOfSheet = 0;
              //   });
              // }
            });
      },
      child: _isError
          ? Center(
              child: Text(_errorMessage),
            )
          : Scaffold(
              body: SafeArea(
                child: SlidingUpPanel(
                  borderRadius: BorderRadius.circular(5),
                  minHeight: minHeightOfSheet,
                  color: Colors.white,
                  isDraggable: false,
                  maxHeight: 700,
                  panel: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 30),
                        height: MediaQuery.of(context).size.height - 100,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                child: checksErrors.isEmpty
                                    ? const SizedBox()
                                    : SingleChildScrollView(
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              100,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Expanded(
                                                  child: ListView.builder(
                                                      physics: ScrollPhysics(),
                                                      itemCount:
                                                          checksErrors.length,
                                                      itemBuilder: (ctx, i) {
                                                        final Map<String,
                                                                dynamic>
                                                            message =
                                                            checksErrors[i];

                                                        // if (message['status'] !=
                                                        //     null) {
                                                        var status =
                                                            message['status'] ??
                                                                "";
                                                        return checkItem(
                                                            status: status,
                                                            message: message);
                                                        // } else {
                                                        //   return Container(
                                                        //     margin:
                                                        //         const EdgeInsets
                                                        //             .all(6),
                                                        //     padding:
                                                        //         const EdgeInsets
                                                        //             .symmetric(
                                                        //             horizontal:
                                                        //                 10,
                                                        //             vertical:
                                                        //                 10),
                                                        //     decoration:
                                                        //         BoxDecoration(
                                                        //             border:
                                                        //                 Border
                                                        //                     .all(
                                                        //               width: 1,
                                                        //             ),
                                                        //             borderRadius:
                                                        //                 BorderRadius.circular(
                                                        //                     5)),
                                                        //     child: Text(message[
                                                        //         SharedPrefs()
                                                        //             .locale]),
                                                        //   );
                                                        // }
                                                      }))
                                            ],
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: _isChecks || minHeightOfSheet == 700
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      minHeightOfSheet = 30;
                                      _isChecks = false;
                                    });
                                  },
                                  icon: const Icon(Icons.close))
                              : SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            minHeightOfSheet = 700;
                                            _isChecks = true;
                                          });
                                        },
                                        icon: const Icon(
                                            Icons.keyboard_double_arrow_up)),
                                  ),
                                ))
                    ],
                  ),
                  body: RefreshIndicator(
                    color: mainColor,
                    onRefresh: () async {
                      Provider.of<CartBloc>(context, listen: false)
                          .add(const CartEvent.getCartEvent());
                    },
                    child: Padding(
                      padding: getPadding(top: 5, left: 5, right: 5, bottom: 5),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: mainColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.shopping_bag_outlined,
                                        color: Colors.white, size: 15),
                                    Text(
                                      totalCount.toString() + " шт",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Text(MainService.getNormalFormatPrice(totalVal),
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          _isLoad
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: mainColor,
                                  ),
                                )
                              : SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.6,
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: ListView.builder(
                                              itemCount: items.length,
                                              itemBuilder: (ctx, i) {
                                                Item item = items[i];
                                                return cartItem(item: item);
                                              })),
                                    ],
                                  ),
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 2 -
                                    20),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => items.isEmpty
                                                    ? Colors.grey
                                                    : mainColor)),
                                    onPressed:
                                        items.isEmpty ? null : _showSetPayment,
                                    child: Text(
                                      AppLocalizations.of(context)!.set_order,
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 2 -
                                    20),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.orange)),
                                    onPressed: _showRefuseList,
                                    child: Text(AppLocalizations.of(context)!
                                        .refuse_list)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

class RefuseItem extends StatefulWidget {
  const RefuseItem({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  State<RefuseItem> createState() => _RefuseItemState();
}

class _RefuseItemState extends State<RefuseItem> {
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
    text = widget.item.currentCount.toString();
    text_free = widget.item.currentCount_free.toString();
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
                    maxHeight: 600,
                    maxWidth: MediaQuery.of(context).size.width),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        child: Center(
                            child: Text(
                          '${price.name}',
                          maxLines: 1,
                        )),
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            border: Border(
                          top:
                              BorderSide(width: 1, color: Colors.grey.shade300),
                          bottom:
                              BorderSide(width: 1, color: Colors.grey.shade300),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Center(
                            //     child: Text(
                            //   'Остаток: ${price.remainder.toString()}',
                            // )),
                            Text(
                                '📦 ${AppLocalizations.of(context)!.count_pack}к: ${price.quantiry_per_pack.toString()} шт'),
                          ],
                        ),
                      ),

                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
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

                                Provider.of<HomeBloc>(context, listen: false)
                                    .add(HomeEvent.changeCurrentCountRefuse(
                                        widget.item, "ALL", int.parse(text)));

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
                                      AppLocalizations.of(context)!.cancel,
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showSimpleModalDialog(context, widget.item, 0, "");
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: Text(
                    widget.item.name,
                    maxLines: 1,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                Container(
                  child: Text(
                    widget.item.currentCount.toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}

class cartItem extends StatefulWidget {
  const cartItem({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  State<cartItem> createState() => _cartItemState();
}

class _cartItemState extends State<cartItem> {
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
    text = widget.item.currentCount.toString();
    text_free = widget.item.currentCount_free.toString();
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
                  padding: const EdgeInsets.all(12.0),
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
                              price.fabricator,
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
                            // Center(
                            //     child: Text(
                            //   'Остаток: ${price.remainder.toString()}',
                            // )),
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
                      Container(
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

                                if (text == "0") {
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.changeCurrentCount(
                                          product,
                                          "ALL",
                                          0,
                                          int.parse(text_free.toString())));
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(HomeEvent.changeCurrentCountSearch(
                                          product, "ALL", 0));
                                  Provider.of<CartBloc>(context, listen: false)
                                      .add(CartEvent.removeFromCartEvent(
                                          cartItem: product));
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
                                              cartItem: widget.item,
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
                                      AppLocalizations.of(context)!.cancel,
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
  Widget build(BuildContext context) {
    text = widget.item.currentCount.toString();
    text_free = widget.item.currentCount_free.toString();
    _controller.text = widget.item.currentCount <= 0
        ? ""
        : widget.item.currentCount.toString();
    return InkWell(
      onTap: () {
        _showSimpleModalDialog(context, widget.item, 0, "");
      },
      child: Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              Provider.of<CartBloc>(context, listen: false)
                  .add(CartEvent.removeFromCartEvent(cartItem: widget.item));
              Provider.of<HomeBloc>(context, listen: false)
                  .add(HomeEvent.changeCurrentCount(widget.item, "ALL", 0, 0));
              Provider.of<HomeBloc>(context, listen: false).add(
                  HomeEvent.changeCurrentCountSearch(widget.item, "ALL", 0));
              Provider.of<HomeBloc>(context, listen: false).add(
                  HomeEvent.changeCurrentCountFilter(widget.item, "ALL", 0, 0));
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: AppLocalizations.of(context)!.delete,
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  widget.item.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${widget.item.currentCount} шт"),
                  Text(
                      "${NumberFormat.decimalPattern('ru-Ru').format(widget.item.price)}"),
                  Text(
                      "${NumberFormat.decimalPattern('ru-Ru').format(widget.item.currentCount * widget.item.price)}")
                ],
              ),
              Divider(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class checkItem extends StatefulWidget {
  const checkItem({
    super.key,
    required this.status,
    required this.message,
  });

  final String status;
  final Map<String, dynamic> message;

  @override
  State<checkItem> createState() => _checkItemState();
}

class _checkItemState extends State<checkItem> {
  bool _show = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.message['to_body']);
        if (widget.message['to_body'] != null) {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return FilterPage(
                type: 'promotion',
                group: widget.message['group'],
                request: widget.message['quantity_free'] ?? 0,
                toBody: widget.message['to_body']);
          }));
        }
        // if (widget.status == 'load') {
        //   // context.pushNamed(AppRoutes.filter.toName, extra: {
        //   //   "type": 'load',
        //   //   "group": widget.message['group'],
        //   // });
        //   Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        //     return FilterPage(
        //         type: 'load',
        //         group: widget.message['group'],
        //         request: widget.message['amount'] ?? 0,
        //         toBody: widget.message['to_body']);
        //   }));
        //   // Navigator.pop(context);
        // } else if (widget.status == 'promotion') {
        //   Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        //     return FilterPage(
        //         type: 'promotion',
        //         group: widget.message['group'],
        //         request: widget.message['quantity_free'] ?? 0,
        //         toBody: widget.message['to_body']);
        //   }));
        //   // Navigator.pop(context);
        // }
      },
      child: Container(
          margin: const EdgeInsets.all(6),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.redAccent),
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Container(
              //       width: MediaQuery.of(context).size.width - 100,
              //       child: widget.status == ''
              //           ? Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   AppLocalizations.of(context)!.remainder,
              //                   style: TextStyle(
              //                       color: Colors.orangeAccent,
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 15),
              //                 ),

              //                 SizedBox(
              //                   width: MediaQuery.of(context).size.width - 190,
              //                   child: Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Text(
              //                           "${AppLocalizations.of(context)!.order_request}: ${widget.message['quantity_total']}"),
              //                       Text(
              //                           "${AppLocalizations.of(context)!.remainder}: ${widget.message['remainder']}"),
              //                     ],
              //                   ),
              //                 ),

              //                 // widget.message['quantity_free'] != 0
              //                 //     ? Text(
              //                 //         "Акция: ${widget.message['quantity_free']}")
              //                 //     : SizedBox()
              //               ],
              //             )
              //           : SizedBox(),
              //     ),
              //     IconButton(
              //         onPressed: () {
              //           setState(() {
              //             _show = !_show;
              //           });
              //         },
              //         icon: Icon(
              //           _show ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              //           color: widget.status == 'balance'
              //               ? Colors.orange
              //               : widget.status == 'not_free' ||
              //                       widget.status == 'promotion'
              //                   ? Colors.green
              //                   : widget.status == 'load'
              //                       ? Colors.red
              //                       : Colors.green,
              //         ))
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Внимание",
                    style: TextStyle(
                        color: Colors.redAccent, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _show = !_show;
                        });
                      },
                      icon: Icon(
                        _show ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                        color: Colors.redAccent,
                      ))
                ],
              ),
              _show
                  ? Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(widget.message['ru']),
                    )
                  : SizedBox()
            ],
          )),
    );
  }
}
