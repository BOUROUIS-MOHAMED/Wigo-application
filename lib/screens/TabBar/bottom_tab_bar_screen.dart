import 'package:badges/badges.dart' as badge;
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Badge;

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wigo/screens/Coachs/coach_list_screen.dart';
import 'package:wigo/screens/HomeScreen/home_screen.dart';
import 'package:wigo/screens/Planning/workout_daily_planification_screen.dart';
import 'package:wigo/screens/Profile/profil_screen.dart';
import 'package:wigo/screens/TabBar/side_menu/side_menu.dart';
import 'package:wigo/utils/colors.dart';


class BottomTabBarScreen extends StatefulWidget {


  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<BottomTabBarScreen>
    with TickerProviderStateMixin {

  late AnimationController _animationController;
  late ScrollController _scrollController;
  bool _isScrolled = false;
  int selectedIndex = 0;
  int badge = 0;


  List screens=[
    HomeScreen(),
    CoachListScreen(),
    WokoutDailyPlanificationScreen(),
    ProfileScreen()
  ];

  List<GButton> tabs = [];

  void _tabChanged(int index) {
    badge = badge + 1;
    setState(() {
      selectedIndex = index;
    });
  }

  void handleMenuButtonPressed() {
    print("clicked");
    _advancedDrawerController.showDrawer();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );


    /* MyDiaryScreen(
      animationController: _animationController,
    );*/
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<bool> _getData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }




  void _listenToScrollChange() {
    if (_scrollController.offset >= 100.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  final _advancedDrawerController = AdvancedDrawerController();

  get advancedDrawerController => _advancedDrawerController;



  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.grey.shade900,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: Offset(-20.0, 0.0),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      drawer: SideMenuBar(),
      child: Container(
        color: AppColors.background,
        child: Scaffold(


          backgroundColor: Colors.transparent,
          body: FutureBuilder(
            future: _getData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              } else {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 1500),

                  child: screens[selectedIndex]
                );
              }
            },
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  tabActiveBorder: Border.all(color: Colors.black),
                  gap: 10,
                  color: Colors.grey[600],
                  activeColor: Colors.black,
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  iconSize: 20,
                  textStyle: TextStyle(fontSize: 16, color: Colors.black),
                  padding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 14.5),
                  duration: Duration(milliseconds: 800),
                  tabs: [
                    GButton(
                      icon: Iconsax.home,
                      text: 'home',
                    ),
                    GButton(
                      icon:Iconsax.personalcard ,
                      text: "Coach's",
                      leading: selectedIndex == 1 || badge == 0
                          ? null
                          : Badge(
                        badgeStyle: BadgeStyle(
                          badgeColor: Colors.red.shade100,
                          elevation: 0,
                        ),

                        position:
                        BadgePosition.topEnd(top: -15, end: -15),
                        badgeContent: Text(
                          badge.toString(),
                          style: TextStyle(color: Colors.red.shade900),
                        ),
                        child: Icon(
                          Iconsax.personalcard,
                          size: 20,
                          color: selectedIndex == 1
                              ? Colors.pink
                              : Colors.black,
                        ),
                      ),
                    ),
                    GButton(
                      icon: Iconsax.trend_up,
                      text: 'Planification',
                    ),
                    GButton(
                      icon: LineIcons.user,
                      text: 'Now!',
                      leading: CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(
                            'https://sooxt98.space/content/images/size/w100/2019/01/profile.png'),
                      ),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onTabChange: _tabChanged,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}
