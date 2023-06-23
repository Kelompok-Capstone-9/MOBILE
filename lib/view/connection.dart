import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/splash_screen/splash_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionErrorScreen extends StatefulWidget {
  const ConnectionErrorScreen({Key? key}) : super(key: key);

  @override
  State<ConnectionErrorScreen> createState() => _ConnectionErrorScreenState();
}

class _ConnectionErrorScreenState extends State<ConnectionErrorScreen> {
  bool isRetrying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Connection Error',
              style: ThemeText.heading1,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: ColorsTheme.activeButton,
              ),
              child: isRetrying
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      'Retry',
                      style: ThemeText.headingTextPlan,
                    ),
              onPressed: () async {
                if (isRetrying) return;

                setState(() {
                  isRetrying = true;
                });

                bool isConnected =
                    await InternetConnectionChecker().hasConnection;
                if (isConnected) {
                  await Future.delayed(const Duration(seconds: 1));
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SplashScreen(),
                    ),
                  );
                } else {
                  setState(() {
                    isRetrying = false;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
