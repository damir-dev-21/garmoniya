import 'package:flutter/material.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:provider/provider.dart';

import '../login_page/bloc/auth_bloc.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthBloc>(context, listen: false)
        .add(const AuthEvent.checkAuth());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: mainColor,
        ),
      ),
    );
  }
}
