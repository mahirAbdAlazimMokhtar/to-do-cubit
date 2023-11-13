import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/feature/auth/data/model/on_boarding_model.dart';
import 'package:to_do_app/feature/task/presentation/screens/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: PageView.builder(
            itemCount: OnboardingModel.listOfOnboardingModel.length,
            controller: controller,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  index == 2
                      ? Container()
                      : Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            onPressed: () {
                              controller.jumpToPage(2);
                            },
                            child: Text(AppString.skip,
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                          ),
                        ),

                  Image.asset(
                    OnboardingModel.listOfOnboardingModel[index].imagePath,
                  ),
                  const SizedBox(
                    height: 16,
                  ), //Dots
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      spacing: 8,
                      dotHeight: 10,
                    ),
                  ),
                  // Title
                  const SizedBox(height: 50),
                  Text(
                    OnboardingModel.listOfOnboardingModel[index].title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 30),
                  //Subtitle
                  Text(OnboardingModel.listOfOnboardingModel[index].subTitle,
                      style: Theme.of(context).textTheme.displayMedium),
                  const SizedBox(height: 100),
                  //Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      index != 0
                          ? TextButton(
                              onPressed: () {
                                controller.previousPage(
                                    duration: const Duration(microseconds: 5),
                                    curve: Curves.easeInOut);
                              },
                              child: Text(AppString.back,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium),
                            )
                          : Container(),
                      index != 2
                          ? ElevatedButton(
                              style: Theme.of(context).elevatedButtonTheme.style,
                              onPressed: () {
                                controller.nextPage(
                                    duration: const Duration(microseconds: 500),
                                    curve: Curves.easeInOut);
                              },
                              child: Text(AppString.next,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium),
                            )
                          : ElevatedButton(
                              style: Theme.of(context).elevatedButtonTheme.style,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ));
                              },
                              child: Text(AppString.getStarted,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium)),
                    ],
                  ),

                  //Buttons
                ],
              );
            }),
      )),
    );
  }
}
