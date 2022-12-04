import 'package:flutter/material.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    required Key key,
    required this.icon,
    required this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      margin: EdgeInsets.symmetric(
        horizontal: 2,
      ).copyWith(
        bottom: 10,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: 50,
          ),
          SizedBox(width: 10,),
          Text(
            text,
          ),
          Spacer(),
          if (hasNavigation)
            Icon(
              Icons.arrow_right_alt,
              size: 12,
            ),
        ],
      ),
    );
  }
}