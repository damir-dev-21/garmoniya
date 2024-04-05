part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.getCartEvent() = _GetCartEvent;
  const factory CartEvent.getCartLocalEvent() = _GetCartLocalEvent;
  const factory CartEvent.addToCartEvent({required Item cartItem}) =
      _AddToCartEvent;
  const factory CartEvent.sendCartEvent({required Map<String, dynamic> data}) =
      _SendCartEvent;
  const factory CartEvent.sendCartRemoveEvent(
      {required Map<String, dynamic> data}) = _SendCartRemoveEvent;
  const factory CartEvent.removeFromCartEvent({required Item cartItem}) =
      _RemoveFromCartEvent;
  const factory CartEvent.changeCartEvent({required List<Item> cartItems}) =
      _ChangeCartEvent;
  const factory CartEvent.clearCartEvent() = _ClearCartEvent;
  const factory CartEvent.increaseAmountOfItemCartEvent(
      {required Item cartItem,
      required int count,
      required int count_free}) = _IncreaseAmountOfItemCartEvent;
  const factory CartEvent.decreaseAmountOfItemCartEvent(
      {required Item cartItem,
      required int count,
      required int count_free}) = _DecreaseAmountOfItemCartEvent;

  const factory CartEvent.setChecks({required Map<String, dynamic> data}) =
      _SetChecks;
}
