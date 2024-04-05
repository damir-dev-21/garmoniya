import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/item.dart';
import '../../login_page/bloc/auth_bloc.dart';
import '../bloc/home_bloc.dart';
import 'search_item_widget.dart';

class SearchFilterListWidget extends StatefulWidget {
  SearchFilterListWidget(
      {Key? key, required this.searchText, required this.data})
      : super(key: key);
  final String searchText;
  final data;
  @override
  State<SearchFilterListWidget> createState() => _SearchFilterListWidgetState();
}

class _SearchFilterListWidgetState extends State<SearchFilterListWidget> {
  final scrollController = ScrollController();
  List<Item> search_items = [];

  void scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // setState(() {
      //   page = page + 1;
      // });
      //await operationsProvider.getOperations(page);
      Provider.of<HomeBloc>(context, listen: false).add(
          HomeEvent.getFilterSearchOffset(10, widget.searchText, widget.data));
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listener: (ctx, state) {
          state.maybeWhen(
            logout: () {
              Provider.of<AuthBloc>(context, listen: false)
                  .add(const AuthEvent.logout(data: {}));
            },
            orElse: () {},
            filter: (items, filter_search_item, total, totalCount, totalFree) {
              setState(() {
                search_items = filter_search_item;
              });
            },
          );
        },
        child: Expanded(
          child: ListView.builder(
              controller: scrollController,
              itemCount: search_items.length,
              itemBuilder: (ctx, index) {
                final product = search_items[index];

                return SearchItemWidget(
                  product: product,
                  isRefuse: false,
                  isFilter: true,
                );
              }),
        ));
  }
}
