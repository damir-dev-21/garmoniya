import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garmoniya_pharm/data/repository/news_repository_impl.dart';
import 'package:garmoniya_pharm/utils/shared_prefs.dart';

import '../../../utils/main_service.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepositoryImp newsRepositoryImpl = NewsRepositoryImp();
  NewsBloc({required this.newsRepositoryImpl}) : super(_Loading()) {
    on<NewsEvent>((events, emit) async {
      await events.map(
        getNews: (event) async => _getNews(event, emit),
        getAll: (event) async => _getAll(event, emit),
        getNewsOffset: (event) async => _getNewsOffset(event, emit),
        getNewsDetail: (event) async => _getNewsDetail(event, emit),
      );
    });
  }

  List<Map<String, dynamic>> _news = [];

  _getAll(_GetAllEvent event, Emitter<NewsState> emit) async {
    emit(const NewsState.loading());
    if (_news.isEmpty) {
      add(NewsEvent.getNews());
    } else {
      emit(NewsState.news(_news));
    }
  }

  _getNews(_GetNewsEvent event, Emitter<NewsState> emit) async {
    emit(const NewsState.loading());
    final newsResponce = await newsRepositoryImpl.getNews();
    if (newsResponce['status']) {
      _news.clear();
      newsResponce['news'].forEach((e) {
        _news.add(e);
      });

      final List<Map<String, dynamic>> newList;
      newList = [..._news];
      SharedPrefs().newsSync = MainService.getCurrentDateString();
      emit(NewsState.news(newList));
    } else if (!newsResponce['isAuth']) {
      emit(const NewsState.logout());
    } else {
      emit(NewsState.error(newsResponce['message']));
    }
  }

  _getNewsOffset(_GetNewsOffsetEvent event, Emitter<NewsState> emit) async {
    emit(const NewsState.loading());
    final newsResponce =
        await newsRepositoryImpl.getNewsOffset(event.last_date);
    if (newsResponce['status']) {
      newsResponce['news'].forEach((e) {
        if (!_news.contains(e)) {
          _news.add(e);
        }
      });

      final List<Map<String, dynamic>> newList;
      newList = [..._news];
      SharedPrefs().newsSync = MainService.getCurrentDateString();
      emit(NewsState.news(newList));
    } else if (!newsResponce['isAuth']) {
      emit(const NewsState.logout());
    } else {
      emit(NewsState.error(newsResponce['message']));
    }
  }

  _getNewsDetail(_GetNewsDetailEvent event, Emitter<NewsState> emit) async {
    emit(const NewsState.loading());
    final newsResponce = await newsRepositoryImpl.getNewsDetail(event.uuid);
    if (newsResponce['status']) {
      final Map<String, dynamic> news_item =
          _news.firstWhere((element) => element['uuid'] == event.uuid);
      news_item['is_new'] = false;
      _news[_news.indexOf(news_item)] = news_item;
      final List<Map<String, dynamic>> newList;
      newList = [..._news];
      emit(NewsState.news(newList));
    } else if (!newsResponce['isAuth']) {
      emit(const NewsState.logout());
    } else {
      emit(NewsState.error(newsResponce['message']));
    }
  }
}
