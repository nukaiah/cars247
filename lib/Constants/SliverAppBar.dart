import 'dart:math';

import 'package:carwash/Constants/AppColors.dart';
import 'package:carwash/Constants/AppStyles.dart';
import 'package:flutter/material.dart';

Widget MySliverAppBar(context,{title}) {
  return SliverAppBar(
    elevation: 0.0,
    automaticallyImplyLeading: false,
    centerTitle: false,
    scrolledUnderElevation: 0.0,
    titleSpacing: 15,
    title: Text(title, style: TxtStyles.headerStyle),
    backgroundColor: bgColor,
    expandedHeight: 60,
    floating: true,
    pinned: false,
    snap: true,
    stretch: true,
    flexibleSpace: const FlexibleSpaceBar(
      stretchModes: [
        StretchMode.zoomBackground,
        StretchMode.blurBackground,
        StretchMode.fadeTitle
      ],
    ),
    actions: [
      Icon(Icons.notifications,color: blackClr),
      const SizedBox(width: 10),
    ],
  );
}

Widget MySliverAppBar1(context, {title}) {
  return SliverAppBar(
    elevation: 0.0,
    leading: IconButton(icon:const Icon(Icons.arrow_back_ios_new),onPressed: (){
      Navigator.pop(context);
    },color: blackClr),
    centerTitle: false,
    scrolledUnderElevation: 0.0,
    titleSpacing: 15,
    title: Text(title, style: TxtStyles.headerStyle),
    backgroundColor: bgColor,
    expandedHeight: 60,
    floating: true,
    pinned: false,
    snap: true,
    stretch: true,
    flexibleSpace: const FlexibleSpaceBar(
      stretchModes: [
        StretchMode.zoomBackground,
        StretchMode.blurBackground,
        StretchMode.fadeTitle
      ],
    ),
    actions: [
      Icon(Icons.notifications,color: blackClr),
      const SizedBox(width: 10),
    ],
  );
}


class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}