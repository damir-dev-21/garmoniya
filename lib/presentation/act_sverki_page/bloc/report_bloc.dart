import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garmoniya_pharm/data/repository/report_repository_impl.dart';
import 'package:garmoniya_pharm/utils/main_service.dart';

part 'report_event.dart';
part 'report_state.dart';
part 'report_bloc.freezed.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportRepositoryImpl reportRepositoryImpl = ReportRepositoryImpl();
  ReportBloc({required this.reportRepositoryImpl}) : super(_Initial()) {
    on<ReportEvent>((event, emit) async {
      await event.map(getData: (event) async => await _getData(event, emit));
    });
  }

  String initial_balance_dt = "";
  String initial_balance_ct = "";
  String final_balance_dt = "";
  String final_balance_ct = "";
  String turnover_dt = "";
  String turnover_ct = "";
  List<dynamic> turnover_results = [];
  String _fileBase64 = "";

  _getData(_GetData event, Emitter<ReportState> emit) async {
    emit(const ReportState.loading());
    final dataResponce = await reportRepositoryImpl.getData(event.data);

    if (dataResponce['status']) {
      String initial_balance_dt = MainService.getNormalFormatPrice(
          dataResponce['data']['initial_balance_dt']);
      String initial_balance_ct = MainService.getNormalFormatPrice(
          dataResponce['data']['initial_balance_ct']);
      String final_balance_dt = MainService.getNormalFormatPrice(
          dataResponce['data']['final_balance_dt']);
      String final_balance_ct = MainService.getNormalFormatPrice(
          dataResponce['data']['final_balance_ct']);
      String turnover_dt =
          MainService.getNormalFormatPrice(dataResponce['data']['turnover_dt']);
      String turnover_ct =
          MainService.getNormalFormatPrice(dataResponce['data']['turnover_ct']);
      turnover_results = dataResponce['data']['turnover_results'];
      _fileBase64 = dataResponce['base64'];
      final List<Map<String, dynamic>> newList;
      newList = [...turnover_results];
      emit(ReportState.report(
          initial_balance_dt,
          initial_balance_ct,
          final_balance_dt,
          final_balance_ct,
          turnover_dt,
          turnover_ct,
          _fileBase64,
          newList));
    }
  }
}
