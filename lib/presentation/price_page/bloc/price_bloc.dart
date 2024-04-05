import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garmoniya_pharm/data/repository/price_repository_impl.dart';

part 'price_event.dart';
part 'price_state.dart';
part 'price_bloc.freezed.dart';

class PriceBloc extends Bloc<PriceEvent, PriceState> {
  PriceRepositoryImpl priceRepositoryImpl = PriceRepositoryImpl();
  PriceBloc({required this.priceRepositoryImpl}) : super(_Initial()) {
    on<PriceEvent>((events, emit) async {
      await events.map(
        getPrice: (event) => _getPrices(event, emit),
      );
    });
  }
  List<Map<String, dynamic>> _prices = [];
  _getPrices(_GetPrice event, Emitter<PriceState> emit) async {
    emit(const PriceState.loading());
    Map<String, dynamic> prices = await priceRepositoryImpl.getPrice();

    if (prices['status']) {
      // local_products = products['products'];
      _prices.clear();
      prices['price'].forEach((e) {
        _prices.add(e);
      });

      final List<Map<String, dynamic>> newList;

      newList = [..._prices];

      emit(PriceState.prices(newList));
    } else if (!prices['isAuth']) {
      emit(const PriceState.logout());
    } else {
      emit(PriceState.error(prices['message']));
    }
  }
}
