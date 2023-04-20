import 'package:flutter/material.dart';
import 'package:news/presentation/src/resources.dart';

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
              height: AppHeights.h24,
              left: AppSizes.s0,
              right: AppSizes.s0,
              child: Container(
                color: connected ? ColorManager.green : ColorManager.red,
                child: Center(
                  child:
                      Text(connected ? AppStrings.online : AppStrings.offline),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AppHeights.h300,
                    child: Image.asset(
                      ImagePathAssets.offline,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: AppHeights.h8),
                  const Text(
                    AppStrings.turnWifiMsg,
                    style: TextStyle(fontSize: FontSizes.f25),
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
