part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  // products
  const factory HomeEvent.getProducts() = _GetProducts;
  const factory HomeEvent.getAll() = _GetAll;
  const factory HomeEvent.getProductsOffset(int limit) = _GetProductsOffset;
  const factory HomeEvent.getProductsSearchOffset(int limit, String text) =
      _GetProductsSearchOffset;
  const factory HomeEvent.getProductsSearch(int limit, String text) =
      _GetProductsSearch;
  const factory HomeEvent.changeCurrentCount(
      Item product, String type, int count, int count_free) = _ChangeCount;
  const factory HomeEvent.changeCurrentCountSearch(
      Item product, String type, int count) = _ChangeCountSearch;
  const factory HomeEvent.clearAll() = _ClearAll;
  const factory HomeEvent.clearAllSearch() = _ClearAllSearch;

  // refuse list
  const factory HomeEvent.getRefuseListProductSearch(int limit, String text) =
      _GetRefuseListProductSearch;
  const factory HomeEvent.getProductsRefuseSearchOffset(
      int limit, String text) = _GetProductsRefuseSearchOffset;
  const factory HomeEvent.changeCurrentCountRefuse(
      Item product, String type, int count) = _ChangeCountRefuse;
  const factory HomeEvent.changeCurrentCountRefuse_search(
      Item product, String type, int count) = _ChangeCountRefuseSearch;
  const factory HomeEvent.addToRefuse({required Item item}) = _AddToRefuse;
  const factory HomeEvent.removeFromRefuse({required Item item}) =
      _RemoveFromRefuse;
  const factory HomeEvent.sendRefuseList({required Map<String, dynamic> data}) =
      _SendRefuseList;
  const factory HomeEvent.getRefusal() = _GetRefusal;

  // filter
  const factory HomeEvent.getFilterProducts(Map<String, dynamic> data) =
      _GetFilterProducts;
  const factory HomeEvent.getFilterOffset(
      int limit, Map<String, dynamic> data) = _GetFilterProductsOffset;
  const factory HomeEvent.getFilterSearchOffset(
          int limit, String text, Map<String, dynamic> data) =
      _GetFilterProductsSearchOffset;
  const factory HomeEvent.getFilterSearch(
          int limit, String text, Map<String, dynamic> data) =
      _GetFilterProductsSearch;
  const factory HomeEvent.changeCurrentCountFilter(
          Item product, String type, int count, int count_free) =
      _ChangeFilterCount;
  const factory HomeEvent.changeCurrentCountSearchFilter(
      Item product, String type, int count) = _ChangeFilterCountSearch;
  const factory HomeEvent.clearFilter() = _ClearFilterProducts;

  //clear
  const factory HomeEvent.clearAllCount() = _ClearAllCount;

  // certificates
  const factory HomeEvent.getCertificates(String child_uuid) = _GetCertificates;
  const factory HomeEvent.getCertificate(String path) = _GetCertificate;
}
