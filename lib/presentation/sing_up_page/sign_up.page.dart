import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/config/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObsured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Регистрация",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  key: const ValueKey('email'),
                  onChanged: (e) {},
                  cursorColor: textColorDark,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.login_title,
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
                  keyboardType: TextInputType.text,
                  key: const ValueKey('password'),
                  onChanged: (text) {},
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
                          isObsured ? Icons.visibility : Icons.visibility_off,
                          color: textColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            isObsured = !isObsured;
                          });
                        },
                      ),
                      labelText: AppLocalizations.of(context)!.login_password,
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
                  Navigator.pop(context);
                },
                child: Container(
                    key: const ValueKey('signIn'),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: Text(
                        "Зарегистрироваться",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )),
              ),
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
    );
  }
}
