import 'package:flutter/material.dart';

class OffLineWidget extends StatelessWidget {
  const OffLineWidget({super.key, required this.connected});
  final bool connected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              height: 24.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                color: connected
                    ? const Color(0xFF00EE44)
                    : const Color(0xFFEE4400),
                child: Center(
                  child: Text(connected ? 'ONLINE' : 'OFFLINE'),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: Image.asset(
                      'assets/images/offline.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Turn on your WiFi or mobile network',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
