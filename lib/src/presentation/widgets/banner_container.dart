import 'dart:ui' as ui;
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_online_booking/src/core/resources.dart';
import 'package:app_online_booking/src/presentation/widgets/container_painter.dart';

class BannerContainer extends StatelessWidget {
  const BannerContainer({super.key, this.image, this.height});

  final ui.Image? image;
  final double? height;
  final String logoBorondo = AssetsResources.logoBorondo;
  final String welcome = 'Welcome to';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CustomPaint(
          size: Size(size.width, height ?? size.height * 0.35),
          painter: ConicalContainerPainter(
              color: const Color(AppColor.black), image: image),
        ),
        Positioned(
          bottom: size.height * 0.04,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: size.width * 0.19),
                    child: Text(welcome,
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                          ),
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 15.0),
                    child: SvgPicture.asset(
                      logoBorondo,
                      width: size.width * 0.19,
                      height: size.width * 0.19,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
