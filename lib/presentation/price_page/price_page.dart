import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:garmoniya_pharm/presentation/price_page/bloc/price_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:garmoniya_pharm/utils/shared_prefs.dart';
import 'package:provider/provider.dart';

class PricePage extends StatefulWidget {
  PricePage({Key? key}) : super(key: key);

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceBloc, PriceState>(builder: (context, state) {
      return state.maybeWhen(
          orElse: () => SizedBox(),
          loading: () => Center(
                child: CircularProgressIndicator(),
              ),
          error: (e) => Center(
                child: Text(e),
              ),
          initial: () => Scaffold(
                appBar: AppBar(
                  backgroundColor: mainColor,
                ),
                body: SafeArea(
                    child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => mainColor)),
                          onPressed: () {
                            Provider.of<PriceBloc>(context, listen: false)
                                .add(PriceEvent.getPrice());
                          },
                          child: Text(AppLocalizations.of(context)!.create)),
                    ],
                  ),
                )),
              ),
          prices: (prices) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: mainColor,
              ),
              body: SafeArea(
                  child: Container(
                margin: const EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => mainColor)),
                        onPressed: () {
                          Provider.of<PriceBloc>(context, listen: false)
                              .add(PriceEvent.getPrice());
                        },
                        child: Text(AppLocalizations.of(context)!.create)),
                    Container(
                      height: MediaQuery.of(context).size.height - 300,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: Expanded(
                        child: Column(
                          children: List.generate(prices.length, (index) {
                            var _price = prices[index];
                            return PriceItem(
                              price: _price,
                            );
                          }),
                        ),
                      ),
                    )
                  ],
                ),
              )),
            );
          });
    });
  }
}

class PriceItem extends StatefulWidget {
  const PriceItem({super.key, required this.price});
  final price;

  @override
  State<PriceItem> createState() => _PriceItemState();
}

class _PriceItemState extends State<PriceItem> {
  bool _isLoad = false;

  Future<void> decodeAndSaveXLSX(String base64String) async {
    try {
      // Декодируем строку Base64 в байты
      List<int> bytes = base64.decode(base64String);

      // Получаем доступ к каталогу для сохранения файла
      final directory = await getApplicationDocumentsDirectory();
      String dir = directory!.path + '/' + "price_list" + ".xlsx";
      File file = File(dir);
      if (!file.existsSync()) file.create();
      await file.writeAsBytes(bytes);
      await OpenFile.open(file.path);
      // Теперь у вас есть файл XLSX, который можно скачать на телефон

      // Пример использования Dio для скачивания файла (подключите Dio, как указано в зависимостях)
      // Dio dio = Dio();
      //await dio.download(filePath, 'путь_для_сохранения.xlsx');
      // await file.copy("price.xlsx");
    } catch (e) {
      print('Ошибка: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          _isLoad = true;
        });
        await decodeAndSaveXLSX(widget.price['base64']);
        // String base64_string = widget.price['base64'];
        // Uint8List bytes = base64.decode(base64_string);
        // final directory = await getApplicationDocumentsDirectory();
        // String dir =
        //     directory!.path + '/' + "${widget.price['title']['en']}" + ".pdf";
        // File file = File(dir);
        // if (!file.existsSync()) file.create();
        // await file.writeAsBytes(bytes);
        // await OpenFile.open(file.path);
        setState(() {
          _isLoad = false;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        child: _isLoad
            ? Center(child: CircularProgressIndicator())
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.price['title'][SharedPrefs().locale],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Icon(Icons.download)
                ],
              ),
      ),
    );
  }
}
