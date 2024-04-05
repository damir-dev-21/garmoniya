part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.logout() = _Logout;
  const factory HomeState.products(List<Item> products, List<Item> searchList) =
      _Products;
  const factory HomeState.certificates(
      List<Map<String, dynamic>> certificates, List<int> file) = _Certificates;
  const factory HomeState.refusal(
      List<Item> refusalList, List<Item> refusalList_search) = _Refusal;
  const factory HomeState.filter(List<Item> items, List<Item> searchList,
      double total, double totalCount, double totalFree) = _FilterItems;
  const factory HomeState.error(String message) = _Error;
}
