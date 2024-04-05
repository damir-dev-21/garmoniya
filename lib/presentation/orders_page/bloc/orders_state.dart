part of 'orders_bloc.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.loading() = _Loading;
  const factory OrdersState.logout() = _Logout;
  const factory OrdersState.error(String message) = _Error;
  const factory OrdersState.getOrders(
      {required List<Order> orders,
      required List<Order> filterOrders,
      required List<Map<String, dynamic>> statuses}) = _GetOrders;
  const factory OrdersState.getOrder(
      {required List<Map<String, dynamic>> items,
      required Map<String, dynamic>? sale,
      required Map<String, dynamic> data}) = _GetOrder;
}
