import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:garmoniya_pharm/presentation/cart_page/cart_page.dart';
import 'package:garmoniya_pharm/presentation/home_page/bloc/home_bloc.dart';
import 'package:garmoniya_pharm/presentation/home_page/home_page.dart';
import 'package:garmoniya_pharm/utils/router/route_utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../data/config/colors.dart';
import '../../../domain/models/item.dart';
import '../../login_page/bloc/auth_bloc.dart';
import '../widgets/search_filter_list_widget.dart';
import '../widgets/search_item_widget.dart';
import '../widgets/search_refuse_list_widget.dart';

class FilterPage extends StatefulWidget {
  FilterPage(
      {Key? key,
      required this.type,
      required this.group,
      required this.request,
      required this.toBody})
      : super(key: key);
  final type;
  final group;
  final request;
  final toBody;
  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final TextEditingController _controller = TextEditingController();
  final scrollController = ScrollController();
  bool isSearch = false;
  bool _isLoad = false;
  double _total = 0;
  double _totalFree = 0;
  List<Item> items = [];
  late Map<String, dynamic> data;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    data = widget.toBody ?? {};
    BlocProvider.of<HomeBloc>(context).add(HomeEvent.getFilterProducts(data));
  }

  void scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      Provider.of<HomeBloc>(context, listen: false)
          .add(HomeEvent.getFilterOffset(10, data));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        state.maybeWhen(
            logout: () {
              Provider.of<AuthBloc>(context, listen: false)
                  .add(const AuthEvent.logout(data: {}));
            },
            orElse: () => const SizedBox(),
            loading: () {
              setState(() {
                _isLoad = true;
              });
              const Center(
                  child: CircularProgressIndicator(
                color: mainColor,
              ));
            },
            filter:
                (filterProducts, filterSearch, total, totalCount, totalFree) {
              setState(() {
                _isLoad = false;
                items = filterProducts;
                _total = widget.type == 'load' ? total : totalCount;
                _totalFree = totalFree;
              });
            });
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: _isLoad
            ? LoadingWidget()
            : ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateColor.resolveWith((states) => mainColor)),
                onPressed: () {
                  Provider.of<HomeBloc>(context, listen: false)
                      .add(const HomeEvent.clearFilter());
                  Navigator.pop(context);
                },
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white),
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
            child: Column(
          children: [
            // Container(
            //   height: 35,
            //   decoration: BoxDecoration(color: mainColor),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       Container(
            //         margin: const EdgeInsets.all(4),
            //         padding: const EdgeInsets.symmetric(horizontal: 5),
            //         alignment: Alignment.center,
            //         height: double.infinity,
            //         decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(2)),
            //         child: Text(
            //             "${AppLocalizations.of(context)!.request_total} ${widget.request}"),
            //       ),
            //       Container(
            //           margin: const EdgeInsets.all(3),
            //           padding: const EdgeInsets.symmetric(horizontal: 5),
            //           alignment: Alignment.center,
            //           height: double.infinity,
            //           decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.circular(2)),
            //           child: Text(
            //               "${AppLocalizations.of(context)!.input_total}: ${_total}")),
            //       widget.type == 'promotion'
            //           ? Container(
            //               margin: const EdgeInsets.all(3),
            //               padding: const EdgeInsets.symmetric(horizontal: 5),
            //               alignment: Alignment.center,
            //               height: double.infinity,
            //               decoration: BoxDecoration(
            //                   color: Colors.white,
            //                   borderRadius: BorderRadius.circular(2)),
            //               child: Text("Введено(бесп): ${_totalFree}"))
            //           : SizedBox()
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextField(
                    controller: _controller,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    onChanged: (e) {
                      if (e == '') {
                        FocusScope.of(context).requestFocus(FocusNode());
                      }

                      setState(() {
                        if (e != '') {
                          isSearch = true;
                        } else {
                          isSearch = false;
                        }
                      });

                      BlocProvider.of<HomeBloc>(context).add(
                          HomeEvent.getFilterSearch(0, e, {
                        "filter_type_load": widget.type,
                        "filter_group": widget.group
                      }));
                    },
                    cursorColor: textColorDark,
                    decoration: InputDecoration(
                      focusColor: mainColor,
                      labelStyle: const TextStyle(color: textColorDark),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: textColorDark),
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      labelText: AppLocalizations.of(context)!.search,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Positioned(
                    right: 5,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            _controller.text = "";
                            isSearch = false;
                          });
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.grey,
                        ))),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            isSearch
                ? SearchFilterListWidget(
                    searchText: _controller.text,
                    data: data,
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height - 220,
                    child: Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                                controller: scrollController,
                                itemCount: items.length,
                                itemBuilder: (ctx, i) {
                                  final Item item = items[i];
                                  if (i < items.length) {
                                    return SearchItemWidget(
                                      product: item,
                                      isRefuse: false,
                                      isFilter: true,
                                    );
                                  }
                                })),
                      ],
                    ),
                  ),
          ],
        )),
      ),
    );
  }
}
