part of 'report_bloc.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState.initial() = _Initial;
  const factory ReportState.loading() = _Loading;
  const factory ReportState.error(e) = _Error;
  const factory ReportState.logout() = _Logout;
  const factory ReportState.report(
      String initial_balance_dt,
      String initial_balance_ct,
      String final_balance_dt,
      String final_balance_ct,
      String turnover_dt,
      String turnover_ct,
      String base64,
      List<Map<String, dynamic>> turnover_results) = _Report;
}
