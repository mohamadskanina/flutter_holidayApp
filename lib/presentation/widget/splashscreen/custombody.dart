import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/core/constant/colorapp.dart';
import 'package:myapp/core/constant/image_assets.dart';
import 'package:myapp/core/constant/textstyleapp.dart';

class CustomBodySplashScreen extends StatelessWidget {
  const CustomBodySplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            AppImageAssets.logo,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          Text(
            "Holidays App",
            style: AppTextStyle.h1Font.copyWith(color: AppColor.primaryColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Find out the public holidays in your country",
            style: AppTextStyle.largeFont,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Lottie.asset(AppImageAssets.loading),
          const SizedBox(
            height: 30,
          ),
        ]);
  }
}
