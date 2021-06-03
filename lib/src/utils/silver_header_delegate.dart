import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {

  SliverAppBarDelegate(this._tabBar,this.padding);

  final TabBar _tabBar;
  double padding = 0;

  @override
  double get minExtent => padding == 15? 25:23;
  @override
  double get maxExtent => padding == 15?28:23;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left:padding,right: padding),
        child: _tabBar,
      ),
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
