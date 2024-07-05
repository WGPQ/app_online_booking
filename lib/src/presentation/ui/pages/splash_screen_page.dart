import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final String title = 'Borondo';
  final String subTitle = 'City Stroll';

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

    return Scaffold(
      backgroundColor: const Color(AppColor.primary),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: size.height * 0.5,
            margin: EdgeInsets.only(bottom: size.height * 0.05),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  logo,
                  width: logoSize,
                  height: logoSize,
                ),
                Column(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.paytoneOne(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(subTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
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
