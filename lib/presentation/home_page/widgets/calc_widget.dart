// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../data/config/colors.dart';
// import '../../../domain/models/item.dart';
// import '../bloc/home_bloc.dart';

// class CalcWidget extends StatefulWidget {
//   CalcWidget({Key? key}) : super(key: key);

//   @override
//   State<CalcWidget> createState() => _CalcWidgetState();
// }

// class _CalcWidgetState extends State<CalcWidget> {
//   String text = '-';
//   bool zeroVisible = false;
//   double total = 0;
//   double globTotal = 0;
//   bool color = false;
//   void calculating(btnTxt, setState, product, type) {
//     var price = product.price.toStringAsFixed(3);
//     var amount = product.remainder;
//     // var count = product.count;
//     print(amount);
//     setState(() {
//       if (text == '-') {
//         text = text.substring(0);
//       }

//       if (btnTxt is Icon) {
//         String t = text.substring(0, text.lastIndexOf(text[text.length - 1]));
//         text = t;
//         total = t.length >= 1 ? double.parse(t) : 0;

//         if (text.length == 0) {
//           text = '-';
//           zeroVisible = false;
//         }

//         print('G:${text.length}');
//         print(amount.toString().length);
//       } else {
//         if (text.contains('-')) {
//           text = text.substring(0, text.lastIndexOf('-'));
//         }

//         print(text);
//         print(amount);
//         zeroVisible = true;
//         text += btnTxt;
//         total = double.parse(text) * double.parse(price);
//         globTotal += total;
//         Provider.of<HomeBloc>(context, listen: false).add(
//             HomeEvent.changeCurrentCount(
//                 product, "ALL", int.parse(text.toString())));
//       }
//     });
//   }

