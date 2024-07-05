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
  final String logoPrimary = AssetsResources.logoPrimary;
  final String welcome = 'Welcome to';
  final String borondo = 'Borondo';
  final String cityStroll = 'City Stroll';

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
          bottom: size.height * 0.02,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15.0),
                child: SvgPicture.asset(
                  logoPrimary,
                  width: size.width * 0.19,
                  height: size.width * 0.19,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(welcome,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      )),
                  Text(borondo,
                      style: GoogleFonts.bowlbyOne(
                          textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ))),
                  Transform.translate(
                      offset: const Offset(0, -17),
                      child: Text(cityStroll,
                          style: const TextStyle(
                              color: Color(AppColor.primary),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
