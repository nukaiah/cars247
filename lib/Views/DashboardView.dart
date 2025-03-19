import 'dart:async';
import 'package:carwash/Constants/AppColors.dart';
import 'package:carwash/Constants/AppStyles.dart';
import 'package:carwash/Constants/SliverAppBar.dart';
import 'package:carwash/Views/BookAppointmentView.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final PageController pageController = PageController();
  int currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if(currentPage>AppList.bannerList.length-1){
        currentPage=0;
        pageController.jumpToPage(0);
      }
      else{
        currentPage++;
        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.linear,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        MySliverAppBar(context, title: "Dashboard"),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 150,
            width: size.width,
            child: PageView.builder(
              controller: pageController,
              allowImplicitScrolling: true,
              scrollDirection: Axis.horizontal,
              itemCount: AppList.bannerList.length,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value){
                if(currentPage>AppList.bannerList.length-1){
                  currentPage=0;
                  pageController.jumpToPage(0);
                }
                else{
                  currentPage = value;
                  pageController.animateToPage(
                    value,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.linear,
                  );
                }
                setState((){});
              },
              itemBuilder: (_,i){
                return Container(
                  height: 150,
                  width: size.width,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(AppList.bannerList[i]),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill)),
                );
              },
            ),
          )
        ),
        SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              height: 6,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: AppList.bannerList.length,
                itemBuilder: (_,i){
                  return AnimatedContainer(
                    height: 6,
                    width: currentPage==i?14:6,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: currentPage==i?indClr:greyClr,
                      borderRadius: BorderRadius.circular(20)
                    ),
                  );
                },
              ),
            )
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("My Vehicles", style: TxtStyles.headerStyle),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              width: size.width,
              child: ListView.separated(
                separatorBuilder: (_,i)=>const SizedBox(width: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemCount: AppList.servicesList.length-6,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (_,i){
                  return Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: greyClr.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.electric_bike,size: 30,color: AppList.servicesList[i].color,),
                        Text("Bike",style: TxtStyles.smallHintStyle),
                        Text("TS09AB01$i$i",style: TxtStyles.inputStyle)
                      ],
                    ),
                  );
                },
              ),
            )
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("Services Offered", style: TxtStyles.headerStyle),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverToBoxAdapter(
          child: GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.1,
            ),
            children: AppList.servicesList
                .map((e) => InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>BookAppointmentView(carWashService: e)));
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: e.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(e.icon,size: 35,color: e.color),
                    const SizedBox(height: 10),
                    Text(
                      e.name,
                      style: TxtStyles.inputStyle,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ))
                .toList(),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),

      ],
    );
  }
}

class CarWashService {
  IconData icon;
  String name;
  Color color;
  CarWashService({required this.name, required this.icon,required this.color});
}

class AppList {
  static List<String> bannerList = [
    "assets/banners/banner1.jpg",
    "assets/banners/banner2.jpg",
    "assets/banners/banner4.jpg",
    "assets/banners/banner6.jpeg",
    "assets/banners/banner7.jpg",
  ];

  static List<CarWashService> servicesList = [
    CarWashService(name: "Full Service", icon: Icons.car_rental, color: g1),
    CarWashService(name: "Exterior Wash", icon: Icons.local_car_wash, color: g2),
    CarWashService(name: "Waxing", icon: Icons.auto_awesome, color: g3),
    CarWashService(name: "Interior Cleaning", icon: Icons.cleaning_services, color: g4),
    CarWashService(name: "Tire Cleaning", icon: Icons.tire_repair, color: g1),
    CarWashService(name: "Engine Cleaning", icon: Icons.engineering, color: g2),
    CarWashService(name: "UnderBody Wash", icon: Icons.format_color_fill, color: g3),
    CarWashService(name: "Polishing", icon: Icons.auto_fix_high, color: g4),
    CarWashService(name: "Vacuuming", icon: Icons.air, color: g1),
    CarWashService(name: "Glass Cleaning", icon: Icons.window, color: g2),
  ];

}
