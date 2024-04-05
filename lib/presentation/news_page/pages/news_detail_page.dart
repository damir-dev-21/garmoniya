import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:garmoniya_pharm/presentation/error_page/error_page.dart';
import 'package:garmoniya_pharm/presentation/news_page/bloc/news_bloc.dart';
import 'package:garmoniya_pharm/utils/main_service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailPage extends StatefulWidget {
  NewsDetailPage({Key? key, required this.newDetail}) : super(key: key);
  final Map<String, dynamic> newDetail;
  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  int currentIdx = 0;

  @override
  void initState() {
    super.initState();
    if (widget.newDetail['is_new']) {
      Provider.of<NewsBloc>(context, listen: false)
          .add(NewsEvent.getNewsDetail(widget.newDetail['uuid']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          widget.newDetail['title'],
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            [
              //{'url': _newDetail['url_main_photo']},
              ...widget.newDetail['list_photo']
            ].isNotEmpty
                ? Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider.builder(
                          itemCount: [
                            {'url': widget.newDetail['url_main_photo']},
                            ...widget.newDetail['list_photo']
                          ].length,
                          itemBuilder: (context, i, pageViewIndex) {
                            var url = [
                              {'url': widget.newDetail['url_main_photo']},
                              ...widget.newDetail['list_photo']
                            ][i]['url'];
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade200),
                              child: CachedNetworkImage(
                                imageUrl: url,
                                httpHeaders: MainService.getDefaultAuth(),
                                fit: BoxFit.fitWidth,
                              ),
                            );
                          },
                          options: CarouselOptions(
                              aspectRatio: 20 / 9,
                              viewportFraction: 1,
                              enableInfiniteScroll: false,
                              onPageChanged: (i, e) {
                                setState(() {
                                  currentIdx = i;
                                });
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              [
                                {'url': widget.newDetail['url_main_photo']},
                                ...widget.newDetail['list_photo']
                              ].length,
                              (index) => Container(
                                    width: 10,
                                    height: 10,
                                    margin: const EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                        color: currentIdx == index
                                            ? mainColor
                                            : Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  )).toList()),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  )
                : SizedBox(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      color: widget.newDetail['list_photo'].isNotEmpty
                          ? Colors.grey.shade200
                          : Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.newDetail['title'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Center(
                        child: SingleChildScrollView(
                          child: Html(
                            data: widget.newDetail['description'],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: List.generate(
                            widget.newDetail['list_file'].length,
                            (index) => NewsFileItem(
                                newDetail: widget.newDetail, index: index)),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewsFileItem extends StatefulWidget {
  const NewsFileItem({
    super.key,
    required Map<String, dynamic> newDetail,
    required int index,
  })  : _newDetail = newDetail,
        index = index;

  final Map<String, dynamic> _newDetail;
  final index;

  @override
  State<NewsFileItem> createState() => _NewsFileItemState();
}

class _NewsFileItemState extends State<NewsFileItem> {
  String _procent = "";
  bool _isLoadFile = false;
  File? _file = null;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget._newDetail['list_file'][widget.index]['description']),
          IconButton(
              onPressed: () async {
                if (_file == null) {
                  String imgUrl =
                      widget._newDetail['list_file'][widget.index]['url'];
                  setState(() {
                    _isLoadFile = true;
                  });
                  Dio dio = Dio();
                  String savePath = await MainService.getFilePath(
                      "${widget._newDetail['list_file'][widget.index]['description']}.${widget._newDetail['list_file'][widget.index]['ext']}");
                  await dio.download(
                      widget._newDetail['list_file'][widget.index]['url'],
                      savePath,
                      options: Options(headers: MainService.getDefaultAuth()),
                      onReceiveProgress: (rec, total) {
                    setState(() {
                      _procent = ((rec / total) * 100).toString();
                    });
                  });
                  setState(() {
                    _file = File(savePath);
                    _isLoadFile = false;
                  });
                  // await DefaultCacheManager()
                  //     .getSingleFile(
                  //         _newDetail['list_file']
                  //                 [index]
                  //             ['url'],
                  //         headers: MainService
                  //             .getDefaultAuth())
                  //     .then((value) {
                  //   setState(() {
                  //     _isLoadFile = false;
                  //     _file = File(
                  //         value.path +
                  //             '.pdf');
                  //   });
                  // });
                  setState(() {});
                } else {
                  await OpenFile.open(_file!.path);
                }
              },
              icon: _isLoadFile
                  ? Text(_procent)
                  : _file != null
                      ? const Icon(Icons.file_copy)
                      : const Icon(Icons.download))
        ],
      ),
    );
  }
}
