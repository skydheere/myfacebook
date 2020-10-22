import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionsList extends StatelessWidget {
  final List<List> _moreOptionList = const [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Freinds'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Market Palce '],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStar, Colors.red, 'Events'],
  ];
  final User currentUser;
  const MoreOptionsList({Key key, @required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: 280.0),
        child: ListView.builder(
            itemCount: 1 + _moreOptionList.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: UserCard(currentUser: currentUser));
              }
              final List options = _moreOptionList[index-1];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: _Options(
                    icon: options[0], color: options[1], label: options[2]),
              );
            }));
  }
}

class _Options extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  const _Options(
      {Key key,
      @required this.icon,
      @required this.color,
      @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(icon, size: 38.0, color: color),
          const SizedBox(
            width: 8.0,
          ),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
