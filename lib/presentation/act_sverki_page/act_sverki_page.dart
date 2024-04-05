import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:garmoniya_pharm/presentation/act_sverki_page/bloc/report_bloc.dart';
import 'package:garmoniya_pharm/utils/main_service.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActSverkiPage extends StatefulWidget {
  const ActSverkiPage({Key? key}) : super(key: key);

  @override
  State<ActSverkiPage> createState() => _ActSverkiPageState();
}

class _ActSverkiPageState extends State<ActSverkiPage> {
  final TextEditingController _controllerDateEnd = TextEditingController();
  final TextEditingController _controllerDateBegin = TextEditingController();
  late DateTime _selectedDateBegin = DateTime.now().subtract(Duration(days: 1));
  late DateTime _selectedDateEnd = DateTime.now();
  String _base64 = "";

  bool isLoad = false;
  late BalanceDataSource balanceDataSource;
  Future<void> _selectDateBegin(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: _selectedDateBegin,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != _selectedDateBegin) {
      setState(() {
        _selectedDateBegin = picked;
      });
    }
  }

  Future<void> _selectDateEnd(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: _selectedDateEnd,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != _selectedDateEnd) {
      setState(() {
        _selectedDateEnd = picked;
      });
      // await context.read<BalanceProvider>().getBalance(
      //     DateFormat("dd.MM.yyyy").format(_selectedDateBegin),
      //     DateFormat("dd.MM.yyyy").format(_selectedDateEnd),
      //     client_uuid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportBloc, ReportState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          report: (initial_balance_dt,
              initial_balance_ct,
              final_balance_dt,
              final_balance_ct,
              turnover_dt,
              turnover_ct,
              base64,
              turnover_results) {
            setState(() {
              _base64 = base64;
            });
          },
        );
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            title: Text(AppLocalizations.of(context)!.report),
            actions: [
              IconButton(
                  onPressed: () async {
                    if (_base64 != '') {
                      String base64_string = _base64;
                      print(base64_string);
                      Uint8List bytes = base64.decode(base64_string);
                      final directory =
                          await getApplicationDocumentsDirectory();
                      String dir = directory!.path +
                          '/' +
                          "${AppLocalizations.of(context)!.report}" +
                          ".pdf";
                      File file = File(dir);
                      if (!file.existsSync()) file.create();
                      await file.writeAsBytes(bytes);
                      await OpenFile.open(file.path);
                    }
                  },
                  icon: Icon(Icons.download))
            ],
          ),
          body: SingleChildScrollView(
              child: Column(children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.9,
                    child: Row(
                      children: [
                        Flexible(
                          child: SizedBox(
                            width: 120,
                            child: TextField(
                              controller: _controllerDateBegin,
                              // focusNode: _calFocusNode,
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                // await cartProvider.showAllClient(
                                //     context, authProvider.user);
                                _selectDateBegin(context);
                              },
                              onSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  labelText: DateFormat("dd.MM.yy")
                                      .format(_selectedDateBegin),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 15,
                            height: 2,
                            child: Container(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: 120,
                            child: TextField(
                              controller: _controllerDateEnd,
                              // focusNode: _calFocusNode,
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());

                                _selectDateEnd(context);
                              },

                              onSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  labelText: DateFormat("dd.MM.yy")
                                      .format(_selectedDateEnd),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 30,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => mainColor)),
                          onPressed: () {
                            Provider.of<ReportBloc>(context, listen: false)
                                .add(ReportEvent.getData({
                              "start_period":
                                  _selectedDateBegin.toIso8601String(),
                              "end_period": _selectedDateEnd.toIso8601String(),
                            }));
                          },
                          child: Text(AppLocalizations.of(context)!.create)))
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            BlocBuilder<ReportBloc, ReportState>(builder: (context, state) {
              return state.maybeWhen(
                  orElse: () => SizedBox(),
                  loading: () => Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                        ),
                      ),
                  report: (initial_balance_dt,
                      initial_balance_ct,
                      final_balance_dt,
                      final_balance_ct,
                      turnover_dt,
                      turnover_ct,
                      base64,
                      turnover_results) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.5, color: Colors.grey)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Начальный остаток",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: Text(initial_balance_dt.toString()),
                              ),
                              Text(initial_balance_ct.toString()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 1.75,
                          child: SfDataGrid(
                              columnWidthMode: ColumnWidthMode.fitByCellValue,
                              tableSummaryRows: [
                                GridTableSummaryRow(
                                    showSummaryInRow: false,
                                    title: 'Итог',
                                    titleColumnSpan: 2,
                                    columns: [
                                      const GridSummaryColumn(
                                          name: 'debit',
                                          columnName: 'debit',
                                          summaryType: GridSummaryType.sum),
                                      const GridSummaryColumn(
                                          name: 'kredit',
                                          columnName: 'kredit',
                                          summaryType: GridSummaryType.sum),
                                    ],
                                    position:
                                        GridTableSummaryRowPosition.bottom)
                              ],
                              source:
                                  BalanceDataSource(balance: turnover_results),
                              columns: [
                                GridColumn(
                                    columnName: 'id',
                                    width: 50,
                                    autoFitPadding: const EdgeInsets.all(0),
                                    label: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '№',
                                        ))),
                                GridColumn(
                                    columnName: 'registrator',
                                    width: 200,
                                    autoFitPadding: const EdgeInsets.all(0),
                                    label: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Операция',
                                        ))),
                                GridColumn(
                                    columnName: 'date',
                                    columnWidthMode:
                                        ColumnWidthMode.fitByCellValue,
                                    label: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Дата',
                                        ))),
                                GridColumn(
                                    columnName: 'debit',
                                    columnWidthMode:
                                        ColumnWidthMode.fitByCellValue,
                                    label: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Дебет',
                                        ))),
                                GridColumn(
                                    columnName: 'kredit',
                                    columnWidthMode:
                                        ColumnWidthMode.fitByCellValue,
                                    label: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Кредит',
                                        ))),
                              ]),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.5, color: Colors.grey)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Конечный остаток",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(final_balance_dt.toString()),
                              ),
                              Text(final_balance_ct.toString()),
                            ],
                          ),
                        )
                      ],
                    );
                  });
            })
          ]))),
    );
  }
}

class BalanceDataSource extends DataGridSource {
  BalanceDataSource({required List<Map<String, dynamic>> balance}) {
    _employees = balance
        .asMap()
        .entries
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.key + 1),
              DataGridCell<String>(
                  columnName: 'registrator', value: e.value['operation']),
              DataGridCell<String>(
                  columnName: 'date',
                  value: MainService.getNormalDate(e.value['date'])),
              DataGridCell<double>(
                  columnName: 'debit',
                  value: double.parse(e.value['debit'].toString())),
              DataGridCell<double>(
                  columnName: 'kredit',
                  value: double.parse(e.value['credit'].toString())),
            ]))
        .toList();
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  Widget? buildTableSummaryCellWidget(
      GridTableSummaryRow summaryRow,
      GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex,
      String summaryValue) {
    return Container(
        width: 100,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15.0),
        child: (summaryRow.columns[0].columnName == 'debit' ||
                    summaryRow.columns[1].columnName == 'kredit') &&
                summaryValue != 'Итог' &&
                summaryValue != ""
            ? Text(MainService.getNormalFormatPrice(double.parse(summaryValue)))
            : Text(summaryValue));
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        decoration: BoxDecoration(),
        width: 50,
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        child: dataGridCell.columnName == 'debit' ||
                dataGridCell.columnName == 'kredit'
            ? Text(MainService.getNormalFormatPrice(dataGridCell.value))
            : Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}
