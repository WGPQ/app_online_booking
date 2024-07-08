import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_online_booking/src/core/resources.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: DefaultTabController(
          length: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TabBar(
              controller: _controller,
              unselectedLabelColor: Colors.black,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              labelColor: const Color(AppColor.white),
              labelStyle: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const BoxDecoration(
                color: Color(AppColor.primary),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              onTap: (value) => setState(() {
                _controller.index = value;
              }),
              tabs: const [
                Tab(text: "Countries"),
                Tab(text: "Cities"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
