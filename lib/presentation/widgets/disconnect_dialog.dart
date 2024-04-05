import 'package:flutter/material.dart';
import 'package:garmoniya_pharm/bloc/connectivity_bloc.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:provider/provider.dart';

class DisconnectedDialog extends StatelessWidget {
  const DisconnectedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Нет сети',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFF7F7F7),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Проверьте подключение к сети',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFF7F7F7),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.40,
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateColor.resolveWith((states) => mainColor)),
                onPressed: () {
                  Provider.of<InternetBloc>(context, listen: false)
                      .add(OnCheckConnection());
                },
                child: const Text("Обновить"))
          ],
        ),
      ),
    );
  }
}
