import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultPage extends StatelessWidget {
  const ResultPage._();

  static void show({required BuildContext context}) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => const Material(child: ResultPage._()),
        settings: const RouteSettings(name: 'resultPage'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'AppShipment',
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 36,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 20),
                  SvgPicture.asset(
                    'assets/svg/delivery_truck.svg',
                    height: 50,
                    colorFilter: const ColorFilter.mode(
                      Colors.orange,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Image.asset(
                  'assets/images/box.png',
                  height: 120,
                ),
              ),
              const Spacer(),
              const Text(
                'Total Estimated Amount',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Countup(
                    suffix: ' USD',
                    begin: 1400,
                    end: 1453,
                    duration: const Duration(seconds: 2),
                    style: const TextStyle(fontSize: 36),
                  ),
                ],
              ),
              const Text(
                'This amount is estimated this will vary if you change your location or weight',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Back to home',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