//   void _showSimpleModalDialog(context, Item price, id, type) {
//     // var price = product;
//     showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (BuildContext context) {
//           return StatefulBuilder(builder: (context, StateSetter setState) {
//             return Dialog(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0)),
//               child: Container(
//                 constraints: BoxConstraints(
//                     maxHeight: 600,
//                     maxWidth: MediaQuery.of(context).size.width),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         decoration: BoxDecoration(
//                             border: Border(
//                           top:
//                               BorderSide(width: 1, color: Colors.grey.shade300),
//                         )),
//                         child: Center(
//                             child: Text(
//                           '${price.name}',
//                           maxLines: 1,
//                         )),
//                       ),
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         decoration: BoxDecoration(
//                             border: Border(
//                           top:
//                               BorderSide(width: 1, color: Colors.grey.shade300),
//                           bottom:
//                               BorderSide(width: 1, color: Colors.grey.shade300),
//                         )),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Center(
//                                 child: Text(
//                                     'Цена: ${price.price.toStringAsFixed(3).toString()}')),
//                             Center(
//                                 child: Text(
//                               'Остаток: ${price.remainder.toString()}',
//                             )),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         decoration: BoxDecoration(
//                             border: Border(
//                           bottom:
//                               BorderSide(width: 1, color: Colors.grey.shade300),
//                         )),
//                         child: Text(
//                             'Количество в упаковке: ${price.quantiry_per_pack.toString()} шт'),
//                       ),
//                       Container(
//                           height: 80,
//                           margin: const EdgeInsets.only(top: 10),
//                           decoration: BoxDecoration(color: Colors.blueGrey),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Padding(
//                                   padding: const EdgeInsets.all(6.0),
//                                   child: Text(
//                                     text == '-' ? '$text' : '$text шт',
//                                     textAlign: TextAlign.left,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 30,
//                                     ),
//                                   ),
//                                 )
//                               ])),
//                       Container(
//                         margin: const EdgeInsets.only(top: 15, bottom: 10),
//                         padding: const EdgeInsets.all(5),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 calcbutton('1', Colors.grey.shade300,
//                                     Colors.black, setState, price, type),
//                                 calcbutton('2', Colors.grey.shade300,
//                                     Colors.black, setState, price, type),
//                                 calcbutton('3', Colors.grey.shade300,
//                                     Colors.black, setState, price, type),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 calcbutton('4', Colors.grey.shade300,
//                                     Colors.black, setState, price, type),
//                                 calcbutton('5', Colors.grey.shade300,
//                                     Colors.black, setState, price, type),
//                                 calcbutton('6', Colors.grey.shade300,
//                                     Colors.black, setState, price, type),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 calcbutton('7', Colors.grey.shade300,
//                                     Colors.black, setState, price, type),
//                                 calcbutton('8', Colors.grey.shade300,
//                                     Colors.black, setState, price, type),
//                                 calcbutton('9', Colors.grey.shade300,
//                                     Colors.black, setState, price, type),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 calcbutton(null, Colors.grey.shade300,
//                                     Colors.black, setState, price, type),
//                                 calcbutton('0', Colors.grey.shade300,
//                                     Colors.black, setState, price, type),
//                                 calcbutton(
//                                     Icon(Icons.backspace),
//                                     Colors.grey.shade300,
//                                     Colors.black,
//                                     setState,
//                                     price,
//                                     type)
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       // Container(
//                       //   width: double.infinity,
//                       //   padding: EdgeInsets.symmetric(vertical: 5),
//                       //   decoration: BoxDecoration(color: Colors.blueGrey),
//                       //   child: Column(
//                       //     crossAxisAlignment: CrossAxisAlignment.center,
//                       //     mainAxisAlignment: MainAxisAlignment.start,
//                       //     children: [
//                       //       Text(
//                       //         'Остаток: ${product.count} шт',
//                       //         style: TextStyle(
//                       //             fontSize: 20, fontWeight: FontWeight.w500),
//                       //       ),
//                       //       Text(
//                       //         'Итог: ',
//                       //         style: TextStyle(
//                       //             fontSize: 20, fontWeight: FontWeight.w500),
//                       //       )
//                       //     ],
//                       //   ),
//                       // ),
//                       Container(
//                         margin: const EdgeInsets.symmetric(vertical: 5),
//                         child: Column(
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 // product.remainder = int.parse(text);
//                                 // context
//                                 //     .read<ProductProvider>()
//                                 //     .addCart(product);
//                                 setState(() {
//                                   text = '-';
//                                 });
//                                 Navigator.of(context).pop(false);
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: mainColor,
//                                     borderRadius: BorderRadius.circular(10.0)),
//                                 width: double.infinity,
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: 15, horizontal: 20),
//                                 child: Center(
//                                   child: Text('Сохранить',
//                                       style: TextStyle(
//                                           fontSize: 20, color: Colors.white)),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   text = '-';
//                                 });
//                                 Navigator.of(context).pop(false);
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: textColorLight,
//                                     borderRadius: BorderRadius.circular(10.0)),
//                                 width: double.infinity,
//                                 height: 50,
//                                 padding: EdgeInsets.all(15),
//                                 child: Center(
//                                   child: Text('Отмена',
//                                       style: TextStyle(
//                                           fontSize: 20, color: Colors.white)),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           });
//         });
//   }

//   Widget calcbutton(
//       dynamic btntxt, Color btncolor, Color txtcolor, setState, price, type) {
//     return Container(
//       child: btntxt is Icon
//           ? GestureDetector(
//               onTap: () {
//                 calculating(btntxt, setState, price, type);
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: btncolor,
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 width: MediaQuery.of(context).size.width / 5,
//                 height: 50,
//                 child: IconButton(
//                     onPressed: () {
//                       calculating(btntxt, setState, price, type);
//                     },
//                     icon: Center(child: btntxt)),
//               ),
//             )
//           : GestureDetector(
//               onTap: () {
//                 if (btntxt == '0' && zeroVisible == false || btntxt == null) {
//                   return null;
//                 } else {
//                   calculating(btntxt, setState, price, type);
//                 }
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: btncolor, borderRadius: BorderRadius.circular(10.0)),
//                 width: MediaQuery.of(context).size.width / 5,
//                 height: 55,
//                 child: Center(
//                   child: Text(
//                     btntxt == null ? '' : '$btntxt',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: txtcolor,
//                     ),
//                   ),
//                 ),
//                 padding: EdgeInsets.all(10),
//               ),
//             ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox();
//   }
// }
