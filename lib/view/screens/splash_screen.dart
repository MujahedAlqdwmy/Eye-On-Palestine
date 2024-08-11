import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controllerScale;
  late Animation<double> _animationScale;
  late AnimationController _controllerFade;
  late Animation<double> _animationFade;

  @override
  void initState() {
    _controllerScale = AnimationController(
      duration: const Duration(
        seconds: 2,
      ),
      vsync: this,
      //value: 2,
      lowerBound: 0.75,
      upperBound: 1,
    )..repeat(reverse: true);
    _animationScale = CurvedAnimation(
      parent: _controllerScale,
      curve: Curves.easeInOut,
    );
    _controllerFade = AnimationController(
      duration: const Duration(
        seconds: 2,
      ),
      vsync: this,
    );
    _animationFade = Tween<double>(begin: 0, end: 1).animate(_controllerFade);
    _controllerFade.forward();
    super.initState();
  }

  @override
  dispose() {
    _controllerScale.dispose();
    _controllerFade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SplashControllerImp());
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffF55959),
            AppColor.bgColor,
            Color(0xffF55959),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: FadeTransition(
        opacity: _animationFade,
        child: ScaleTransition(
          scale: _animationScale,
          alignment: Alignment.center,
          child: Center(
            child: Image.asset(
              translationData(
                en: AppImages.logoEn,
                ar: AppImages.logoAr,
              ),
              width: 175,
              height: 175,
            ),
          ),
        ),
      ),
    );
  }
}
