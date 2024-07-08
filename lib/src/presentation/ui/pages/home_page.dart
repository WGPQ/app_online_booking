import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_online_booking/src/core/resources.dart';
import 'package:app_online_booking/src/domain/entities/user.dart';
import 'package:app_online_booking/src/data/local/local_data.dart';
import 'package:app_online_booking/src/domain/entities/cities.dart';
import 'package:app_online_booking/src/presentation/classes/slide_route.dart';
import 'package:app_online_booking/src/presentation/ui/pages/login_page.dart';
import 'package:app_online_booking/src/presentation/widgets/custom_tab_bar.dart';
import 'package:app_online_booking/src/presentation/widgets/custom_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.user});
  final CustomUser user;
  final avatarUser = AssetsResources.avatarUser;
  final iconFilter = AssetsResources.iconFilter;

  final List<Cities> _cities = [
    Cities(
        name: "London",
        image: AssetsResources.london,
        cities: CitiesClass(available: 5, completed: 3),
        famousPlaces: CitiesClass(available: 12, completed: 8),
        traveled: 143),
    Cities(
        name: 'Paris',
        image: AssetsResources.paris,
        cities: CitiesClass(
          available: 10,
          completed: 1,
        ),
        famousPlaces: CitiesClass(
          available: 22,
          completed: 8,
        ),
        traveled: 6),
    Cities(
        name: 'New York',
        image: AssetsResources.newYork,
        cities: CitiesClass(
          available: 8,
          completed: 8,
        ),
        famousPlaces: CitiesClass(
          available: 16,
          completed: 16,
        ),
        traveled: 203),
    Cities(
        name: 'Japón',
        image: AssetsResources.japan,
        cities: CitiesClass(
          available: 5,
          completed: 3,
        ),
        famousPlaces: CitiesClass(
          available: 12,
          completed: 8,
        ),
        traveled: 143),
    Cities(
        name: 'África',
        image: AssetsResources.africa,
        cities: CitiesClass(
          available: 3,
          completed: 3,
        ),
        famousPlaces: CitiesClass(
          available: 8,
          completed: 8,
        ),
        traveled: 143),
    Cities(
        name: 'Ecuador',
        image: AssetsResources.ecuador,
        cities: CitiesClass(
          available: 3,
          completed: 2,
        ),
        famousPlaces: CitiesClass(
          available: 8,
          completed: 2,
        ),
        traveled: 143),
    Cities(
        name: 'Perú',
        image: AssetsResources.africa,
        cities: CitiesClass(
          available: 3,
          completed: 1,
        ),
        famousPlaces: CitiesClass(
          available: 11,
          completed: 7,
        ),
        traveled: 143),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.grey[90],
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
                        return _cardCity(
                            _cities[index], index == _cities.length - 1);
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

Widget _cardCity(Cities cities, bool last) {
  return Card(
    margin: EdgeInsets.only(bottom: last ? 85.0 : 15.0),
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
              cities.image,
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
                        cities.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      if (cities.cities.available == cities.cities.completed)
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
                            '${cities.cities.available}',
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
                                child: Text('${cities.cities.completed}',
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
                            '${cities.famousPlaces.available}',
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
                                child: Text('${cities.famousPlaces.completed}',
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
                            '${cities.traveled}',
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
