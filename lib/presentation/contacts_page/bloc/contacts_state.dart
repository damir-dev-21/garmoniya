part of 'contacts_bloc.dart';

@freezed
class ContactsState with _$ContactsState {
  const factory ContactsState.initial() = _Initial;
  const factory ContactsState.loading() = _Loading;
  const factory ContactsState.error() = _Error;
  const factory ContactsState.logout() = _Logout;
  const factory ContactsState.contacts(List<Map<String, dynamic>> contacts) =
      _Contacts;
}
