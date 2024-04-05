part of 'news_bloc.dart';

@freezed
class NewsEvent with _$NewsEvent {
  const factory NewsEvent.getNews() = _GetNewsEvent;
  const factory NewsEvent.getAll() = _GetAllEvent;
  const factory NewsEvent.getNewsOffset(String last_date) = _GetNewsOffsetEvent;
  const factory NewsEvent.getNewsDetail(String uuid) = _GetNewsDetailEvent;
}
