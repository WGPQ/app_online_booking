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
  final String logo = AssetsResources.logo;
  final String logoBorondoBlack = AssetsResources.logoBorondoBlack;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      toHome(context);
    });
  }

  void toHome(BuildContext context) async {
    Navigator.pushReplacement(context, FadeRoute(page: const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final logoSize = size.width * 0.25;
    final logoBarondoSize = size.width * 0.15;

    return Scaffold(
      backgroundColor: const Color(AppColor.primary),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: size.height * 0.5,
            margin: EdgeInsets.only(bottom: size.height * 0.03),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  logo,
                  width: logoSize,
                  height: logoSize,
                ),
                SvgPicture.asset(
                  logoBorondoBlack,
                  width: logoBarondoSize,
                  height: logoBarondoSize,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
