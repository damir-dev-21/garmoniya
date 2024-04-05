import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:garmoniya_pharm/data/local/hive_local.dart';
import 'package:garmoniya_pharm/domain/classes/language_constants.dart';
import 'package:garmoniya_pharm/presentation/act_sverki_page/act_sverki_page.dart';
import 'package:garmoniya_pharm/presentation/app.dart';
import 'package:garmoniya_pharm/presentation/contacts_page/contacts_page.dart';
import 'package:garmoniya_pharm/presentation/login_page/bloc/auth_bloc.dart';
import 'package:garmoniya_pharm/presentation/login_page/login_page.dart';
import 'package:garmoniya_pharm/presentation/price_page/price_page.dart';
import 'package:garmoniya_pharm/presentation/reference_page/reference_page.dart';
import 'package:garmoniya_pharm/presentation/settings_page/settings_page.dart';
import 'package:garmoniya_pharm/utils/main_service.dart';
import 'package:garmoniya_pharm/utils/router/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../cart_page/bloc/cart_bloc.dart';
import '../home_page/bloc/home_bloc.dart';
import 'widgets/profile_item_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    // Provider.of<AuthBloc>(context, listen: false).add(const AuthEvent.sync());
    Provider.of<AuthBloc>(context, listen: false)
        .add(const AuthEvent.checkAuth());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text(AppLocalizations.of(context)!.profile),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<AuthBloc>(context, listen: false)
                      .add(const AuthEvent.sync());
                  Provider.of<AuthBloc>(context, listen: false)
                      .add(const AuthEvent.checkAuth());

                  // Provider.of<HomeBloc>(context, listen: false)
                  //     .add(const HomeEvent.getProductsOffset(20));
                  // Provider.of<HomeBloc>(context, listen: false)
                  //     .add(const HomeEvent.getRefusal());
                  // Provider.of<CartBloc>(context, listen: false)
                  //     .add(const CartEvent.getCartEvent());
                },
                icon: const Icon(Icons.sync))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Provider.of<AuthBloc>(context).add(const AuthEvent.sync());
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                      return state.maybeWhen(
                          orElse: () => ProfileListItem(false, ProfilePage(),
                              "💵 ${AppLocalizations.of(context)!.report}"),
                          authorized: (user, contacts) {
                            return ProfileListItem(
                              user?.access_act_sverki ?? false,
                              () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ActSverkiPage();
                                }));
                              },
                              '💵 ${AppLocalizations.of(context)!.report}',
                            );
                          });
                    }),
                    ProfileListItem(
                      true,
                      () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PricePage();
                        }));
                      },
                      '🤑 ${AppLocalizations.of(context)!.price_list}',
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return state.maybeWhen(orElse: () {
                          return ProfileListItem(
                            false,
                            () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ContactsPage();
                              }));
                            },
                            '👥 ${AppLocalizations.of(context)!.contacts}',
                          );
                        }, authorized: (user, contacts) {
                          return ProfileListItem(
                            user?.type_user == 'client' ? true : false,
                            () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ContactsPage();
                              }));
                            },
                            '👥 ${AppLocalizations.of(context)!.contacts}',
                          );
                        });
                      },
                    ),
                    ProfileListItem(
                      true,
                      () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ReferencePage();
                        }));
                      },
                      '✍🏻 ${AppLocalizations.of(context)!.review}',
                    ),
                    ProfileListItem(
                      true,
                      () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SettingsPage();
                        }));
                      },
                      '🛠️ ${AppLocalizations.of(context)!.settings}',
                    ),
                    ProfileListItem(
                      true,
                      () {
                        if (HiveLocal().getUserFromDb() == null) {
                          GoRouter.of(context).go('/login');
                        } else {
                          Provider.of<AuthBloc>(context, listen: false)
                              .add(const AuthEvent.logout(data: {}));
                        }
                      },
                      '🏃🏻 ${HiveLocal().getUserFromDb() == null ? AppLocalizations.of(context)!.login : AppLocalizations.of(context)!.logout}',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
