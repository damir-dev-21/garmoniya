import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/repository/orders_repository_impl.dart';
import '../../../domain/models/order.dart';

part 'orders_event.dart';
part 'orders_state.dart';
part 'orders_bloc.freezed.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersRepositoryImpl ordersRepositoryImpl = OrdersRepositoryImpl();
  OrdersBloc({required this.ordersRepositoryImpl}) : super(const _Loading()) {
    on<OrdersEvent>((events, emit) async {
      await events.map(
        started: (_) => () {},
        getOrders: (event) => _getOrders(event, emit),
        getOrdersFilter: (event) => _getOrdersFilter(event, emit),
        getOrdersOffset: (event) => _getOrdersOffset(event, emit),
        getOrdersFilterOffset: (event) => _getOrdersFilterOffset(event, emit),
        getOrder: (event) => _getOrder(event, emit),
        confirmOrder: (event) => _confirmOrder(event, emit),
        rejectOrder: (event) => _rejectOrder(event, emit),
        acceptOrder: (event) => _acceptOrder(event, emit),
      );
    });
  }

  List<Order> _orders = [];
  List<Order> _filterOrders = [];
  List<Map<String, dynamic>> orderItems = [];
  List<Map<String, dynamic>> _statuses = [];

  _getOrders(_GetOrdersEvent event, Emitter<OrdersState> emit) async {
    emit(const OrdersState.loading());
    Map<String, dynamic> orders = await ordersRepositoryImpl.getOrders();
    Map<String, dynamic> statuses = await ordersRepositoryImpl.getConfigure();

    if (orders['status']) {
      // local_products = products['products'];
      _orders.clear();
      _statuses.clear();
      orders['orders'].forEach((e) {
        _orders.add(e);
      });
      statuses['statuses'].forEach((value) {
        _statuses.add(value);
      });

      final List<Order> newList;
      final List<Map<String, dynamic>> newStatuses;

      newList = [..._orders];
      newStatuses = [..._statuses];

      emit(OrdersState.getOrders(
          orders: newList, filterOrders: [], statuses: newStatuses));
    } else if (!orders['isAuth']) {
      emit(const OrdersState.logout());
    } else {
      emit(OrdersState.error(orders['message']));
    }
  }

  _getOrdersOffset(
      _GetOrdersOffsetEvent event, Emitter<OrdersState> emit) async {
    emit(const OrdersState.loading());
    Map<String, dynamic> orders =
        await ordersRepositoryImpl.getOrdersOffset(event.offset);

    if (orders['status']) {
      // local_products = products['products'];

      orders['orders'].forEach((e) {
        if (!_orders.contains(e)) {
          _orders.add(e);
        }
      });

      final List<Order> newList;

      newList = [..._orders];

      emit(OrdersState.getOrders(
          orders: newList, filterOrders: [], statuses: _statuses));
    } else if (!orders['isAuth']) {
      emit(const OrdersState.logout());
    } else {
      emit(OrdersState.error(orders['message']));
    }
  }

  _getOrdersFilterOffset(
      _GetOrdersFilterOffsetEvent event, Emitter<OrdersState> emit) async {
    emit(const OrdersState.loading());
    Map<String, dynamic> orders = await ordersRepositoryImpl
        .getOrdersFilterOffset(event.offset, event.filter);

    if (orders['status']) {
      // local_products = products['products'];

      // _filterOrders.clear();
      orders['orders'].forEach((e) {
        _filterOrders.add(e);
      });

      final List<Order> newListFilter;

      newListFilter = [..._filterOrders];

      emit(OrdersState.getOrders(
          orders: _orders, filterOrders: newListFilter, statuses: _statuses));
    } else if (!orders['isAuth']) {
      emit(const OrdersState.logout());
    } else {
      emit(OrdersState.error(orders['message']));
    }
  }

  _getOrdersFilter(
      _GetOrdersFilterEvent event, Emitter<OrdersState> emit) async {
    emit(const OrdersState.loading());
    Map<String, dynamic> orders =
        await ordersRepositoryImpl.getOrdersFilter(event.filter);

    if (orders['status']) {
      // local_products = products['products'];
      _filterOrders.clear();
      orders['orders'].forEach((e) {
        _filterOrders.add(e);
      });

      final List<Order> newListFilter;

      newListFilter = [..._filterOrders];

      emit(OrdersState.getOrders(
          orders: _orders, filterOrders: newListFilter, statuses: _statuses));
    } else if (!orders['isAuth']) {
      emit(const OrdersState.logout());
    } else {
      emit(OrdersState.error(orders['message']));
    }
  }

  _getOrder(_GetOrderEvent event, Emitter<OrdersState> emit) async {
    emit(const OrdersState.loading());
    Map<String, dynamic> orders =
        await ordersRepositoryImpl.getOrder(event.uuidOrder);

    if (orders['status']) {
      orderItems.clear();
      // local_products = products['products'];

      orders['items'].forEach((e) {
        orderItems.add(e);
      });

      final List<Map<String, dynamic>> newList;

      newList = [...orderItems];

      emit(OrdersState.getOrder(
          items: newList, sale: orders['sale'], data: orders['details']));
    } else if (!orders['isAuth']) {
      emit(const OrdersState.logout());
    } else {
      emit(OrdersState.error(orders['message']));
    }
  }

  _confirmOrder(_ConfirmOrder event, Emitter<OrdersState> emit) async {
    emit(const OrdersState.loading());
    final responce = await ordersRepositoryImpl.confirmOrder(event.sale_uuid);
    if (responce['status']) {
      add(OrdersEvent.getOrder(event.uuid_order));
      // add(const OrdersEvent.getOrders());
    } else if (!responce['isAuth']) {
      emit(const OrdersState.logout());
    } else {
      emit(OrdersState.error(responce['message']));
    }
  }

  _acceptOrder(_AcceptOrder event, Emitter<OrdersState> emit) async {
    emit(const OrdersState.loading());
    final responce = await ordersRepositoryImpl.acceptedOrder(event.sale_uuid);
    if (responce['status']) {
      // add(const OrdersEvent.getOrders());

      add(OrdersEvent.getOrder(event.uuid_order));
    } else if (!responce['isAuth']) {
      emit(const OrdersState.logout());
    } else {
      emit(OrdersState.error(responce['message']));
    }
  }

  _rejectOrder(_RejectOrder event, Emitter<OrdersState> emit) async {
    emit(const OrdersState.loading());
    final responce = await ordersRepositoryImpl.rejectOrder(event.uuid_order);
    if (responce['status']) {
      // add(const OrdersEvent.getOrders());
      add(OrdersEvent.getOrder(event.uuid_order));
    } else if (!responce['isAuth']) {
      emit(const OrdersState.logout());
    } else {
      emit(OrdersState.error(responce['message']));
    }
  }
}
