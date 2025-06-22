import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/routes/route_name.dart';
import 'package:todo/core/utils/app_images_url.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      context.goNamed(RouteName.home);
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AppImages.logo, height: 80, width: 80)),
    );
  }
}
