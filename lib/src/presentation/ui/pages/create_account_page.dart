import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_online_booking/src/core/resources.dart';
import 'package:app_online_booking/src/presentation/classes/slide_route.dart';
import 'package:app_online_booking/src/presentation/ui/pages/login_page.dart';
import 'package:app_online_booking/src/presentation/widgets/custom_button.dart';
import 'package:app_online_booking/src/presentation/widgets/banner_container.dart';
import 'package:app_online_booking/src/presentation/widgets/custom_textfield.dart';
import 'package:app_online_booking/src/presentation/widgets/custom_date_picker.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  ui.Image? image;

  final avatarUser = AssetsResources.avatarUser;
  final String createAccount = 'Create Account';
  final String providesData = 'provide basic data';

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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.30),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              createAccount,
                              style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              )),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -5),
                              child: Text(
                                providesData,
                                style: GoogleFonts.openSans(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100.0,
                          width: 110.0,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black12,
                                radius: 50.0,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(avatarUser),
                                  radius: 45.0,
                                  backgroundColor:
                                      const Color(AppColor.primary),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Color(AppColor.primary),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () async {},
                                    icon: const Icon(
                                      Icons.add_photo_alternate_outlined,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  _form(size),
                  SizedBox(height: size.height * 0.05),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(
                        context, SlideRightRoute(page: const LoginPage())),
                    child: Text.rich(TextSpan(
                      text: 'Already have an account? ',
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 16.0,
                            color: Color(AppColor.black),
                            fontWeight: FontWeight.w400),
                      ),
                      children: [
                        TextSpan(
                          text: 'Sing in',
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 16.0,
                                color: Color(AppColor.primary),
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    )),
                  )
                ],
              ),
            ),
          ),
          BannerContainer(
            image: image,
            height: size.height * 0.30,
          ),
        ],
      ),
    );
  }
}

Widget _form(Size size) {
  return Container(
    width: size.width,
    color: Colors.white,
    child: Column(
      children: [
        const CustomTextField(
          label: "Name",
          icon: Icons.person_outline,
          type: TextInputType.text,
        ),
        const CustomTextField(
          label: "Email",
          icon: Icons.email_outlined,
          type: TextInputType.emailAddress,
        ),
        const CustomTextField(
          label: "Phone",
          icon: Icons.phone_outlined,
          type: TextInputType.phone,
        ),
        const CustomTextField(
          label: "Nationality",
          icon: Icons.location_city_outlined,
          type: TextInputType.emailAddress,
        ),
        const CustomDatePicker(
          label: "Birthday date",
          icon: Icons.date_range_outlined,
          type: TextInputType.emailAddress,
        ),
        const CustomTextField(
          label: "Password",
          icon: Icons.lock_outline,
          type: TextInputType.visiblePassword,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: CustomButton(
            text: 'Create Account',
            backgroundColor: const Color(AppColor.primary),
            textColor: Colors.black,
            onPressed: () => {},
          ),
        )
      ],
    ),
  );
}
