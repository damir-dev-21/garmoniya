import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garmoniya_pharm/presentation/contacts_page/bloc/contacts_bloc.dart';
import 'package:garmoniya_pharm/presentation/login_page/bloc/auth_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactsPage extends StatefulWidget {
  ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthBloc>(context, listen: false).add(AuthEvent.sync());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.contacts),
        centerTitle: true,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(builder: (ctx, state) {
        return state.maybeWhen(
            orElse: () => SizedBox(),
            loading: () => Center(child: CircularProgressIndicator()),
            authorized: (user, contacts) {
              return SafeArea(
                  child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: contacts.length,
                          itemBuilder: (ctx, i) {
                            return ListTile(
                              title: Text(contacts[i]['name']),
                              subtitle: Text(contacts[i]['position']),
                              trailing: Text(contacts[i]['phone']),
                            );
                          })),
                ],
              ));
            });
      }),
    );
  }
}
