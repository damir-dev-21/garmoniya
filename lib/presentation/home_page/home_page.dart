import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:garmoniya_pharm/domain/models/item.dart';
import 'package:garmoniya_pharm/presentation/error_page/error_page.dart';
import 'package:garmoniya_pharm/presentation/home_page/bloc/home_bloc.dart';
import 'package:garmoniya_pharm/presentation/home_page/pages/sertificate_page.dart';
import 'package:garmoniya_pharm/presentation/home_page/widgets/search_item_widget.dart';
import 'package:garmoniya_pharm/presentation/home_page/widgets/search_list_widget.dart';
import 'package:garmoniya_pharm/presentation/home_page/widgets/search_refuse_list_widget.dart';
import 'package:garmoniya_pharm/presentation/login_page/bloc/auth_bloc.dart';
import 'package:garmoniya_pharm/utils/main_service.dart';
import 'package:garmoniya_pharm/utils/router/navigator_keys.dart';
import 'package:garmoniya_pharm/utils/shared_prefs.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/item_widget.dart';
import 'widgets/search_filter_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  ScrollController scrollController_filter = ScrollController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  List<Item> items = [];
  List<Item> searchItems = [];
  List<Item> refusalItems = [];
  List<Item> filterItems = [];
  List<Item> refusalItems_search = [];
  bool isSearch = false;
  bool _isLoad = false;
  bool _isFilter = false;
  bool _showFilter = false;
  bool _isError = false;
  String _errorMessage = "";
  String _filterType = "Акция";

  // final List<Tab> myTabs = <Tab>[
  //   Tab(text: AppLocalizations.of(context)!.items),
  //   Tab(
  //     text: AppLocalizations.of(context)!.refuse_list,
  //   ),
  // ];

  @override
  void initState() {
    super.initState();
    Provider.of<HomeBloc>(context, listen: false)
        .add(const HomeEvent.getProductsOffset(0));
    Provider.of<HomeBloc>(context, listen: false)
        .add(const HomeEvent.getRefusal());
    Provider.of<HomeBloc>(context, listen: false).add(const HomeEvent.getAll());
    scrollController.addListener(scrollListener);
    scrollController_filter.addListener(scrollListener_filter);
    _controller2.text = SharedPrefs().searchText;
  }

  void scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      Provider.of<HomeBloc>(context, listen: false)
          .add(const HomeEvent.getProductsOffset(20));
    }
  }

  void scrollListener_filter() async {
    if (scrollController_filter.position.pixels ==
        scrollController_filter.position.maxScrollExtent) {
      Provider.of<HomeBloc>(context, listen: false).add(
          HomeEvent.getFilterOffset(10,
              MainService.createFilterRequest(_filterType, _controller4.text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (e) {
              setState(() {
                _isError = true;
                _errorMessage = e;
                _isLoad = false;
              });
            },
            logout: () {
              Provider.of<AuthBloc>(context, listen: false)
                  .add(const AuthEvent.logout(data: {}));
            },
            orElse: () {
              setState(() {
                _isLoad = false;
              });
            },
            loading: () {
              setState(() {
                _isLoad = true;
              });
            },
            products: (products, searchList) {
              setState(() {
                _isLoad = false;
                items = products;
                searchItems = searchList;
                isSearch = searchList.isNotEmpty ? true : false;
              });
            },
            refusal: (refusalList, refusalList_search) {
              setState(() {
                _isLoad = false;
                refusalItems = refusalList;
                refusalItems_search = refusalList_search;
                isSearch = refusalList_search.isNotEmpty ? true : false;
              });
            },
            filter: (items, searchList, total, totalCount, totalFree) {
              setState(() {
                _isLoad = false;
                filterItems = items;
                _isFilter = items.isNotEmpty ? true : false;
              });
            },
          );
        },
        child: _isError
            ? Center(
                child: Text(_errorMessage),
              )
            : Scaffold(
                // key: NavigatorKeys.homeNavigatorKey,
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  toolbarHeight: 0,
                  backgroundColor: mainColor,
                  bottom: TabBar(
                    tabs: [
                      Tab(text: AppLocalizations.of(context)!.items),
                      Tab(
                        text: AppLocalizations.of(context)!.refuse_list,
                      ),
                    ],
                    indicatorColor: Colors.white,
                  ),
                ),
                // floatingActionButton: _isLoad ? LoadingWidget() : SizedBox(),
                // floatingActionButtonLocation:
                //     FloatingActionButtonLocation.centerDocked,

                body: TabBarView(
                  dragStartBehavior: DragStartBehavior.down,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Tab(text: AppLocalizations.of(context)!.items),
                    Tab(
                      text: AppLocalizations.of(context)!.refuse_list,
                    ),
                  ].map((Tab tab) {
                    final String label = tab.text!;
                    if (label == AppLocalizations.of(context)!.items) {
                      return _buildProductsTab(context);
                    } else if (label ==
                        AppLocalizations.of(context)!.refuse_list) {
                      return _buildRefuceTab(context);
                    }
                    return const SizedBox();
                  }).toList(),
                ),
              ),
      ),
    );
  }

  Column _buildRefuceTab(BuildContext context) {
    return Column(
      children: [
        RefreshIndicator(
          onRefresh: () async {
            Provider.of<HomeBloc>(context, listen: false)
                .add(const HomeEvent.getRefusal());
          },
          child: Container(
            margin:
                const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    controller: _controller3,
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

                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEvent.getRefuseListProductSearch(0, e));
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
                            _controller3.text = "";
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
          ),
        ),
        _isLoad ? LoadingWidget() : SizedBox(),
        isSearch
            ? SearchRefuseListWidget(
                searchText: _controller3.text,
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            // controller: scrollController,
                            itemCount: refusalItems.length,
                            itemBuilder: (ctx, i) {
                              final Item item = refusalItems[i];
                              if (i < refusalItems.length) {
                                return SearchItemWidget(
                                  product: item,
                                  isRefuse: true,
                                  isFilter: false,
                                );
                              }
                            })),
                  ],
                ),
              ),
      ],
    );
  }

  RefreshIndicator _buildProductsTab(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: () async {
        Provider.of<HomeBloc>(context, listen: false)
            .add(const HomeEvent.clearAll());

        Provider.of<HomeBloc>(context, listen: false)
            .add(const HomeEvent.getProductsOffset(0));
      },
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                child: Stack(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: _isFilter
                                  ? TextField(
                                      controller: _controller2,
                                      onEditingComplete: () {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      },
                                      onChanged: (e) {
                                        if (e == '') {
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
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
                                          "filter_type_load":
                                              _filterType == 'Акция'
                                                  ? 'promotion'
                                                  : 'load',
                                          "filter_type_load_no_main":
                                              _filterType == 'Нагрузка'
                                                  ? 'load'
                                                  : '',
                                          if (_filterType == 'Нагрузка')
                                            "filter_group_no_main": _controller4
                                                        .text ==
                                                    ""
                                                ? ""
                                                : int.parse(_controller4.text)
                                          else
                                            "filter_group": _controller4.text ==
                                                    ""
                                                ? ""
                                                : int.parse(_controller4.text)
                                        }));
                                      },
                                      cursorColor: textColorDark,
                                      decoration: InputDecoration(
                                        focusColor: mainColor,
                                        labelStyle: const TextStyle(
                                            color: textColorDark),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: textColorDark),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10),
                                        labelText: AppLocalizations.of(context)!
                                            .search,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    )
                                  : TextField(
                                      controller: _controller2,
                                      onEditingComplete: () {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      },
                                      onChanged: (e) {
                                        if (e == '') {
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                        }

                                        setState(() {
                                          if (e != '') {
                                            isSearch = true;
                                          } else {
                                            isSearch = false;
                                          }
                                        });

                                        BlocProvider.of<HomeBloc>(context).add(
                                            HomeEvent.getProductsSearch(0, e));
                                        SharedPrefs().searchText = e;
                                      },
                                      cursorColor: textColorDark,
                                      decoration: InputDecoration(
                                        focusColor: mainColor,
                                        labelStyle: const TextStyle(
                                            color: textColorDark),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: textColorDark),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10),
                                        labelText: AppLocalizations.of(context)!
                                            .search,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                            ),
                            _controller2.text.isNotEmpty
                                ? Positioned(
                                    right: 5,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _controller2.text = "";
                                            isSearch = false;
                                          });
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                          SharedPrefs().searchText = "";
                                          Provider.of<HomeBloc>(context,
                                                  listen: false)
                                              .add(const HomeEvent
                                                  .clearAllSearch());
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.grey,
                                        )))
                                : SizedBox(),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showFilter = true;
                                });
                              },
                              child: Icon(Icons.filter_alt_sharp)),
                        ),
                      ],
                    ),
                    _isFilter
                        ? Positioned(
                            right: -15,
                            bottom: 15,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isFilter = false;
                                  });
                                  Provider.of<HomeBloc>(context, listen: false)
                                      .add(const HomeEvent.clearFilter());
                                },
                                icon: Icon(
                                  Icons.close,
                                  size: 15,
                                  color: Colors.red,
                                  weight: 600,
                                )))
                        : SizedBox(),
                  ],
                ),
              ),
              searchItems.isNotEmpty || isSearch
                  ? _isFilter
                      ? SearchFilterListWidget(
                          searchText: _controller2.text,
                          data: MainService.createFilterRequest(
                              _filterType, _controller4.text),
                        )
                      :
                      // _isLoad
                      //     ? SizedBox(
                      //         width: MediaQuery.of(context).size.width,
                      //         height: MediaQuery.of(context).size.height / 2,
                      //         child: Center(child: CircularProgressIndicator()))
                      //     :
                      SearchListWidget(
                          searchText: _controller2.text,
                        )
                  : _isFilter
                      ? ListItems(
                          scrollController: scrollController_filter,
                          items: filterItems,
                          isFilter: _isFilter)
                      : ListItems(
                          scrollController: scrollController,
                          items: items,
                          isFilter: _isFilter),
            ],
          ),
          _isLoad ? LoadingWidget() : SizedBox(),
          _showFilter
              ? Positioned(
                  top: 10,
                  right: 10,
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        width: 200,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 0.5, color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 160,
                              child: DropdownButton(
                                  isExpanded: true,
                                  alignment: AlignmentDirectional.centerStart,
                                  value: _filterType,
                                  items: const [
                                    DropdownMenuItem(
                                        value: "Акция", child: Text("Акция")),
                                    DropdownMenuItem(
                                      value: "Ходовой",
                                      child: Text("Ходовой"),
                                    ),
                                    DropdownMenuItem(
                                      value: "Нагрузка",
                                      child: Text("Нагрузка"),
                                    ),
                                    DropdownMenuItem(
                                      value: "Ассортиментный",
                                      child: Text("Ассортиментный"),
                                    ),
                                  ],
                                  onChanged: (e) {
                                    setState(() {
                                      _filterType = e!;
                                      // scrollController =
                                      //     scrollController_filter;
                                    });
                                    BlocProvider.of<HomeBloc>(context)
                                        .add(const HomeEvent.clearFilter());
                                    BlocProvider.of<HomeBloc>(context).add(
                                        HomeEvent.getFilterProducts(
                                            MainService.createFilterRequest(
                                                _filterType,
                                                _controller4.text)));
                                  }),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       "Группа",
                            //       style: TextStyle(fontSize: 16),
                            //     ),
                            //     SizedBox(
                            //       width: 100,
                            //       child: TextFormField(
                            //         controller: _controller4,
                            //         keyboardType: TextInputType.number,
                            //         onEditingComplete: () {
                            //           if (_controller4.text == "" ||
                            //               _controller4.text == 0) {
                            //             setState(() {
                            //               _isFilter = false;
                            //             });
                            //             return;
                            //           }
                            //           BlocProvider.of<HomeBloc>(context).add(
                            //               HomeEvent.getFilterProducts(
                            //                   MainService.createFilterRequest(
                            //                       _filterType,
                            //                       _controller4.text)));
                            //           setState(() {
                            //             _isFilter = true;
                            //             _showFilter = false;
                            //           });
                            //           FocusScope.of(context)
                            //               .requestFocus(FocusNode());
                            //         },
                            //       ),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      Positioned(
                          right: 1,
                          top: 1,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _showFilter = false;
                                // scrollController = ScrollController();
                                // scrollController.addListener(scrollListener);
                              });
                            },
                            icon: Icon(
                              Icons.close,
                              size: 17,
                            ),
                          ))
                    ],
                  ))
              : SizedBox()
        ],
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({
    super.key,
    required this.scrollController,
    required this.items,
    required bool isFilter,
  }) : _isFilter = isFilter;

  final ScrollController scrollController;
  final List<Item> items;
  final bool _isFilter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: MediaQuery.of(context).size.height - 220,
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
                        isFilter: _isFilter,
                      );
                    }
                  })),
        ],
      ),
    );
  }
}

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthBloc>(context, listen: false)
        .add(const AuthEvent.checkAuth());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          color: mainColor,
        ),
      ),
    );
  }
}
