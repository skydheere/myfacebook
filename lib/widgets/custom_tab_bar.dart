import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final isBottomIndicator;
  const CustomTabBar(
      {Key key,
      @required this.icons,
      @required this.selectedIndex,
      @required this.onTap,
      this.isBottomIndicator=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: isBottomIndicator ? Border(
          bottom: BorderSide(width: 3.0, color: Palette.facebookBlue),
        ):Border(
          top: BorderSide(width: 3.0, color: Palette.facebookBlue),
        ),
      ),
      tabs: icons.asMap()
          .map((i,e) =>MapEntry(i,Tab(
                icon: Icon(e,
                color: i==selectedIndex ?Palette.facebookBlue:Colors.black45,
                ),
                
              ))).values
          .toList(),
      onTap: onTap,
    );
  }
}