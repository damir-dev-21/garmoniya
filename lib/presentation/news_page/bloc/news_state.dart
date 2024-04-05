part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;
  const factory NewsState.loading() = _Loading;
  const factory NewsState.error(e) = _Error;
  const factory NewsState.logout() = _Logout;
  const factory NewsState.news(List<Map<String, dynamic>> news) = _News;
  const factory NewsState.newDetail(Map<String, dynamic> newDetail) =
      _NewDetail;
}
