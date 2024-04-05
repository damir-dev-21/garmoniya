import 'package:flutter/material.dart';

class NetworkDisabledPage extends StatelessWidget {
  const NetworkDisabledPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Нет сети',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFF7F7F7),
                fontSize: 24,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Проверьте подключение к сети',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFF7F7F7),
              fontSize: 14,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w400,
              letterSpacing: -0.40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Image.asset('assets/images/network_disabled.png'),
          ),
        ],
      ),
    );
  }
}
