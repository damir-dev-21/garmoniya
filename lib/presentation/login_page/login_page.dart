import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:garmoniya_pharm/presentation/sing_up_page/sign_up.page.dart';
import 'package:garmoniya_pharm/utils/shared_prefs.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/dialog_state.dart';
import 'bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  bool isObsured = true;
  late FToast fToast;
  bool _isLoading = false;

  String name = '';
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    _controller.text = SharedPrefs().username;
    _controller2.text = SharedPrefs().password;
    name = _controller.text;
    password = _controller2.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(orElse: () {
            // setState(() {
            //   _isLoading = true;
            // });
          }, loading: () {
            setState(() {
              _isLoading = true;
            });
          }, unauthorized: (e) {
            setState(() {
              _isLoading = false;
            });
            if (DialogState().isOpen(context)) {
              Navigator.pop(context);
            }
            Widget toast = Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.redAccent,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Center(
                      child: Text(
                        e,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            );
            fToast.showToast(
              child: toast,
              gravity: ToastGravity.TOP,
              toastDuration: const Duration(seconds: 2),
            );
          });
        },
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              )
            : SafeArea(
                child: Stack(children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.login,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        child: TextFormField(
                          controller: _controller,
                          keyboardType: TextInputType.emailAddress,
                          key: const ValueKey('email'),
                          onChanged: (e) {
                            setState(() {
                              name = e;
                            });
                            SharedPrefs().username = e;
                          },
                          cursorColor: textColorDark,
                          decoration: InputDecoration(
                              labelText:
                                  AppLocalizations.of(context)!.login_title,
                              focusColor: mainColor,
                              labelStyle: const TextStyle(color: textColorDark),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: textColorDark),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        child: TextField(
                          controller: _controller2,
                          keyboardType: TextInputType.text,
                          key: const ValueKey('password'),
                          onChanged: (text) {
                            setState(() {
                              password = text;
                            });
                            SharedPrefs().password = text;
                          },
                          cursorColor: textColorDark,
                          obscureText: isObsured,
                          decoration: InputDecoration(
                              focusColor: mainColor,
                              labelStyle: const TextStyle(color: textColorDark),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: textColorDark),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              suffixIconColor: mainColor,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isObsured
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: textColorDark,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isObsured = !isObsured;
                                  });
                                },
                              ),
                              labelText:
                                  AppLocalizations.of(context)!.login_password,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      GestureDetector(
                        onTap: () async {
                          // await authProvider.login(name, password, context);

                          // showToastMessage(fToast, context);
                          BlocProvider.of<AuthBloc>(context).add(
                            AuthEvent.login(
                              data: {
                                "username": name,
                                "password": password,
                              },
                            ),
                          );
                        },
                        child:
                            // context.read<AuthProvider>().isLoad
                            //     ? const Center(
                            //         child: CircularProgressIndicator(),
                            //       )
                            //     :
                            Container(
                                key: const ValueKey('signIn'),
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                  child: _isLoading
                                      ? CircularProgressIndicator(
                                          color: Colors.orange,
                                        )
                                      : Text(
                                          AppLocalizations.of(context)!.login,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                )),
                      ),
                      Platform.isIOS
                          ? Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SignUpScreen();
                                    }));
                                  },
                                  child: Text("Зарегистрироваться")),
                            )
                          : SizedBox()
                    ],
                  ),
                ),
                Positioned(
                    bottom: 30,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                const Text("Powered by Venons"),
                                Image.asset("assets/images/primary_logo.png",
                                    width: 70),
                              ],
                            )))),
                Positioned(
                    top: 0,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/logo.png",
                                  width: 200,
                                  height: 200,
                                ),
                              ],
                            )))),
              ])),
      ),
    );
  }
}

class LoginProgressDialog extends StatelessWidget {
  const LoginProgressDialog({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: mainColor,
            ), // Индикатор загрузки
          ],
        ),
      ),
    );
  }
}
