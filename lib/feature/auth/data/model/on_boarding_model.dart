import 'package:to_do_app/core/utils/app_strings.dart';

import '../../../../core/utils/app_assets.dart';

class OnboardingModel {
  final String imagePath;
  final String title;
  final String subTitle;

  OnboardingModel({
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });

  static List<OnboardingModel> listOfOnboardingModel = [
    OnboardingModel(
        imagePath: AppAssets.on1,
        title: AppString.onBoardingTitleOne,
        subTitle: AppString.onBoardingSubTitleOne),
    OnboardingModel(
        imagePath: AppAssets.on2,
        title: AppString.onBoardingTitleTwo,
        subTitle: AppString.onBoardingSubTitleTwo),
    OnboardingModel(
        imagePath: AppAssets.on3,
        title: AppString.onBoardingTitleThree,
        subTitle: AppString.onBoardingSubTitleThree),
  ];
}
