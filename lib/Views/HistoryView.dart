import 'package:carwash/Constants/AppButtons.dart';
import 'package:carwash/Constants/AppColors.dart';
import 'package:carwash/Constants/AppStyles.dart';
import 'package:carwash/Constants/SliverAppBar.dart';
import 'package:carwash/Views/DashboardView.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        MySliverAppBar(context, title: "History"),
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverAppBarDelegate(
              minHeight: 50,
              maxHeight: 50,
              child: Container(
                color: bgColor,
                child: DefaultTabController(
                  length: TabList.appTabList.length,
                  child: TabBar(
                      padding: EdgeInsets.zero,
                      dividerColor: Colors.transparent,
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      labelStyle: TxtStyles.inputStyle,
                      indicatorColor: indClr,
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      tabs: TabList.appTabList
                          .map((e) => Tab(
                                  child: Row(
                                children: [
                                  Icon(
                                    e.icon,
                                    color: e.color,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(e.name)
                                ],
                              )))
                          .toList()),
                ),
              )),
        ),
        SliverToBoxAdapter(
            child: ListView.separated(
          separatorBuilder: (_, i) => const SizedBox(height: 15),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: AppList.servicesList.length,
          padding: const EdgeInsets.all(10),
          itemBuilder: (_, i) {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: greyClr.withOpacity(0.15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: g3.withOpacity(0.2)),
                    child: Text(
                      "Completed",
                      style: TxtStyles.customStyle(color: g3),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(AppList.servicesList[i].icon,
                          size: 50, color: AppList.servicesList[i].color),
                      const SizedBox(width: 20),
                      Text(AppList.servicesList[i].name,
                          style: TxtStyles.labelStyle)
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("OrderId", style: TxtStyles.hintStyle),
                          Text("0xFF1234", style: TxtStyles.inputStyle),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Order Date", style: TxtStyles.hintStyle),
                          Text("25-Dec-24", style: TxtStyles.inputStyle),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Payment", style: TxtStyles.hintStyle),
                          Text("\$67", style: TxtStyles.inputStyle),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Divider(),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          child: MyOutlineButton(title: "Leave Review")),
                      const SizedBox(width: 20),
                      Flexible(
                          fit: FlexFit.tight,
                          child: MyFillButton(title: "E-Receipt")),
                    ],
                  )
                ],
              ),
            );
          },
        ))
      ],
    );
  }
}

class TabList {
  static List<CarWashService> appTabList = [
    CarWashService(
        icon: Icons.access_time_filled_rounded, name: "Ongoing", color: g1),
    CarWashService(
        icon: Icons.check_circle_rounded, name: "Completed", color: g3),
    CarWashService(icon: Icons.cancel_rounded, name: "Cancelled", color: g4),
  ];
}
