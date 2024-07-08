import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_online_booking/src/core/resources.dart';
import 'package:app_online_booking/src/data/local/local_data.dart';
import 'package:app_online_booking/src/domain/entities/user.dart';
import 'package:app_online_booking/src/infrastructure/api_service.dart';
import 'package:app_online_booking/src/presentation/ui/pages/home_page.dart';
import 'package:app_online_booking/src/presentation/classes/slide_route.dart';
import 'package:app_online_booking/src/presentation/widgets/custom_button.dart';
import 'package:app_online_booking/src/presentation/widgets/banner_container.dart';
import 'package:app_online_booking/src/presentation/widgets/custom_textfield.dart';
import 'package:app_online_booking/src/presentation/widgets/custom_iconbutton.dart';
import 'package:app_online_booking/src/presentation/ui/pages/create_account_page.dart';

import 'package:google_sign_in/google_sign_in.dart';

const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: scopes,
);

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String logoGoogle = AssetsResources.logoGoogle;
  final String logoApple = AssetsResources.logoApple;
  final double sizeIconButton = 50.0;
  final String createAccount = 'Create your account';
  bool isLoading = false;
  ui.Image? image;

  Future<void> loadImage() async {
    const keyName = 'assets/banner.png';
    final data = (await rootBundle.load(keyName));
    final bytes = data.buffer.asUint8List();
    image = await decodeImageFromList(bytes);
    setState(() {});
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final userGoogle = userCredential.user;
      if (userGoogle != null) {
        final user = CustomUser(
            email: userGoogle.email!,
            name: userGoogle.displayName ?? "",
            avatar: userGoogle.photoURL ?? "");
        LocalData.setDataUser(user);
        Navigator.push(
            context,
            SlideTopRoute(
                page: HomePage(
              user: user,
            )));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Error: $e'),
        ),
      );
    }
  }

  @override
  void initState() {
    loadImage();
    super.initState();
  }

  Future<void> _signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    setState(() {
      LocalData.removePreferences();
    });
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
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: size.height * 0.25),
                  SizedBox(
                    height: size.height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _form(size),
                        Text("Forgot your Password?",
                            style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  fontSize: 13.0,
                                  color: Color(AppColor.black),
                                  fontWeight: FontWeight.w700),
                            )),
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
                            Text('or',
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                )),
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
                              onTap: _signInWithGoogle,
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
                            Navigator.push(context,
                                SlideTopRoute(page: const CreateAccountPage()))
                          }),
                ],
              ),
            ),
          ),
          BannerContainer(
            image: image,
          ),
        ],
      ),
    );
  }

  Widget _form(Size size) {
    return Form(
      child: Column(
        children: [
          CustomTextField(
            controller: _emailController,
            label: "Email",
            icon: Icons.email_outlined,
            type: TextInputType.emailAddress,
          ),
          CustomTextField(
            controller: _passwordController,
            label: "Password",
            icon: Icons.lock_outline,
            type: TextInputType.visiblePassword,
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          CustomButton(
              text: 'Login',
              waiting: isLoading,
              backgroundColor: const Color(AppColor.primary),
              textColor: const Color(AppColor.black),
              onPressed: () async {
                try {
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Please fill all fields'),
                      ),
                    );
                    return;
                  }
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 1));
                  final user = await ApiService()
                      .login(_emailController.text, _passwordController.text);
                  if (user == null) {
                    setState(() {
                      isLoading = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Invalid credentials'),
                      ),
                    );
                    return;
                  }
                  LocalData.setDataUser(user);
                  Navigator.push(
                      context,
                      SlideTopRoute(
                          page: HomePage(
                        user: user,
                      )));
                  isLoading = false;
                  setState(() {});
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Error: $e'),
                    ),
                  );
                } finally {
                  setState(() {
                    isLoading = false;
                  });
                }
              }),
        ],
      ),
    );
  }
}
