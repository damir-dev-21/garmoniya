import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';
import 'package:garmoniya_pharm/data/repository/cart_repository_impl.dart';
import 'package:garmoniya_pharm/presentation/login_page/bloc/auth_bloc.dart';
import 'package:garmoniya_pharm/utils/main_service.dart';
import 'package:garmoniya_pharm/utils/shared_prefs.dart';

import '../../../domain/models/item.dart';
part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartRepositoryImpl cartRepositoryImpl = CartRepositoryImpl();

  CartBloc({required this.cartRepositoryImpl})
      : super(const _EmptyCartState(sended: false)) {
    on<CartEvent>((events, emit) async {
      await events.map(
        addToCartEvent: (event) async => await _addToCart(event, emit),
        getCartEvent: (_) async => await _getCart(emit),
        getCartLocalEvent: (_) async => await _getCartLocal(emit),
        sendCartEvent: (event) async => await _sendCart(event, emit),
        sendCartRemoveEvent: (event) async =>
            await _sendCart_remove(event, emit),
        removeFromCartEvent: (event) async =>
            await _removeFromCart(event, emit),
        changeCartEvent: (event) async => await _changeCart(event, emit),
        clearCartEvent: (_) async => await _clearCart(emit),
        increaseAmountOfItemCartEvent: (event) async =>
            await _increaseAmountOfItem(event, emit),
        decreaseAmountOfItemCartEvent: (event) async =>
            await _decreaseAmountOfItem(event, emit),
        setChecks: (event) async => await _setChecks(event, emit),
      );
    });
  }

  List<Item> _cartItems = [];
  List<Map<String, dynamic>> _checks = [];
  double _total = 0;
  double _totalCount = 0;
  double _totalCountFree = 0;

  _getCartLocal(Emitter<CartState> emit) {
    emit(const CartState.loading());
    _totalCalculate();
    emit(CartState.updatedCartState(
        cartItems: _cartItems,
        total: _total,
        totalAmount: _totalCount,
        totalFree: _totalCountFree));
  }

  _setChecks(_SetChecks event, Emitter<CartState> emit) async {
    emit(const CartState.loading());
    Map<String, dynamic> responce =
        await cartRepositoryImpl.sendOrder(event.data);
    if (responce['status'] && !responce['sended']) {
      emit(CartState.updateErrors(checks: responce['checks']));
    } else if (responce['sended'] ?? false) {
      _cartItems.clear();
      _checks.clear();
      _totalCalculate();
      final List<Item> newList;
      final List<Map<String, dynamic>> newChecks;
      newList = [..._cartItems];
      newChecks = [..._checks];
      emit(CartState.updatedCartState(
          cartItems: newList,
          total: _total,
          totalAmount: _totalCount,
          totalFree: _totalCountFree));

      emit(CartState.updateErrors(checks: newChecks));
      emit(const CartState.emptyCartState(sended: true));
    } else {
      emit(CartState.errorState(responce['message']));
    }
  }

  _increaseAmountOfItem(
      _IncreaseAmountOfItemCartEvent event, Emitter<CartState> emit) async {
    emit(CartState.loading());
    final int currentAmount = _cartItems
        .firstWhere((cartItem) => cartItem == event.cartItem)
        .currentCount;
    final Item itemForIncrease = _cartItems
        .firstWhere((cartItem) => cartItem == event.cartItem)
        .copyWith(
            currentCount: event.count == 0 ? currentAmount + 1 : event.count,
            currentCount_free: event.count_free);
    _cartItems[_cartItems.indexOf(event.cartItem)] = itemForIncrease;
    final List<Item> newList;
    newList = [..._cartItems];
    _totalCalculate();
    add(CartEvent.sendCartEvent(data: {
      "item_uuid": itemForIncrease.uuid,
      "quantity": itemForIncrease.currentCount,
      "quantity_free": itemForIncrease.currentCount_free,
      "price": itemForIncrease.price,
      "discount": itemForIncrease.discount,
      "date_overdue": itemForIncrease.date_overdue_real
    }));
    // emit(CartState.updatedCartState(
    //     cartItems: newList,
    //     total: _total,
    //     totalAmount: _totalCount,
    //     totalFree: _totalCountFree));
    // add(const CartEvent.getCartEvent());
  }

  _totalCalculate() {
    _total = _cartItems.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.currentCount * element.price).toInt());
    _totalCount = _cartItems.fold(
        0, (previousValue, element) => previousValue + element.currentCount);
    _totalCountFree = _cartItems.fold(0,
        (previousValue, element) => previousValue + element.currentCount_free);
  }

  _decreaseAmountOfItem(
      _DecreaseAmountOfItemCartEvent event, Emitter<CartState> emit) async {
    emit(CartState.loading());
    final int currentAmount = _cartItems
        .firstWhere((cartItem) => cartItem == event.cartItem)
        .currentCount;
    final Item itemForDecrease = _cartItems
        .firstWhere((cartItem) => cartItem == event.cartItem)
        .copyWith(
            currentCount: event.count == 0 ? currentAmount - 1 : event.count,
            currentCount_free: event.count_free);
    _cartItems[_cartItems.indexOf(event.cartItem)] = itemForDecrease;
    final List<Item> newList;
    newList = [..._cartItems];
    _totalCalculate();
    add(CartEvent.sendCartEvent(data: {
      "item_uuid": itemForDecrease.uuid,
      "quantity": itemForDecrease.currentCount,
      "quantity_free": itemForDecrease.currentCount_free,
      "price": itemForDecrease.price,
      "discount": itemForDecrease.discount,
      "date_overdue": itemForDecrease.date_overdue_real
    }));
    // emit(CartState.updatedCartState(
    //     cartItems: newList,
    //     total: _total,
    //     totalAmount: _totalCount,
    //     totalFree: _totalCountFree));
    // add(const CartEvent.getCartEvent());
  }

  _addToCart(_AddToCartEvent event, Emitter<CartState> emit) async {
    emit(CartState.loading());
    var findedItem =
        _cartItems.firstWhereOrNull((element) => element == event.cartItem);
    if (findedItem != null && _cartItems.isNotEmpty) {
      return;
    }
    _cartItems.add(event.cartItem);
    final List<Item> newList;
    newList = [..._cartItems];
    emit(CartState.updatedCartState(
        cartItems: newList,
        total: _total,
        totalAmount: _totalCount,
        totalFree: _totalCountFree));
  }

  _removeFromCart(_RemoveFromCartEvent event, Emitter<CartState> emit) async {
    emit(CartState.loading());
    // _cartItems.remove(event.cartItem);
    // final List<Item> newList;
    // if (_cartItems.isEmpty) {
    //   emit(const CartState.emptyCartState(sended: false));
    // } else {
    //   newList = [..._cartItems];
    // }
    add(CartEvent.sendCartRemoveEvent(data: {
      "item_uuid": event.cartItem.uuid,
      "quantity": 0,
      "quantity_free": 0,
      "price": event.cartItem.price,
      "discount": event.cartItem.discount,
      "date_overdue": event.cartItem.date_overdue_real
    }));
  }

  _getCart(Emitter<CartState> emit) async {
    emit(const CartState.loading());
    Map<String, dynamic> products = await cartRepositoryImpl.getCart();

    if (products['status']) {
      // local_products = products['products'];
      _cartItems.clear();
      products['products'].forEach((e) {
        _cartItems.add(e);
      });
      if (_cartItems.isEmpty) {
        emit(const CartState.emptyCartState(sended: false));
      }
      final List<Item> newList;
      newList = [..._cartItems];
      _totalCalculate();
      SharedPrefs().cartCount = _totalCount.toInt();
      SharedPrefs().cartSync = MainService.getCurrentDateString();
      emit(CartState.updatedCartState(
          cartItems: newList,
          total: _total,
          totalAmount: _totalCount,
          totalFree: _totalCountFree));
    } else if (!products['isAuth']) {
      emit(const CartState.logout());
    } else {
      emit(CartState.errorState(products['message']));
    }
  }

  _sendCart(_SendCartEvent event, Emitter<CartState> emit) async {
    emit(CartState.loading());
    Map<String, dynamic> responce =
        await cartRepositoryImpl.sendCart(event.data);
    if (responce['status']) {
      // SharedPrefs().cartCount = _totalCount.toInt();
      emit(CartState.updatedCartState(
          cartItems: _cartItems,
          total: _total,
          totalAmount: _totalCount,
          totalFree: _totalCountFree));
    } else if (!responce['isAuth']) {
      emit(const CartState.logout());
    } else {
      emit(CartState.errorState(responce['message']));
    }
  }

  _sendCart_remove(_SendCartRemoveEvent event, Emitter<CartState> emit) async {
    emit(CartState.loading());
    Map<String, dynamic> responce =
        await cartRepositoryImpl.sendCart(event.data);
    if (responce['status']) {
      // SharedPrefs().cartCount = _totalCount.toInt();
      emit(CartState.updatedCartState(
          cartItems: _cartItems,
          total: _total,
          totalAmount: _totalCount,
          totalFree: _totalCountFree));
      add(const CartEvent.getCartEvent());
    } else if (!responce['isAuth']) {
      emit(const CartState.logout());
    } else {
      emit(CartState.errorState(responce['message']));
    }
  }

  _changeCart(_ChangeCartEvent event, Emitter<CartState> emit) async {
    _cartItems = event.cartItems;
    final newList = _cartItems;
    emit(CartState.updatedCartState(
        cartItems: newList,
        total: _total,
        totalAmount: _totalCount,
        totalFree: _totalCountFree));
  }

  _clearCart(Emitter<CartState> emit) async {
    _cartItems.clear();
    final List<Item> newList;
    newList = _cartItems;
    emit(CartState.updatedCartState(
        cartItems: newList,
        total: _total,
        totalAmount: _totalCount,
        totalFree: _totalCountFree));
  }
}
