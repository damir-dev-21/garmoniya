import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/item.dart';
import '../../login_page/bloc/auth_bloc.dart';
import '../bloc/home_bloc.dart';
import 'search_item_widget.dart';

class SearchRefuseListWidget extends StatefulWidget {
  SearchRefuseListWidget({Key? key, required this.searchText})
      : super(key: key);
  final String searchText;
  @override
  State<SearchRefuseListWidget> createState() => _SearchRefuseListWidgetState();
}

class _SearchRefuseListWidgetState extends State<SearchRefuseListWidget> {
  final scrollController = ScrollController();
  List<Item> search_items = [];

  void scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // setState(() {
      //   page = page + 1;
      // });
      //await operationsProvider.getOperations(page);
      Provider.of<HomeBloc>(context, listen: false)
          .add(HomeEvent.getProductsRefuseSearchOffset(10, widget.searchText));
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
            refusal: (refuse_list, refuse_list_search) {
              setState(() {
                search_items = refuse_list_search;
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
                  isRefuse: true,
                  isFilter: false,
                );
              }),
        ));
  }
}
