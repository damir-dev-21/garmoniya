enum AppRoutes {
  // main
  home,
  orders,
  cart,
  profile,

  // detail
  product,
  order,
  notificationCategory,
  notificationDetail,

  // reports
  splash,
  reportCollation,
  reportCollationAct,
  reportDeficit,

  // auth
  login,
  reg,

  // other
  news,
  review,
  settings,
  networkDisabled,
  onload,
  filter
}

extension AppPageExtension on AppRoutes {
  String get toPath {
    switch (this) {
      // main
      case AppRoutes.home:
        return '/home';
      case AppRoutes.orders:
        return '/orders';
      case AppRoutes.cart:
        return '/cart';
      case AppRoutes.profile:
        return '/profile';

      // detail
      case AppRoutes.product:
        return '/product';
      case AppRoutes.order:
        return '/order';
      case AppRoutes.notificationDetail:
        return '/notification';
      case AppRoutes.notificationCategory:
        return '/notificationCategory';

      // reports
      case AppRoutes.splash:
        return '/splash';
      case AppRoutes.reportCollation:
        return '/collation';
      case AppRoutes.reportCollationAct:
        return '/collationDetail';
      case AppRoutes.reportDeficit:
        return '/deficit';

      // auth
      case AppRoutes.login:
        return '/login';
      case AppRoutes.reg:
        return '/reg';

      // other
      case AppRoutes.news:
        return '/news';
      case AppRoutes.review:
        return '/review';
      case AppRoutes.networkDisabled:
        return '/networkDisabled';
      case AppRoutes.onload:
        return '/onload';
      case AppRoutes.filter:
        return '/filter';

      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      // main
      case AppRoutes.home:
        return 'home';
      case AppRoutes.orders:
        return 'orders';
      case AppRoutes.cart:
        return 'cart';
      case AppRoutes.profile:
        return 'profile';

      // detail
      case AppRoutes.product:
        return 'product';
      case AppRoutes.order:
        return 'order';
      case AppRoutes.notificationDetail:
        return 'notification';
      case AppRoutes.notificationCategory:
        return 'notificationCategory';

      // reports
      case AppRoutes.splash:
        return 'splash';
      case AppRoutes.reportCollation:
        return 'collation';
      case AppRoutes.reportCollationAct:
        return 'collationDetail';
      case AppRoutes.reportDeficit:
        return 'deficit';

      // auth
      case AppRoutes.login:
        return 'login';
      case AppRoutes.reg:
        return 'reg';

      // other
      case AppRoutes.news:
        return 'news';
      case AppRoutes.review:
        return 'review';
      case AppRoutes.networkDisabled:
        return 'networkDisabled';
      case AppRoutes.onload:
        return 'onload';
      case AppRoutes.filter:
        return 'filter';

      default:
        return "home";
    }
  }
}
