part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.loading() = _Loading;
  const factory CartState.logout() = _Logout;
  const factory CartState.emptyCartState({required bool sended}) =
      _EmptyCartState;
  const factory CartState.updatedCartState(
      {required List<Item> cartItems,
      required double total,
      required double totalAmount,
      required double totalFree}) = _UpdateCart;
  const factory CartState.updateChecks(
      {required List<Item> loads,
      required List<Item> reminds,
      required List<Item> free}) = _UpdateChecks;
  const factory CartState.updateErrors(
      {required List<Map<String, dynamic>> checks}) = _UpdateErrors;
  const factory CartState.errorState(String e) = _Error;
}
