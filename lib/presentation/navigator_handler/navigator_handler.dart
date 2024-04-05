import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garmoniya_pharm/domain/models/user.dart';
import 'package:go_router/go_router.dart';
import 'package:garmoniya_pharm/bloc/connectivity_bloc.dart';
import 'package:garmoniya_pharm/data/local/hive_local.dart';
import 'package:garmoniya_pharm/presentation/login_page/bloc/auth_bloc.dart';
import 'package:garmoniya_pharm/presentation/news_page/news_page.dart';
import 'package:garmoniya_pharm/utils/router/navigator_keys.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../utils/dialog_state.dart';
import '../../data/config/colors.dart';
import '../cart_page/cart_page.dart';
import '../home_page/home_page.dart';
import '../orders_page/orders_page.dart';
import '../profle_page/profile_page.dart';
import '../widgets/disconnect_dialog.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  ScaffoldWithBottomNavBar({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  State<ScaffoldWithBottomNavBar> createState() => _ScaffoldNState();
}

class _ScaffoldNState extends State<ScaffoldWithBottomNavBar> {
  int currentTab = 4;
  HiveLocal _hiveLocal = HiveLocal();
  String? _type_user;
  User? _currentUser;
  @override
  void initState() {
    super.initState();
    _type_user = _hiveLocal.getUserFromDb()?.type_user;
    _currentUser = _hiveLocal.getUserFromDb();
  }

  int _locationToTabIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/orders')) {
      return 1;
    }
    if (location.startsWith('/news')) {
      return 2;
    }
    if (location.startsWith('/cart')) {
      return 3;
    }
    if (location.startsWith('/profile')) {
      return 4;
    }
    return 4;
  }

  void _onItemTapped(BuildContext context, int tabIndex) {
    if (HiveLocal().getUserFromDb() == null) {
      // GoRouter.of(context).go('/login');
      Provider.of<AuthBloc>(context, listen: false)
          .add(AuthEvent.logoutLocal());
    }
    switch (tabIndex) {
      case 0:
        if (_type_user == 'provider') {
          GoRouter.of(context).go('/profile');
        } else {
          GoRouter.of(context).go('/home');
        }
        break;
      case 1:
        if (_type_user == 'client') {
          GoRouter.of(context).go('/orders');
        }
        break;
      case 2:
        if (_type_user == 'client') {
          GoRouter.of(context).go('/news');
        }
        break;
      case 3:
        if (_type_user == 'client') {
          GoRouter.of(context).go('/cart');
        }
        break;
      case 4:
        if (_type_user == 'client') {
          GoRouter.of(context).go('/profile');
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
              orElse: () {},
              authorized: (user, contacts) {
                if (user?.type_user == 'provider') {
                  setState(() {
                    _type_user = "provider";
                  });
                } else {
                  setState(() {
                    _type_user = "client";
                  });
                }
              });
        },
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: textColorBar,
        iconSize: 25,

        selectedItemColor: mainColor,
        backgroundColor: Colors.white,
        currentIndex: _locationToTabIndex(context),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppLocalizations.of(context)!.main,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: AppLocalizations.of(context)!.orders,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: AppLocalizations.of(context)!.news,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: AppLocalizations.of(context)!.cart,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
        onTap: (index) => _onItemTapped(context, index),
        // onTap: (index) => setState(() {
        //   currentTab = index;
        // }),
      ),
    );
  }
}
