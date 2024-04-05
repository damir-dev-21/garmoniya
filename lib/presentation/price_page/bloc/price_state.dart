part of 'price_bloc.dart';

@freezed
class PriceState with _$PriceState {
  const factory PriceState.initial() = _Initial;
  const factory PriceState.loading() = _Loading;
  const factory PriceState.logout() = _Logout;
  const factory PriceState.error(e) = _Error;
  const factory PriceState.prices(List<Map<String, dynamic>> prices) = _Prices;
}
