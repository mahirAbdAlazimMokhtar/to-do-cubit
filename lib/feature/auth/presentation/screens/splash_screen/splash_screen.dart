import 'package:flutter/material.dart';
import 'package:to_do_app/core/database/cache_helper.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/feature/auth/presentation/screens/onboarding_screens/onboarding_screen.dart';

import '../../../../../core/Service/service_locator.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../task/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToSplashScreen() {
    //check the use see the onboarding or not
    bool isVisited = sl<CacheHelper>().getData(key: AppString.onBoardingKey) ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context,
          //if the user seen the onboarding go to the home screen else go to the onboarding screen
          MaterialPageRoute(builder: (context) => isVisited ? const HomeScreen() : const OnboardingScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    navigateToSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.logo,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              AppString.appName,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
