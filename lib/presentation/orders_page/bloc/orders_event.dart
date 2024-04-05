part of 'orders_bloc.dart';

@freezed
class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.started() = _Started;
  const factory OrdersEvent.getOrders() = _GetOrdersEvent;
  const factory OrdersEvent.getOrdersOffset(String offset) =
      _GetOrdersOffsetEvent;
  const factory OrdersEvent.getOrdersFilter(String filter) =
      _GetOrdersFilterEvent;
  const factory OrdersEvent.getOrdersFilterOffset(
      String offset, String filter) = _GetOrdersFilterOffsetEvent;
  const factory OrdersEvent.getOrder(String uuidOrder) = _GetOrderEvent;
  const factory OrdersEvent.rejectOrder(String uuid_order) = _RejectOrder;
  const factory OrdersEvent.confirmOrder(String uuid_order, String sale_uuid) =
      _ConfirmOrder;
  const factory OrdersEvent.acceptOrder(String uuid_order, String sale_uuid) =
      _AcceptOrder;
}
