import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../domain/models/item.dart';
import '../../login_page/bloc/auth_bloc.dart';
import '../bloc/home_bloc.dart';
import 'search_item_widget.dart';

class SearchListWidget extends StatefulWidget {
  SearchListWidget({Key? key, required this.searchText}) : super(key: key);
  final String searchText;
  @override
  State<SearchListWidget> createState() => _SearchListWidgetState();
}

class _SearchListWidgetState extends State<SearchListWidget> {
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
          .add(HomeEvent.getProductsSearchOffset(10, widget.searchText));
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    Provider.of<HomeBloc>(context, listen: false).add(const HomeEvent.getAll());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listener: (ctx, state) {
          state.maybeWhen(
            orElse: () {},
            logout: () {
              Provider.of<AuthBloc>(context, listen: false)
                  .add(const AuthEvent.logout(data: {}));
            },
            products: (products, searchList) {
              setState(() {
                search_items = searchList;
              });
            },
          );
        },
        child: search_items.isEmpty
            ? Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: Text(AppLocalizations.of(context)!.noting_found),
                ),
              )
            : Expanded(
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: search_items.length,
                    itemBuilder: (ctx, index) {
                      final product = search_items[index];

                      return SearchItemWidget(
                        product: product,
                        isRefuse: false,
                        isFilter: false,
                      );
                    }),
              ));
  }
}
