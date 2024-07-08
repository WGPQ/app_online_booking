import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_online_booking/src/core/resources.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  final iconCities = AssetsResources.iconCities;
  final iconRoutes = AssetsResources.iconRoutes;
  final iconMap = AssetsResources.iconMap;
  final iconPlus = AssetsResources.iconPlus;

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
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
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: DefaultTabController(
          length: 4,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(AppColor.primary),
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.22),
                  blurRadius: 4.0,
                  spreadRadius: 0.5,
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                )
              ],
            ),
            child: TabBar(
              controller: _controller,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.transparent,
              labelColor: const Color(AppColor.primary),
              labelStyle: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const BoxDecoration(
                color: Colors.white,
              ),
              onTap: (value) => setState(() {
                _controller.index = value;
              }),
              tabs: [
                _buildTab(
                  "Cities",
                  iconCities,
                  0,
                ),
                _buildTab(
                  "Routes",
                  iconRoutes,
                  1,
                ),
                _buildTab("Map", iconMap, 2),
                _buildTab("Other", iconPlus, 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Tab _buildTab(String label, String icon, int index) {
    bool isSelected = _controller.index == index;
    return Tab(
      text: label,
      height: 65,
      icon: SizedBox(
        height: 30,
        child: SvgPicture.asset(icon,
            colorFilter: isSelected
                ? const ColorFilter.mode(
                    Color(AppColor.primary), BlendMode.srcIn)
                : const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
      ),
    );
  }
}
