import 'package:carwash/Constants/AppColors.dart';
import 'package:carwash/Constants/AppStyles.dart';
import 'package:carwash/Views/DashboardView.dart';
import 'package:carwash/Views/HistoryView.dart';
import 'package:carwash/Views/ProfileView.dart';
import 'package:flutter/material.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: loadBody()),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          backgroundColor: bgColor,
          selectedItemColor: indClr,
          unselectedItemColor: greyClr,
          selectedLabelStyle: TxtStyles.labelStyle,
          unselectedLabelStyle: TxtStyles.hintStyle,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          items: bottomList
              .asMap()
              .entries
              .map(
                (e) => BottomNavigationBarItem(
                    icon: AnimatedContainer(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                            color: currentIndex == e.key
                                ? indClr.withOpacity(0.25)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(15)),
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn,
                        child: Icon(e.value.icon)),
                    label: e.value.name),
              )
              .toList()),
    );
  }

  loadBody() {
    if (currentIndex == 0) {
      return const DashboardView();
    } else if (currentIndex == 1) {
      return const HistoryView();
    } else {
      return const ProfileView();
    }
  }

  List<CarWashService> bottomList = [
    CarWashService(
        name: "Dashboard", icon: Icons.dashboard_rounded, color: bgColor),
    CarWashService(
        name: "History", icon: Icons.access_time_rounded, color: bgColor),
    CarWashService(name: "Profile", icon: Icons.person_rounded, color: bgColor),
  ];
}
