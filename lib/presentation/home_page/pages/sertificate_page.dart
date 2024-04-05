import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:garmoniya_pharm/data/config/urls.dart';
import 'package:garmoniya_pharm/presentation/home_page/bloc/home_bloc.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../utils/main_service.dart';
import '../../login_page/bloc/auth_bloc.dart';
import 'package:image/image.dart' as img;

class SertificatePage extends StatefulWidget {
  SertificatePage({Key? key, required this.id}) : super(key: key);
  final id;
  @override
  State<SertificatePage> createState() => _SertificatePageState();
}

class _SertificatePageState extends State<SertificatePage> {
  List<Map<String, dynamic>> _certificates = [];
  late Uint8List _certificatesData;
  bool _isLoad = false;
  bool _isError = false;
  bool _isLoadFile = false;
  String _procent = '';
  String _errorMessage = "";

  _showImage(url) async {
    await showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: CachedNetworkImage(imageUrl: url),
          );
        });
  }

  _modifyCertificatesList(element, modifyElement) {
    List<Map<String, dynamic>> updateCertificatesList = [..._certificates];
    updateCertificatesList[_certificates.indexOf(element)] = {
      "Uint8List": modifyElement
    };

    setState(() {
      _certificates = updateCertificatesList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text("Сертификаты"),
        centerTitle: true,
      ),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (e) {
              setState(() {
                _isError = true;
                _errorMessage = e;
                _isLoad = false;
              });
            },
            orElse: () {
              setState(() {
                _isLoad = false;
              });
            },
            certificates: (certificates, file) {
              setState(() {
                _certificates = certificates;
                _isLoad = false;
              });
            },
            logout: () {
              Provider.of<AuthBloc>(context, listen: false)
                  .add(const AuthEvent.logout(data: {}));
            },
            loading: () {
              setState(() {
                _isLoad = true;
              });
            },
          );
        },
        child: _isError
            ? Center(
                child: Text(_errorMessage),
              )
            : SafeArea(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => mainColor)),
                          onPressed: () {
                            Provider.of<HomeBloc>(context, listen: false)
                                .add(HomeEvent.getCertificates(widget.id));
                          },
                          child: Text("Скачать")),
                      SizedBox(
                        height: 50,
                      ),
                      _isLoad
                          ? Center(
                              child: CircularProgressIndicator(
                                color: mainColor,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 500,
                                  child: GridView.count(
                                      primary: false,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 15,
                                      padding: EdgeInsets.all(1.0),
                                      children: List.generate(
                                          _certificates.length,
                                          (index) => GestureDetector(
                                                onDoubleTap: () {
                                                  CachedNetworkImage
                                                      .evictFromCache(
                                                          urlCertificate +
                                                              _certificates[
                                                                      index]
                                                                  ['path']);
                                                },
                                                onTap: () {
                                                  _showImage(urlCertificate +
                                                      _certificates[index]
                                                          ['path']);
                                                },
                                                child: CachedNetworkImage(
                                                    imageUrl: urlCertificate +
                                                        _certificates[index]
                                                            ['path'],
                                                    httpHeaders: {
                                                      ...MainService
                                                          .getDefaultAuth()!
                                                    },
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                downloadProgress) =>
                                                            Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                value:
                                                                    downloadProgress
                                                                        .progress,
                                                              ),
                                                            )),
                                              )))
                                  // _certificates[index]
                                  //             ['Uint8List'] !=
                                  //         null
                                  //     ? ImageCertificateWidget(
                                  //         certificate:
                                  //             _certificates[index]
                                  //                 ['Uint8List'],
                                  //         index: index,
                                  //       )
                                  //     : NotImageCertificateWidget(
                                  //         certificate:
                                  //             _certificates[index],
                                  //         modifyCertificates:
                                  //             _modifyCertificatesList))),
                                  ),
                            )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class NotImageCertificateWidget extends StatefulWidget {
  const NotImageCertificateWidget({
    super.key,
    required this.modifyCertificates,
    required this.certificate,
  });

  final certificate;
  final Function modifyCertificates;

  @override
  State<NotImageCertificateWidget> createState() =>
      _NotImageCertificateWidgetState();
}

class _NotImageCertificateWidgetState extends State<NotImageCertificateWidget> {
  bool _isLoad = false;
  getCertificate(String path, Map<String, dynamic> element) async {
    setState(() {
      _isLoad = true;
    });
    try {
      // var httpClient = HttpClient();
      // var request = await httpClient.getUrl(Uri.parse(urlCertificate + path));
      // var response = await request.close();
      // List<int> bytes = [];
      // int totalBytes = response.contentLength;
      // int receivedBytes = 0;
      // print("totalBytes: ${totalBytes}");
      // response.listen(
      //   (List<int> newBytes) {
      //     bytes.addAll(newBytes);
      //     receivedBytes += newBytes.length;
      //     double progress = (receivedBytes / totalBytes) * 100;
      //     print('Download progress: $progress%');
      //     // Здесь можно вызвать setState, чтобы обновить UI
      //   },
      //   onDone: () async {
      //     print("bytes: ${bytes.length}");
      //     // Uint8List byteData = Uint8List.fromList(bytes);
      //     final directory = await getApplicationDocumentsDirectory();
      //     String dir =
      //         directory!.path + '/' + "certificate #${element['path']}";
      //     File file = File(dir);
      //     if (!file.existsSync()) file.create();
      //     await file.writeAsBytes(bytes);

      //     List<Map<String, dynamic>> updateCertificatesList = [
      //       ..._certificates
      //     ];
      //     updateCertificatesList[_certificates.indexOf(element)] = {
      //       "Uint8List": file //Uint8List.fromList(bytes)
      //     };
      //     setState(() {
      //       _certificates = updateCertificatesList;
      //     });
      //     // Обновите состояние, чтобы отразить завершение загрузки
      //   },
      //   onError: (error) {
      //     print('Error: $error');
      //   },
      //   cancelOnError: true,
      // );

      final responce = await http.get(Uri.parse("${urlCertificate + path}"),
          headers: {...MainService.getDefaultAuth()!});
      widget.modifyCertificates(widget.certificate, responce.bodyBytes);
    } catch (e) {
      print(e);
      setState(() {
        _isLoad = false;
      });
    }
    setState(() {
      _isLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await getCertificate(widget.certificate['path'], widget.certificate);
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: textColorLight,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1)),
        child: Center(
            child: _isLoad
                ? CircularProgressIndicator(
                    color: mainColor,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.download),
                      SizedBox(
                        height: 8,
                      ),
                      Text(widget.certificate['title'])
                    ],
                  )),
      ),
    );
  }
}

class ImageCertificateWidget extends StatefulWidget {
  const ImageCertificateWidget(
      {super.key, required this.certificate, required this.index});

  final Uint8List certificate;
  final int index;

  @override
  State<ImageCertificateWidget> createState() => _ImageCertificateWidgetState();
}

class _ImageCertificateWidgetState extends State<ImageCertificateWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final directory = await getApplicationDocumentsDirectory();
        String dir =
            directory!.path + '/' + "certificate #${widget.index}" + ".jpg";
        File file = File(dir);
        if (!file.existsSync()) file.create();
        await file.writeAsBytes(widget.certificate);
        await OpenFile.open(file.path);
      },
      child: Image.memory(widget.certificate),
    );
  }
}
