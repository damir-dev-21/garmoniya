import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:garmoniya_pharm/data/local/hive_local.dart';
import 'package:garmoniya_pharm/data/repository/cart_repository_impl.dart';
import 'package:garmoniya_pharm/data/repository/news_repository_impl.dart';
import 'package:garmoniya_pharm/data/repository/orders_repository_impl.dart';
import 'package:garmoniya_pharm/data/repository/price_repository_impl.dart';
import 'package:garmoniya_pharm/data/repository/report_repository_impl.dart';
import 'package:garmoniya_pharm/presentation/act_sverki_page/bloc/report_bloc.dart';
import 'package:garmoniya_pharm/presentation/cart_page/bloc/cart_bloc.dart';
import 'package:garmoniya_pharm/presentation/contacts_page/bloc/contacts_bloc.dart';
import 'package:garmoniya_pharm/presentation/home_page/bloc/home_bloc.dart';
import 'package:garmoniya_pharm/presentation/home_page/home_page.dart';
import 'package:garmoniya_pharm/presentation/navigator_handler/navigator_handler.dart';
import 'package:garmoniya_pharm/presentation/news_page/bloc/news_bloc.dart';
import 'package:garmoniya_pharm/presentation/orders_page/bloc/orders_bloc.dart';
import 'package:garmoniya_pharm/presentation/price_page/bloc/price_bloc.dart';
import 'package:garmoniya_pharm/presentation/profle_page/profile_page.dart';
import 'package:garmoniya_pharm/presentation/splash_page/splash_page.dart';
import 'package:garmoniya_pharm/utils/notifications_service.dart';
import 'package:garmoniya_pharm/utils/router/navigator_keys.dart';
import 'package:garmoniya_pharm/utils/router/route_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/connectivity_bloc.dart';
import '../data/local/remote/auth_remote.dart';
import '../data/repository/auth_repository_impl.dart';
import '../data/repository/product_repository_impl.dart';
import '../domain/classes/language_constants.dart';
import '../utils/dialog_state.dart';
import '../utils/router/app_router.dart';
import 'login_page/bloc/auth_bloc.dart';
import 'login_page/login_page.dart';
import 'network_disabled_page/netword_disabled_page.dart';
import 'onload_page/onload_page.dart';

class PharmLux extends StatefulWidget {
  PharmLux({Key? key}) : super(key: key);

  @override
  State<PharmLux> createState() => _PharmLuxState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _PharmLuxState? state = context.findAncestorStateOfType<_PharmLuxState>();
    state?.setLocale(newLocale);
  }
}

class _PharmLuxState extends State<PharmLux> {
  Locale? _locale;
  final AuthRepositoryImpl authRepository =
      AuthRepositoryImpl(AuthRemoteImpl());
  final ProductRepositoryImpl productRepositoryImpl = ProductRepositoryImpl();
  final PriceRepositoryImpl priceRepositoryImpl = PriceRepositoryImpl();
  final CartRepositoryImpl cartRepositoryImpl = CartRepositoryImpl();
  final OrdersRepositoryImpl ordersRepositoryImpl = OrdersRepositoryImpl();
  final NewsRepositoryImp newsRepositoryImpl = NewsRepositoryImp();
  final ReportRepositoryImpl reportRepositoryImpl = ReportRepositoryImpl();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      NotificationService().initNotification(context);
    });
  }

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => InternetBloc()..add(OnCheckConnection())),
        BlocProvider(create: (ctx) => AuthBloc(authRepository: authRepository)),
        BlocProvider(
            create: (ctx) =>
                PriceBloc(priceRepositoryImpl: priceRepositoryImpl)),
        BlocProvider(
            create: (ctx) =>
                ReportBloc(reportRepositoryImpl: reportRepositoryImpl)),
        BlocProvider(
            create: (ctx) => NewsBloc(newsRepositoryImpl: newsRepositoryImpl)),
        BlocProvider(
            create: (ctx) =>
                HomeBloc(productRepositoryImpl: productRepositoryImpl)),
        BlocProvider(
            create: (ctx) => CartBloc(cartRepositoryImpl: cartRepositoryImpl)),
        BlocProvider(
            create: (ctx) =>
                OrdersBloc(ordersRepositoryImpl: ordersRepositoryImpl)),
        BlocProvider(create: (ctx) => ContactsBloc()),
      ],
      child: MultiProvider(
        providers: [
          Provider<AppRouter>(create: (_) => AppRouter()),
        ],
        child: Builder(builder: (context) {
          return MaterialApp(
              // navigatorKey: NavigatorKeys.homeNavigatorKey,
              color: Colors.white,
              title: 'Garmoniya Farm',
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: _locale,
              home: BlocBuilder<AuthBloc, AuthState>(builder: (ctx, state) {
                return state.maybeWhen(
                    unauthorized: (e) => LoginPage(),
                    orElse: () => const LoadingWidget(),
                    authorized: (user, contacts) {
                      if (DialogState().isOpen(ctx)) {
                        Navigator.pop(ctx);
                      }
                      return Router.withConfig(
                        config: Provider.of<AppRouter>(ctx).router,
                      );
                    });
              }));
        }),
      ),
    );
  }
}
