import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:garmoniya_pharm/presentation/error_page/error_page.dart';
import 'package:garmoniya_pharm/presentation/news_page/bloc/news_bloc.dart';
import 'package:garmoniya_pharm/presentation/news_page/widgets/news_item.dart';
import 'package:garmoniya_pharm/utils/main_service.dart';
import 'package:garmoniya_pharm/utils/shared_prefs.dart';
import 'package:provider/provider.dart';

import '../login_page/bloc/auth_bloc.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _news = [];
  bool _isLoading = false;
  bool _isError = false;
  String _errorMessage = "";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(scrollListener);
    bool statusSync = MainService.checkHowManyDaysHavePassed_cart();
    print(SharedPrefs().newsSync);
    print(statusSync);
    if (statusSync || SharedPrefs().newsSync == '') {
      Provider.of<NewsBloc>(context, listen: false)
          .add(const NewsEvent.getNews());
    } else {
      Provider.of<NewsBloc>(context, listen: false)
          .add(const NewsEvent.getAll());
    }
  }

  void scrollListener() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      Map<String, dynamic> lastNew = _news.isNotEmpty ? _news.last : _news.last;
      String offsetRequest = "${lastNew['date']}_${lastNew['number']}";
      if (_news.isNotEmpty) {
        Provider.of<NewsBloc>(context, listen: false)
            .add(NewsEvent.getNewsOffset(offsetRequest));
      } else {
        Provider.of<NewsBloc>(context, listen: false)
            .add(NewsEvent.getNewsOffset(offsetRequest));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isError
        ? ErrorPage(text: _errorMessage)
        : Scaffold(
            // appBar: AppBar(
            //   backgroundColor: mainColor,
            //   title: Text("Новости"),
            //   centerTitle: true,
            // ),
            body: BlocListener<NewsBloc, NewsState>(
              listener: (context, state) {
                state.maybeWhen(
                    orElse: () {},
                    loading: () {
                      setState(() {
                        _isLoading = true;
                      });
                    },
                    error: (e) {
                      setState(() {
                        _isError = true;
                        _errorMessage = e;
                        _isLoading = false;
                      });
                    },
                    logout: () {
                      Provider.of<AuthBloc>(context, listen: false)
                          .add(const AuthEvent.logout(data: {}));
                    },
                    news: (news) {
                      setState(() {
                        _news = news;
                        _isLoading = false;
                      });
                    });
              },
              child: _isError
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : RefreshIndicator(
                      triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      onRefresh: () async {
                        Provider.of<NewsBloc>(context, listen: false)
                            .add(const NewsEvent.getNews());
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                                child: ListView.builder(
                                    controller: _scrollController,
                                    itemCount: _news.length,
                                    itemBuilder: (ctx, i) {
                                      Map<String, dynamic> item = _news[i];
                                      return NewsItem(item: item);
                                    }))
                          ],
                        ),
                      ),
                    ),
            ),
          );
  }
}
