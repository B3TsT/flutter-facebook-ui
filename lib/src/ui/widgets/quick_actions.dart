import 'package:flutter/material.dart';

import 'circle_button.dart';
import '../../widgets/icons/custom_icons.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Row(
          children: const [
            _QuickButton(
                label: 'Gallery',
                color: Color(0xff92BE87),
                iconData: CustomIcons.photos),
            SizedBox(width: 15),
            _QuickButton(
                label: 'Tag Friends',
                color: Color(0xff2880D4),
                iconData: CustomIcons.userFriends),
            SizedBox(width: 15),
            _QuickButton(
                label: 'Live',
                color: Color(0xffFB7171),
                iconData: CustomIcons.videoCamera),
          ],
        ),
      ),
    );
  }
}

class _QuickButton extends StatelessWidget {
  const _QuickButton({
    required this.iconData,
    required this.color,
    required this.label,
  });
  final IconData iconData;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 25),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleButton(
            color: color.withOpacity(0.6),
            iconData: iconData,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(color: color),
          )
        ],
      ),
    );
  }
}
