import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';
part 'contacts_bloc.freezed.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(_Initial()) {
    on<ContactsEvent>((event, emit) async {
      await event.map(getData: (event) async => await _getData(event, emit));
    });
  }
  List<Map<String, dynamic>> contacts = [];

  _getData(_GetData event, Emitter<ContactsState> emit) {
    List<Map<String, dynamic>> _localContacts = [
      {
        'name': 'Олимов Мухаммад',
        'post': 'Руководитель',
        'phone': "+998 91 123 23 23"
      },
      {
        'name': 'Туйчиев Дамир',
        'post': 'Программист',
        'phone': "+998 91 123 23 23"
      },
      {
        'name': 'Абдурахимов Давлатжон ',
        'post': 'Программист',
        'phone': "+998 91 123 23 23"
      },
    ];

    List<Map<String, dynamic>> newList = [];
    newList = [..._localContacts];
    emit(ContactsState.contacts(newList));
  }
}
