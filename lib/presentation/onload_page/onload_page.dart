import 'package:flutter/material.dart';
// import 'package:new_version/new_version.dart';
import 'package:garmoniya_pharm/presentation/cart_page/bloc/cart_bloc.dart';
import 'package:garmoniya_pharm/presentation/news_page/bloc/news_bloc.dart';
import 'package:garmoniya_pharm/presentation/orders_page/bloc/orders_bloc.dart';
import 'package:provider/provider.dart';

import '../../utils/size_utils.dart';
import '../home_page/bloc/home_bloc.dart';
import '../login_page/bloc/auth_bloc.dart';

class OnLoadPage extends StatefulWidget {
  const OnLoadPage({Key? key}) : super(key: key);

  @override
  State<OnLoadPage> createState() => _OnLoadPageState();
}

class _OnLoadPageState extends State<OnLoadPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthBloc>(context, listen: false)
        .add(const AuthEvent.checkAuth());
    // Provider.of<HomeBloc>(context, listen: false)
    //     .add(const HomeEvent.getProductsOffset(0));
    // Provider.of<HomeBloc>(context, listen: false)
    //     .add(const HomeEvent.getRefusal());
    // Provider.of<CartBloc>(context, listen: false)
    //     .add(const CartEvent.getCartEvent());
    // Provider.of<OrdersBloc>(context, listen: false)
    //     .add(const OrdersEvent.getOrders());
    // Provider.of<NewsBloc>(context, listen: false)
    //     .add(const NewsEvent.getNews());
    // Provider.of<HomeBloc>(context, listen: false)
    //     .add(const HomeEvent.getProducts());
  }

  // void _checkVersion() async {
  //   final newVersion = NewVersion(androidId: 'com.venons.pharmlux');
  //   final status = await newVersion.getVersionStatus();
  //   if (status!.canUpdate) {
  //     newVersion.showUpdateDialog(
  //         context: context,
  //         versionStatus: status,
  //         dialogTitle: 'Обновить приложение',
  //         dismissButtonText: 'Позже',
  //         dialogText:
  //             "Доступно новая версия приложения, пожалуйста обновите приложение",
  //         dismissAction: () {
  //           Navigator.of(context, rootNavigator: true).pop();
  //         },
  //         updateButtonText: "Обновить");
  //   }
  //   print("Device version: " + status.localVersion);
  //   print("Store version: " + status.storeVersion);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: width,
          height: height,
          padding: getPadding(all: 30),
          child: Image.asset(
            "assets/images/logo.png",
            height: 200,
          ),
        ),
      ),
    );
  }
}
