import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';
import 'package:app_online_booking/src/core/resources.dart';
import 'package:app_online_booking/src/presentation/classes/fade_route.dart';
import 'package:app_online_booking/src/presentation/widgets/custom_button.dart';
import 'package:app_online_booking/src/presentation/widgets/banner_container.dart';
import 'package:app_online_booking/src/presentation/widgets/custom_textfield.dart';
import 'package:app_online_booking/src/presentation/widgets/custom_iconbutton.dart';
import 'package:app_online_booking/src/presentation/ui/pages/create_account_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String logoGoogle = AssetsResources.logoGoogle;
  final String logoApple = AssetsResources.logoApple;
  final double sizeIconButton = 50.0;

  final String createAccount = 'Create your account';

  ui.Image? image;
  Future<void> loadImage() async {
    const keyName = 'assets/banner.png';
    final data = (await rootBundle.load(keyName));
    final bytes = data.buffer.asUint8List();
    image = await decodeImageFromList(bytes);
    setState(() {});
  }

  @override
  void initState() {
    loadImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              BannerContainer(
                image: image,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                height: size.height * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: size.height * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _form(size),
                          const Text(
                            "Forgot your Password?",
                            style: TextStyle(
                                fontSize: 13.0,
                                color: Color(AppColor.black),
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 2,
                                width: size.width * 0.3,
                                margin: const EdgeInsets.only(right: 10.0),
                                color: Colors.grey[300],
                              ),
                              const Text(
                                'or',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 2,
                                width: size.width * 0.3,
                                margin: const EdgeInsets.only(left: 10.0),
                                color: Colors.grey[300],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomIconButton(
                                onTap: () => {},
                                size: size.width * 0.13,
                                icon: SvgPicture.asset(
                                  logoGoogle,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              CustomIconButton(
                                onTap: () => {},
                                size: size.width * 0.13,
                                icon: SvgPicture.asset(
                                  logoApple,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                        text: createAccount,
                        backgroundColor: const Color(AppColor.red),
                        textColor: const Color(AppColor.white),
                        onPressed: () => {
                              Navigator.pushReplacement(context,
                                  FadeRoute(page: const CreateAccountPage()))
                            }),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _form(Size size) {
    return Form(
      child: Column(
        children: [
          const CustomTextField(
            label: "Email",
            icon: Icons.email_outlined,
            type: TextInputType.emailAddress,
          ),
          const CustomTextField(
            label: "Password",
            icon: Icons.lock_outline,
            type: TextInputType.visiblePassword,
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          CustomButton(
              text: 'Login',
              backgroundColor: const Color(AppColor.primary),
              textColor: const Color(AppColor.black),
              onPressed: () => {
                    Navigator.pushReplacement(
                        context, FadeRoute(page: const CreateAccountPage()))
                  }),
        ],
      ),
    );
  }
}
