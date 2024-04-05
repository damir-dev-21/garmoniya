import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import 'package:garmoniya_pharm/utils/shared_prefs.dart';

import '../../../../domain/models/item.dart';
import '../../../data/repository/product_repository_impl.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ProductRepositoryImpl productRepositoryImpl = ProductRepositoryImpl();
  HomeBloc({required this.productRepositoryImpl}) : super(const _Loading()) {
    on<HomeEvent>((events, emit) async {
      await events.map(
          // products
          getProducts: (_) async => _getProducts(emit),
          getAll: (_) async => _getAll(emit),
          getProductsOffset: (event) async => _getProductsOffset(event, emit),
          getProductsSearchOffset: (event) async =>
              _getProductsSearchOffset(event, emit),
          getProductsSearch: (event) async => _getProductsSearch(event, emit),
          changeCurrentCount: (event) async =>
              await _changeCurrentCount(event, emit),
          changeCurrentCountSearch: (event) async =>
              await _changeCurrentCount_search(event, emit),
          clearAll: (event) async => await _clearAll(event, emit),
          clearAllSearch: (event) async => await _clearAll_search(event, emit),
          // refuse list
          getRefusal: (_) async => await _getRefusal(emit),
          getRefuseListProductSearch: (event) async =>
              _getRefuseProductsSearch(event, emit),
          getProductsRefuseSearchOffset: (event) async =>
              _getProductsRefuseSearchOffset(event, emit),
          changeCurrentCountRefuse: (event) async =>
              await _changeCurrentCount_refuse(event, emit),
          changeCurrentCountRefuse_search: (event) async =>
              await _changeCurrentCount_refuse_search(event, emit),
          addToRefuse: (event) async => await _addToRefuse(event, emit),
          removeFromRefuse: (event) async =>
              await _removeFromRefuse(event, emit),
          sendRefuseList: (event) async => await _sendRefuseList(event, emit),
          // filter
          getFilterProducts: (event) async =>
              await _getFilterProducts(event, emit),
          getFilterOffset: (event) async =>
              _getFilterProductsOffset(event, emit),
          getFilterSearchOffset: (event) async =>
              _getFilterProductsSearchOffset(event, emit),
          getFilterSearch: (event) async =>
              _getFilterProductsSearch(event, emit),
          changeCurrentCountFilter: (event) async =>
              _changeCurrentCountFilter(event, emit),
          changeCurrentCountSearchFilter: (event) async =>
              _changeCurrentCountFilter_search(event, emit),
          clearFilter: (event) async => _clearFilterList(event, emit),
          clearAllCount: (event) async => _clearAllCount(event, emit),
          // certificates
          getCertificates: (event) async => _getCertificates(event, emit),
          getCertificate: (event) async => _getCertificate(event, emit));
    });
  }

  // products

  List<Item> local_products = [];
  List<Item> local_search_list = [];
  int _limit = 0;
  int _limitSearch = 0;
  int _totalCount = 0;

  _clearAll(_ClearAll event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());

    local_products.clear();
    local_search_list.clear();
    _limit = 0;
    _limitSearch = 0;
    final List<Item> newList;
    final List<Item> newList_search;
    newList = [...local_products];
    newList_search = [...local_search_list];
    emit(HomeState.products(newList, newList_search));
  }

  _clearAll_search(_ClearAllSearch event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());

    local_search_list.clear();
    _limitSearch = 0;
    final List<Item> newList_search;
    newList_search = [...local_search_list];
    emit(HomeState.products(local_products, newList_search));
  }

  _getProductsSearch(_GetProductsSearch event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    int newLimit = _limitSearch + event.limit;
    _limit = newLimit;
    Map<String, dynamic> products =
        await productRepositoryImpl.getProductsSearch(newLimit, event.text);
    if (products['status']) {
      // local_products = products['products'];
      local_search_list.clear();
      products['products'].forEach((e) {
        local_search_list.add(e);
        if (!local_products.contains(e)) {
          local_products.add(e);
        }
      });
      print(local_search_list.length);
      final List<Item> newList;
      final List<Item> newList_search;
      newList = [...local_products];
      newList_search = [...local_search_list];
      // _totalCalculate();
      emit(HomeState.products(newList, newList_search));
    } else if (!products['isAuth']) {
      emit(const HomeState.logout());
    } else {
      emit(HomeState.error(products['message']));
    }
  }

  _getProductsOffset(_GetProductsOffset event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    int newLimit = _limit + event.limit;
    _limit = newLimit;
    Map<String, dynamic> products =
        await productRepositoryImpl.getProductsOffset(newLimit);
    if (products['status']) {
      // local_products = products['products'];

      products['products'].forEach((e) {
        if (!local_products.contains(e)) {
          local_products.add(e);
        }
      });

      final List<Item> newList;
      final List<Item> newList_search;
      newList = [...local_products];
      newList_search = [...local_search_list];
      _totalCalculate();
      emit(HomeState.products(newList, newList_search));
    } else if (!products['isAuth']) {
      emit(const HomeState.logout());
    } else {
      emit(HomeState.error(products['message']));
    }
  }

  _getProductsSearchOffset(
      _GetProductsSearchOffset event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    int newLimit = _limit + event.limit;
    _limit = newLimit;
    Map<String, dynamic> products =
        await productRepositoryImpl.getProductsSearch(newLimit, event.text);
    if (products['status']) {
      // local_products = products['products'];

      products['products'].forEach((e) {
        if (!local_search_list.contains(e)) {
          local_search_list.add(e);
        }
        if (!local_products.contains(e)) {
          local_products.add(e);
        }
      });

      final List<Item> newList;
      final List<Item> newList_search;
      newList = [...local_products];
      newList_search = [...local_search_list];
      // _totalCalculate();
      emit(HomeState.products(newList, newList_search));
    } else if (!products['isAuth']) {
      emit(const HomeState.logout());
    } else {
      emit(HomeState.error(products['message']));
    }
  }

  _getProducts(Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    Map<String, dynamic> products = await productRepositoryImpl.getProducts();

    if (products['status']) {
      // local_products = products['products'];

      products['products'].forEach((e) {
        local_products.add(e);
      });

      final List<Item> newList;
      final List<Item> newList_search;
      newList = [...local_products];
      newList_search = [...local_search_list];
      _totalCalculate();
      emit(HomeState.products(newList, newList_search));
    } else if (!products['isAuth']) {
      emit(const HomeState.logout());
    } else {
      emit(HomeState.error(products['message']));
    }
  }

  _changeCurrentCount(_ChangeCount event, Emitter<HomeState> emit) async {
    final int currentAmount = local_products
        .firstWhere((cartItem) => cartItem.id == event.product.id)
        .currentCount;
    final Item _item =
        local_products.firstWhere((element) => element.id == event.product.id);
    final Item itemForIncrease = local_products
        .firstWhere((cartItem) => cartItem.id == event.product.id)
        .copyWith(
            currentCount: event.type == "INC"
                ? currentAmount + 1
                : event.type == 'DEC'
                    ? currentAmount - 1
                    : event.count,
            currentCount_free: event.count_free);
    local_products[local_products.indexOf(_item)] = itemForIncrease;
    final List<Item> newList;
    final List<Item> newList_search;
    newList = [...local_products];
    newList_search = [...local_search_list];
    _totalCalculate();
    emit(HomeState.products(newList, newList_search));
  }

  _changeCurrentCount_search(
      _ChangeCountSearch event, Emitter<HomeState> emit) async {
    // var local_search_list_copy = [...local_search_list];
    final int currentAmount = local_search_list
        .firstWhere((cartItem) => cartItem == event.product)
        .currentCount;
    final Item itemForIncrease = local_search_list
        .firstWhere((cartItem) => cartItem == event.product)
        .copyWith(
            currentCount: event.type == "INC"
                ? currentAmount + 1
                : event.type == 'DEC'
                    ? currentAmount - 1
                    : event.count);

    local_search_list[local_search_list.indexOf(event.product)] =
        itemForIncrease;
    local_search_list = [...local_search_list];
    final List<Item> newList_search;
    final List<Item> newList;
    newList_search = [...local_search_list];
    newList = [...local_products];
    _totalCalculate();
    emit(HomeState.products(newList, newList_search));
  }

  // refuse list
  List<Item> _refuse_list = [];
  List<Item> _refuse_list_search = [];
  int _limitRefuseSearch = 0;

  _getRefusal(Emitter<HomeState> emit) async {
    emit(HomeState.loading());
    Map<String, dynamic> products = await productRepositoryImpl.getRefusal();

    if (products['status']) {
      // local_products = products['products'];
      _refuse_list.clear();
      products['products'].forEach((e) {
        _refuse_list.add(e);
      });

      final List<Item> newList;
      newList = [..._refuse_list];
      emit(HomeState.refusal(newList, _refuse_list_search));
    } else if (!products['isAuth']) {
      emit(const HomeState.logout());
    } else {
      emit(HomeState.error(products['message']));
    }
  }

  _getRefuseProductsSearch(
      _GetRefuseListProductSearch event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    int newLimit = _limitRefuseSearch + event.limit;
    _limitRefuseSearch = newLimit;
    Map<String, dynamic> products = await productRepositoryImpl
        .getRefuseListProductsSearch(newLimit, event.text);
    if (products['status']) {
      // local_products = products['products'];
      _refuse_list_search.clear();
      products['products'].forEach((e) {
        // _refuse_list_search.add(e);
        if (!_refuse_list_search.contains(e)) {
          _refuse_list_search.add(e);
        }
      });

      final List<Item> newList;

      newList = [..._refuse_list_search];

      emit(HomeState.refusal(_refuse_list, newList));
    } else if (!products['isAuth']) {
      emit(const HomeState.logout());
    } else {
      emit(HomeState.error(products['message']));
    }
  }

  _getProductsRefuseSearchOffset(
      _GetProductsRefuseSearchOffset event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    int newLimit = _limit + event.limit;
    _limitRefuseSearch = newLimit;
    Map<String, dynamic> products = await productRepositoryImpl
        .getRefuseListProductsSearch(newLimit, event.text);
    if (products['status']) {
      // local_products = products['products'];

      products['products'].forEach((e) {
        if (!_refuse_list_search.contains(e)) {
          _refuse_list_search.add(e);
        }
      });

      final List<Item> newList;
      newList = [..._refuse_list_search];

      emit(HomeState.refusal(_refuse_list, newList));
    } else if (!products['isAuth']) {
      emit(const HomeState.logout());
    } else {
      emit(HomeState.error(products['message']));
    }
  }

  _changeCurrentCount_refuse(
      _ChangeCountRefuse event, Emitter<HomeState> emit) async {
    final int currentAmount = _refuse_list
        .firstWhere((cartItem) => cartItem == event.product)
        .currentCount;
    final Item itemForIncrease = _refuse_list
        .firstWhere((cartItem) => cartItem == event.product)
        .copyWith(
            currentCount: event.type == "INC"
                ? currentAmount + 1
                : event.type == 'DEC'
                    ? currentAmount - 1
                    : event.count);
    _refuse_list[_refuse_list.indexOf(event.product)] = itemForIncrease;

    final List<Item> newList;
    final List<Item> newList_search;
    newList = [..._refuse_list];
    newList_search = [..._refuse_list_search];

    add(HomeEvent.sendRefuseList(data: {
      "item_uuid": itemForIncrease.uuid,
      "quantity": itemForIncrease.currentCount
    }));
    emit(HomeState.refusal(newList, newList_search));
  }

  _changeCurrentCount_refuse_search(
      _ChangeCountRefuseSearch event, Emitter<HomeState> emit) async {
    final int currentAmount = _refuse_list_search
        .firstWhere((cartItem) => cartItem == event.product)
        .currentCount;
    final Item itemForIncrease = _refuse_list_search
        .firstWhere((cartItem) => cartItem == event.product)
        .copyWith(
            currentCount: event.type == "INC"
                ? currentAmount + 1
                : event.type == 'DEC'
                    ? currentAmount - 1
                    : event.count);
    _refuse_list_search[_refuse_list_search.indexOf(event.product)] =
        itemForIncrease;

    final List<Item> newList;
    final List<Item> newList_search;
    newList = [..._refuse_list];
    newList_search = [..._refuse_list_search];

    add(HomeEvent.sendRefuseList(data: {
      "item_uuid": itemForIncrease.uuid,
      "quantity": itemForIncrease.currentCount
    }));
    emit(HomeState.refusal(newList, newList_search));
  }

  _addToRefuse(_AddToRefuse event, Emitter<HomeState> emit) async {
    var findedItem =
        _refuse_list.firstWhereOrNull((element) => element == event.item);
    if (findedItem != null && _refuse_list.isNotEmpty) {
      return;
    }
    _refuse_list.add(event.item);
    final List<Item> newList;
    final List<Item> newList_search;
    newList = [..._refuse_list];
    newList_search = [..._refuse_list_search];
    emit(HomeState.refusal(newList, newList_search));
  }

  _removeFromRefuse(_RemoveFromRefuse event, Emitter<HomeState> emit) async {
    _refuse_list.remove(event.item);
    final List<Item> newList;
    if (_refuse_list.isNotEmpty) {
      newList = [..._refuse_list];
      emit(HomeState.refusal(newList, _refuse_list_search));
    }
  }

  _sendRefuseList(_SendRefuseList event, Emitter<HomeState> emit) async {
    Map<String, dynamic> responce =
        await productRepositoryImpl.sendRefuseList(event.data);
    if (responce['status']) {
      emit(HomeState.products(
        local_products,
        local_search_list,
      ));
      emit(HomeState.refusal(
        _refuse_list,
        _refuse_list_search,
      ));
    } else if (!responce['isAuth']) {
      emit(const HomeState.logout());
    } else {
      emit(HomeState.error(responce['message']));
    }
  }

  // filter
  List<Item> _filter_products = [];
  List<Item> _filter_search_list = [];
  int _filter_limit = 0;
  int _filter_limitSearch = 0;
  double _total_filter = 0;
  double _total_filter_free = 0;
  double _total_filter_count = 0;

  _getFilterProducts(_GetFilterProducts event, Emitter<HomeState> emit) async {
    emit(HomeState.loading());
    Map<String, dynamic> products =
        await productRepositoryImpl.getFilterProducts(event.data);

    if (products['status']) {
      // local_products = products['products'];

      products['products'].forEach((e) {
        _filter_products.add(e);
      });

      final List<Item> newList;
      final List<Item> newListSearch;

      newList = [..._filter_products];
      newListSearch = [..._filter_search_list];
      emit(HomeState.filter(newList, newListSearch, _total_filter,
          _total_filter_count, _total_filter_free));
    } else if (!products['isAuth']) {
      emit(const HomeState.logout());
    } else {
      emit(HomeState.error(products['message']));
    }
  }

  _clearFilterList(_ClearFilterProducts event, Emitter<HomeState> emit) async {
    _filter_products.clear();
    _filter_search_list.clear();
    _filter_limit = 0;
    _filter_limitSearch = 0;
    _total_filter = 0;
    _total_filter_count = 0;
    final List<Item> newList;
    final List<Item> newListSearch;

    newList = [..._filter_products];
    newListSearch = [..._filter_search_list];
    final total = _total_filter;
    final totalCount = _total_filter_count;
    final totalFree = _total_filter_free;
    emit(
        HomeState.filter(newList, newListSearch, total, totalCount, totalFree));
  }

  _getFilterProductsSearch(
      _GetFilterProductsSearch event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    int newLimit = _filter_limitSearch + event.limit;
    _filter_limitSearch = newLimit;
    Map<String, dynamic> products = await productRepositoryImpl
        .getFilterProductsSearch(newLimit, event.text, event.data);
    if (products['status']) {
      // local_products = products['products'];
      _filter_search_list.clear();
      products['products'].forEach((e) {
        _filter_search_list.add(e);
        if (!_filter_products.contains(e)) {
          _filter_products.add(e);
        }
      });

      final List<Item> newList;
      final List<Item> newList_search;
      newList = [..._filter_products];
      newList_search = [..._filter_search_list];
      _setTotalFilter();
      emit(HomeState.filter(newList, newList_search, _total_filter,
          _total_filter_count, _total_filter_free));
    } else if (!products['isAuth']) {
      emit(const HomeState.logout());
    } else {
      emit(HomeState.error(products['message']));
    }
  }

  _getFilterProductsOffset(
      _GetFilterProductsOffset event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    int newLimit = _filter_limit + event.limit;
    _filter_limit = newLimit;
    Map<String, dynamic> products = await productRepositoryImpl
        .getFilterProductsOffset(newLimit, event.data);
    if (products['status']) {
      // local_products = products['products'];

      products['products'].forEach((e) {
        if (!_filter_products.contains(e)) {
          _filter_products.add(e);
        }
      });

      final List<Item> newList;
      final List<Item> newList_search;
      newList = [..._filter_products];
      newList_search = [..._filter_search_list];
      _setTotalFilter();
      emit(HomeState.filter(newList, newList_search, _total_filter,
          _total_filter_count, _total_filter_free));
    } else if (!products['isAuth']) {
      emit(const HomeState.logout());
    } else {
      emit(HomeState.error(products['message']));
    }
  }

  _getFilterProductsSearchOffset(
      _GetFilterProductsSearchOffset event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    int newLimit = _filter_limitSearch + event.limit;
    _filter_limitSearch = newLimit;
    Map<String, dynamic> products = await productRepositoryImpl
        .getFilterProductsSearch(newLimit, event.text, event.data);
    if (products['status']) {
      // local_products = products['products'];

      products['products'].forEach((e) {
        if (!_filter_search_list.contains(e)) {
          _filter_search_list.add(e);
        }
        if (!_filter_products.contains(e)) {
          _filter_products.add(e);
        }
      });

      final List<Item> newList;
      final List<Item> newList_search;
      newList = [..._filter_products];
      newList_search = [..._filter_search_list];
      _setTotalFilter();
      emit(HomeState.filter(newList, newList_search, _total_filter,
          _total_filter_count, _total_filter_free));
    } else if (!products['isAuth']) {
      emit(const HomeState.logout());
    } else {
      emit(HomeState.error(products['message']));
    }
  }

  _changeCurrentCountFilter(
      _ChangeFilterCount event, Emitter<HomeState> emit) async {
    final int currentAmount = _filter_products
        .firstWhere((cartItem) => cartItem.id == event.product.id)
        .currentCount;
    final Item item = _filter_products
        .firstWhere((cartItem) => cartItem.id == event.product.id);
    final Item itemForIncrease = _filter_products
        .firstWhere((cartItem) => cartItem.id == event.product.id)
        .copyWith(
            currentCount: event.type == "INC"
                ? currentAmount + 1
                : event.type == 'DEC'
                    ? currentAmount - 1
                    : event.count,
            currentCount_free: event.count_free);
    _filter_products[_filter_products.indexOf(item)] = itemForIncrease;
    final List<Item> newList;
    final List<Item> newList_search;
    newList = [..._filter_products];
    newList_search = [..._filter_search_list];
    _setTotalFilter();
    emit(HomeState.filter(newList, newList_search, _total_filter,
        _total_filter_count, _total_filter_free));
  }

  _changeCurrentCountFilter_search(
      _ChangeFilterCountSearch event, Emitter<HomeState> emit) async {
    // var local_search_list_copy = [...local_search_list];
    final int currentAmount = _filter_search_list
        .firstWhere((cartItem) => cartItem.id == event.product.id)
        .currentCount;
    final Item item = _filter_products
        .firstWhere((cartItem) => cartItem.id == event.product.id);
    final Item itemForIncrease = _filter_search_list
        .firstWhere((cartItem) => cartItem.id == event.product.id)
        .copyWith(
            currentCount: event.type == "INC"
                ? currentAmount + 1
                : event.type == 'DEC'
                    ? currentAmount - 1
                    : event.count);

    _filter_search_list[_filter_search_list.indexOf(item)] = itemForIncrease;
    _filter_search_list = [..._filter_search_list];
    final List<Item> newList_search;
    final List<Item> newList;
    newList_search = [..._filter_search_list];
    newList = [..._filter_search_list];
    emit(HomeState.filter(newList, newList_search, _total_filter,
        _total_filter_count, _total_filter_free));
  }

  _setTotalFilter() {
    _total_filter = _filter_products.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.currentCount * element.price).toInt());
    _total_filter_count = _filter_products.fold(
        0, (previousValue, element) => previousValue + element.currentCount);
    _total_filter_free = _filter_products.fold(0,
        (previousValue, element) => previousValue + element.currentCount_free);
  }

  _clearAllCount(_ClearAllCount event, Emitter<HomeState> emit) {
    local_products = local_products
        .map((e) => e.copyWith(currentCount: 0, currentCount_free: 0))
        .toList();
    local_search_list = local_search_list
        .map((e) => e.copyWith(currentCount: 0, currentCount_free: 0))
        .toList();
    final List<Item> newList;
    final List<Item> newListSearch;
    newList = [...local_products];
    newListSearch = [...local_search_list];
    emit(HomeState.products(newList, newListSearch));
  }

  _getAll(Emitter<HomeState> emit) async {
    // add(const HomeEvent.getProductsOffset(10));
    emit(const HomeState.loading());
    emit(HomeState.products(local_products, local_search_list));
    emit(HomeState.refusal(_refuse_list, _refuse_list_search));
    emit(HomeState.filter(_filter_products, _filter_search_list, _total_filter,
        _total_filter_count, _total_filter_free));
  }

  _totalCalculate() {
    var _local = local_products.fold(
        0, (previousValue, element) => previousValue + element.currentCount);

    _totalCount = _local;
    SharedPrefs().itemsCount = _totalCount;
  }

  // certificates
  List<Map<String, dynamic>> certificates = [];
  List<int> certificate = [];

  _getCertificates(_GetCertificates event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    final responce = await productRepositoryImpl
        .getCertificates({"child_uuid": event.child_uuid});
    if (responce['status']) {
      certificates.clear();
      responce['data'].forEach((e) => certificates.add(e));
      List<Map<String, dynamic>> newList = [];
      newList = [...certificates];
      emit(HomeState.certificates(newList, []));
    } else if (!responce['isAuth']) {
      emit(const HomeState.logout());
    } else {
      emit(HomeState.error(responce['message']));
    }
  }

  _getCertificate(_GetCertificate event, Emitter<HomeState> emit) async {
    final responce = await productRepositoryImpl.getCertificate(event.path);

    if (responce['status']) {
      emit(HomeState.certificates([], responce['data']));
    } else if (!responce['isAuth']) {
      emit(const HomeState.logout());
    } else {
      emit(HomeState.error(responce['message']));
    }
  }
}
