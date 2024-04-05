import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:garmoniya_pharm/domain/models/order.dart';
import 'package:garmoniya_pharm/presentation/orders_page/bloc/orders_bloc.dart';
import 'package:garmoniya_pharm/utils/shared_prefs.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home_page/home_page.dart';
import '../login_page/bloc/auth_bloc.dart';
import 'widgets/order_item_widget.dart';

class OrdersPage extends StatefulWidget {
  OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  ScrollController _scrollController = ScrollController();
  List<Order> _orders = [];
  List<Order> _filterOrders = [];
  List<Map<String, dynamic>> _statuses = [];
  String valueOfFilter = "new";

  bool _isLoading = false;
  bool _isError = false;
  bool _isFilter = false;

  String _errorMessage = "";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(scrollListener);
    Provider.of<OrdersBloc>(context, listen: false)
        .add(const OrdersEvent.getOrders());
  }

  void scrollListener() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      Order lastOrder =
          _filterOrders.isNotEmpty ? _filterOrders.last : _orders.last;
      String offsetRequest = "${lastOrder.date}_${lastOrder.number}";
      if (_filterOrders.isNotEmpty) {
        Provider.of<OrdersBloc>(context, listen: false).add(
            OrdersEvent.getOrdersFilterOffset(offsetRequest, valueOfFilter));
      } else {
        Provider.of<OrdersBloc>(context, listen: false)
            .add(OrdersEvent.getOrdersOffset(offsetRequest));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersBloc, OrdersState>(
      listener: (context, state) {
        state.maybeWhen(orElse: () {
          setState(() {
            _isError = false;
            _isLoading = false;
          });
        }, loading: () {
          setState(() {
            _isLoading = true;
          });
        }, logout: () {
          Provider.of<AuthBloc>(context, listen: false)
              .add(const AuthEvent.logout(data: {}));
        }, error: (e) {
          setState(() {
            _isError = true;
            _errorMessage = e;
          });
        }, getOrders: (orders, filterOrders, statuses) {
          setState(() {
            _isError = false;
            _orders = orders;
            _filterOrders = filterOrders;
            _statuses = statuses;
            _isLoading = false;
          });
        });
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.my_orders),
          actions: [
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.white),
              child: DropdownButton(
                  underline: SizedBox(),
                  value: valueOfFilter,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  items: List.generate(
                      _statuses.length,
                      (index) => DropdownMenuItem(
                          value: _statuses[index]['value'],
                          child: Text(_statuses[index]['name']
                              [SharedPrefs().locale]))).toList(),
                  onChanged: (e) {
                    setState(() {
                      _isFilter = true;
                      valueOfFilter = e.toString();
                    });
                    Provider.of<OrdersBloc>(context, listen: false)
                        .add(OrdersEvent.getOrdersFilter(valueOfFilter));
                  }),
            )
          ],
        ),
        body: _isError
            ? Center(
                child: Text(_errorMessage),
              )
            : LayoutBuilder(builder: (context, constraints) {
                return RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      _isFilter = false;
                    });
                    Provider.of<OrdersBloc>(context, listen: false)
                        .add(const OrdersEvent.getOrders());
                  },
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(maxHeight: constraints.maxHeight),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Expanded(
                                  child: ListView.builder(
                                      controller: _scrollController,
                                      itemCount: _isFilter
                                          ? _filterOrders.length
                                          : _orders.length,
                                      itemBuilder: (ctx, index) {
                                        final order = _isFilter
                                            ? _filterOrders[index]
                                            : _orders[index];
                                        Map<String, dynamic> status = {
                                          'title': order.status['name']
                                              [SharedPrefs().locale],
                                          'color': order.status['color'] ==
                                                      '' ||
                                                  order.status['color'] == null
                                              ? '#fff'
                                              : order.status['color'],
                                          'textColor': Colors.black
                                        };

                                        return OrderItem(
                                          order: order,
                                          status: status,
                                        );
                                      }))
                            ],
                          ),
                          _isLoading ? LoadingWidget() : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                );
              }),
      ),
    );
  }
}
