import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:app_online_booking/src/core/resources.dart';
import 'package:app_online_booking/src/presentation/classes/fade_route.dart';
import 'package:app_online_booking/src/presentation/ui/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    toHome(context);
  }

  void toHome(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 900));
    Navigator.pushReplacement(context, FadeRoute(page: const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppColor.primary),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 400,
            margin: const EdgeInsets.only(bottom: 50),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  AssetsResources.logo,
                  width: 100,
                  height: 100,
                ),
                const Column(
                  children: [
                    Text(
                      'Borondo',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text("City Stroll",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'sans-serif',
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
