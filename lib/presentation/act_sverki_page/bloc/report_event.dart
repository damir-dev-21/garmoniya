part of 'report_bloc.dart';

@freezed
class ReportEvent with _$ReportEvent {
  const factory ReportEvent.getData(Map<String, dynamic> data) = _GetData;
}
