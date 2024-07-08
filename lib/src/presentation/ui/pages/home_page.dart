import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_online_booking/src/core/resources.dart';
import 'package:app_online_booking/src/data/local/local_data.dart';
import 'package:app_online_booking/src/domain/entities/user.dart';
import 'package:app_online_booking/src/presentation/classes/slide_route.dart';
import 'package:app_online_booking/src/presentation/ui/pages/login_page.dart';
import 'package:app_online_booking/src/presentation/widgets/custom_tab_bar.dart';
import 'package:app_online_booking/src/presentation/widgets/custom_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.user});
  final CustomUser user;
  final avatarUser = AssetsResources.avatarUser;
  final iconFilter = AssetsResources.iconFilter;

  final List<dynamic> _cities = [
    {
      'name': 'London',
      'image': AssetsResources.london,
      'cities': {
        'Available': 5,
        'Completed': 3,
      },
      'famous_places': {
        'Available': 12,
        'Completed': 8,
      },
      'traveled': 143
    },
    {
      'name': 'Paris',
      'image': AssetsResources.paris,
      'cities': {
        'Available': 10,
        'Completed': 1,
      },
      'famous_places': {
        'Available': 22,
        'Completed': 8,
      },
      'traveled': 6
    },
    {
      'name': 'New York',
      'image': AssetsResources.newYork,
      'cities': {
        'Available': 8,
        'Completed': 8,
      },
      'famous_places': {
        'Available': 16,
        'Completed': 16,
      },
      'traveled': 203
    },
    {
      'name': 'Japón',
      'image': AssetsResources.japan,
      'cities': {
        'Available': 5,
        'Completed': 3,
      },
      'famous_places': {
        'Available': 12,
        'Completed': 8,
      },
      'traveled': 143
    },
    {
      'name': 'África',
      'image': AssetsResources.londres,
      'cities': {
        'Available': 3,
        'Completed': 3,
      },
      'famous_places': {
        'Available': 8,
        'Completed': 8,
      },
      'traveled': 143
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          margin: EdgeInsets.only(top: size.height * 0.01),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Destinations",
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 21.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black)),
                      ),
                      InkWell(
                        onLongPress: () {
                          LocalData.removePreferences();
                          Navigator.pushReplacement(context,
                              SlideRightRoute(page: const LoginPage()));
                        },
                        child: CircleAvatar(
                          backgroundImage: user.avatar != null
                              ? Image.network(user.avatar!).image
                              : AssetImage(avatarUser),
                          radius: 25.0,
                          backgroundColor: const Color(AppColor.primary),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey)),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 35.0,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.05, vertical: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(AppColor.primary)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: const Color(AppColor.primary).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: double.infinity,
                    child: const CustomTabBar(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  padding: WidgetStateProperty.all(
                                      const EdgeInsets.only(
                                          right: 5.0, left: 0))),
                              child: Text(
                                "All",
                                style: _styleTextButton(true),
                              )),
                          TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  padding: WidgetStateProperty.all(
                                      const EdgeInsets.only(left: 0.0))),
                              child: Text(
                                "Completed",
                                style: _styleTextButton(false),
                              )),
                          TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  padding: WidgetStateProperty.all(
                                      const EdgeInsets.only(left: 15.0))),
                              child: Text(
                                "Not Completed",
                                style: _styleTextButton(false),
                              )),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(iconFilter,
                            height: 15,
                            width: 15,
                            colorFilter: const ColorFilter.mode(
                                Colors.grey, BlendMode.srcIn)),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    height: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _cities.length,
                      itemBuilder: (context, index) {
                        return _cardCity(_cities, index, _cities.length - 1);
                      },
                    ),
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: CustomBottomNavigationBar(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _cardCity(dynamic cities, int index, int length) {
  return Card(
    elevation: 0.5,
    margin: EdgeInsets.only(bottom: index == length ? 85.0 : 15.0),
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              cities[index]['image'],
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 7.0, vertical: 2.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cities[index]['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      if (cities[index]['cities']['Available'] ==
                          cities[index]['cities']['Completed'])
                        Container(
                            height: 30,
                            width: 50,
                            decoration: const BoxDecoration(
                                color: Color(AppColor.primary),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50.0),
                                  bottomLeft: Radius.circular(200.0),
                                )),
                            child: const Icon(Icons.check, color: Colors.black))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cities',
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                          Text(
                            '${cities[index]['cities']['Available']}',
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 9.0,
                                backgroundColor: const Color(AppColor.primary)
                                    .withOpacity(0.2),
                                child: Text(
                                    '${cities[index]['cities']['Completed']}',
                                    style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                      fontSize: 9.0,
                                      color: Color(AppColor.primary),
                                      fontWeight: FontWeight.w400,
                                    ))),
                              ),
                              const SizedBox(width: 1.0),
                              Text("Completed",
                                  style: GoogleFonts.openSans(
                                      textStyle: const TextStyle(
                                    fontSize: 9.0,
                                    color: Color(AppColor.primary),
                                    fontWeight: FontWeight.w400,
                                  ))),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Famous places',
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                          Text(
                            '${cities[index]['famous_places']['Available']}',
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 9.0,
                                backgroundColor: const Color(AppColor.primary)
                                    .withOpacity(0.2),
                                child: Text(
                                    '${cities[index]['famous_places']['Completed']}',
                                    style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                      fontSize: 9.0,
                                      color: Color(AppColor.primary),
                                      fontWeight: FontWeight.w400,
                                    ))),
                              ),
                              const SizedBox(width: 2.0),
                              Text("Completed",
                                  style: GoogleFonts.openSans(
                                      textStyle: const TextStyle(
                                    fontSize: 9.0,
                                    color: Color(AppColor.primary),
                                    fontWeight: FontWeight.w400,
                                  ))),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Traveled',
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                          Text(
                            '${cities[index]['traveled']}',
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                          Text(
                            'Km',
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

TextStyle _styleTextButton(bool active) {
  return GoogleFonts.openSans(
      textStyle: TextStyle(
          fontSize: 12.0,
          color: active ? const Color(AppColor.primary) : Colors.grey,
          fontWeight: FontWeight.w700));
}
